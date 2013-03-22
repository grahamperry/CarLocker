/*
 * Vehicle.cpp
 *
 *  Created on: 2013-03-12
 *      Author: gperry
 */

#include "Vehicle.hpp"
#include <bb/data/XmlDataAccess>
#include <bb/cascades/multimedia/Camera>
#include <bps/soundplayer.h>

#include <bb/system/InvokeRequest>
#include <bb/system/InvokeManager>
#include <bb/system/InvokeTargetReply>

using namespace bb::data;
using namespace bb::cascades;
using namespace bb::cascades::multimedia;

namespace vehicle {

Vehicle::Vehicle() {
    m_editMode  = false;
    m_make   = "";
    m_model  = "";
    m_colour = "";
    m_year   = "";
    m_vin    = "";
    loadVehicleFromConfig();
}

Vehicle::~Vehicle() {
}

/**
 * UI has got the Vehicle info from the user, save it in the object
 */
Q_INVOKABLE void Vehicle::saveVehicleInfo (QString make, QString model, QString colour, QString year, QString vin)
{
	setVehicleMake(make);
	setVehicleModel(model);
	setVehicleColour(colour);
	setVehicleYear(year);
	setVehicleVIN(vin);

	emit vehicleChanged();
}

/**
 * On Startup see if we can read in from the XML file and populate the object
 */
void Vehicle::loadVehicleFromConfig() {
    XmlDataAccess xda;
    QVariant list = xda.load(QDir::currentPath() + "/data/vehicles.xml");
    if (!list.isNull() && list.canConvert(QVariant::Map)) {

        QMap<QString, QVariant> topLevelVehicleMap = list.toMap();

        QVariant vMyDriverList = topLevelVehicleMap.value("vehicle");
        if (vMyDriverList.canConvert(QVariant::Map)) {

            QVariantMap vFirstDriver = vMyDriverList.toMap();
            m_make      = vFirstDriver["make"].toString();
            m_model     = vFirstDriver["model"].toString();
            m_colour    = vFirstDriver["colour"].toString();
            m_year      = vFirstDriver["year"].toString();
            m_vin       = vFirstDriver["vin"].toString();
        }
    }
    else {
        qDebug() << "No File Opened so Empty Record";
    }

}

/**
 * Save the current Driver info to the file driver.xml
 */
Q_INVOKABLE void Vehicle::saveVehicleInfoToFile ()
{
    qDebug() << "saveVehicleInfoToFile";

    // Create QVariantMap objects to contain the data for each driver
    QVariantMap firstVehicle;

    // Populate each object with data
    firstVehicle["make"]    = QVariant(m_make);
    firstVehicle["model"]   = QVariant(m_model);
    firstVehicle["colour"]  = QVariant(m_colour);
    firstVehicle["year"]    = QVariant(m_year);
    firstVehicle["vin"]     = QVariant(m_vin);

    // Add each driver to a QVariantList
    QVariantList myVehicleList = QVariantList() << QVariant(firstVehicle);

    // Add the driver list to a top-level QVariantMap, then wrap it in a QVariant
    QVariantMap topLevelVehicleMap;
    topLevelVehicleMap[".root"] = QVariant("vehicles");
    topLevelVehicleMap["vehicle"] = QVariant(myVehicleList);
    QVariant myData = QVariant(topLevelVehicleMap);

    // Retrieve the working dir and create an xml file
    QDir home = QDir::home();
    home.cd("data");
    qDebug() << home;
    QFile file(home.absoluteFilePath("vehicles.xml"));
    if (file.open(QIODevice::ReadWrite | QIODevice::Text)) {
        XmlDataAccess xda;
        xda.save(myData, &file);
    }
    file.close();
}


/**
 * Are we in Edit or Compose Mode for the Vehicle data
 */
Q_INVOKABLE
bool Vehicle::vehicleEdit() {
    return m_editMode;
}

/**
 * play shutter noise when camera is activated.
 */
Q_INVOKABLE
void Vehicle::playShutter () {
    soundplayer_play_sound("event_camera_shutter");
}

void Vehicle::showPhotoInCard(const QString fileName) {
    // Create InvokeManager and InvokeRequest objects to be able to invoke a card with
    // a viewer that will show the car photo.
    bb::system::InvokeManager manager;
    bb::system::InvokeRequest request;

    // Setup what to show and in what target
    request.setUri(QUrl::fromLocalFile(fileName));
    request.setTarget("sys.pictures.card.previewer");
    request.setAction("bb.action.VIEW");
    bb::system::InvokeTargetReply *targetReply = manager.invoke(request);

    // Setting the parent to this will make the manager live on after the function terminates
    manager.setParent(this);

    if (targetReply == NULL) {
        qDebug() << "InvokeTargetReply is NULL: targetReply = " << targetReply;
    }
    else {
        targetReply->setParent(this);
    }

}

} /* namespace vehicle */
