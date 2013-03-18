/*
 * Driver.cpp
 *
 *  Created on: 2013-03-06
 *      Author: gperry
 */

#include "Driver.h"
#include <bb/data/XmlDataAccess>

Driver::Driver() {
	m_name      = "";
	m_address   = "";
	m_address2  = "";
	m_city      = "";
	m_state     = "";
	m_country   = "";
	m_telephone = "";
	m_email     = "";
}

Driver::~Driver() {
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
	qDebug() << "c++ saveDriverInfoToFile";

	// Create QVariantMap objects to contain the data for each driver
	QVariantMap firstDriver;

	// Populate each object with data
	firstDriver["name"]      = QVariant(m_name);
	firstDriver["address"]   = QVariant(m_address);
	firstDriver["address2"]  = QVariant(m_address2);
	firstDriver["city"]      = QVariant(m_city);
	firstDriver["state"]     = QVariant(m_name);
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

	// Retrieve the working dir and create a temp xml file
	QDir home = QDir::home();
	QTemporaryFile file(home.absoluteFilePath("drivers.xml"));
	if (file.open()) {
		//XmlDataAccess xda;
		//xda.save(myData, &file);
	}

}

