/*
 * Driver.cpp
 *
 *  Created on: 2013-03-06
 *      Author: gperry
 */

#include "Driver.h"

#include <bb/data/XmlDataAccess>
#include <QFile>

using namespace bb::data;

/**
 * Constructor for Driver; clears instance variables and tries to read in from file.
 */
Driver::Driver() {
    m_editMode  = false;
	m_name      = "";
	m_address   = "";
	m_address2  = "";
	m_city      = "";
	m_state     = "";
	m_country   = "";
	m_telephone = "";
	m_email     = "";
	m_postcode  = "";
	loadDriverFromConfig();

}

Driver::~Driver() {
}

/**
 * On Startup see if we can read in from the XML file and populate the object
 */
void Driver::loadDriverFromConfig() {

    XmlDataAccess xda;
    QVariant list = xda.load(QDir::currentPath() + "/data/drivers.xml");
    if (!list.isNull() && list.canConvert(QVariant::Map)) {

        QMap<QString, QVariant> topLevelDriverMap = list.toMap();

        QVariant vMyDriverList = topLevelDriverMap.value("driver");
        if (vMyDriverList.canConvert(QVariant::Map)) {

            QVariantMap vFirstDriver = vMyDriverList.toMap();
            m_name      = vFirstDriver["name"].toString();
            m_address   = vFirstDriver["address"].toString();
            m_address2  = vFirstDriver["address2"].toString();
            m_city      = vFirstDriver["city"].toString();
            m_state     = vFirstDriver["state"].toString();
            m_postcode  = vFirstDriver["postcode"].toString();
            m_country   = vFirstDriver["country"].toString();
            m_telephone = vFirstDriver["telephone"].toString();
            m_email     = vFirstDriver["email"].toString();
        }
    }
    else {
        qDebug() << "No File Opened so Empty Record";
    }
}

/**
 * Create Driver Info has terminated so save the QML data into the Driver object data
 */
Q_INVOKABLE void Driver::saveDriverInfo (QString name,
		                                 QString address,
		                                 QString address2,
		                                 QString city,
		                                 QString state,
		                                 QString country,
		                                 QString postcode,
		                                 QString tel,
		                                 QString email)
{
	setDriverName(name);
	setDriverAddress(address);
	setDriverAddress2(address2);
    setDriverCity(city);
    setDriverState(state);
    setDriverPostcode(postcode);
    setDriverCountry(country);
    setDriverTelephone(tel);
    setDriverEmail(email);

    // Emit signal that tells the QML to refresh
	emit driverChanged();
}

/**
 * Save the current Driver info to the file driver.xml
 */
Q_INVOKABLE void Driver::saveDriverInfoToFile ()
{
	qDebug() << "saveDriverInfoToFile";

	// Create QVariantMap objects to contain the data for each driver
	QVariantMap firstDriver;

	// Populate each object with data
	firstDriver["name"]      = QVariant(m_name);
	firstDriver["address"]   = QVariant(m_address);
	firstDriver["address2"]  = QVariant(m_address2);
	firstDriver["city"]      = QVariant(m_city);
	firstDriver["state"]     = QVariant(m_state);
	firstDriver["postcode"]  = QVariant(m_postcode);
	firstDriver["country"]   = QVariant(m_country);
	firstDriver["telephone"] = QVariant(m_telephone);
	firstDriver["email"]     = QVariant(m_email);

	// Add each driver to a QVariantList
	QVariantList myDriverList = QVariantList() << QVariant(firstDriver);

	// Add the driver list to a top-level QVariantMap, then wrap it in a QVariant
	QVariantMap topLevelDriverMap;
	topLevelDriverMap[".root"] = QVariant("drivers");
	topLevelDriverMap["driver"] = QVariant(myDriverList);
	QVariant myData = QVariant(topLevelDriverMap);

	// Retrieve the working dir and create an xml file
	QDir home = QDir::home();
	home.cd("data");
	qDebug() << home;
	QFile file(home.absoluteFilePath("drivers.xml"));
	if (file.open(QIODevice::ReadWrite | QIODevice::Text)) {
		XmlDataAccess xda;
		xda.save(myData, &file);
	}
	file.close();
}

/**
 * Are we in Edit or Compose Mode for the Vehicle data
 */
Q_INVOKABLE bool Driver::driverEdit() {
    return m_editMode;
}


