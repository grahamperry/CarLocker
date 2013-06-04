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
using namespace bb::system;

namespace vehicle {

Vehicle::Vehicle() {
    qDebug() << "Vehicle Constructor";
    m_editMode  = false;
    m_make   = "";
    m_model  = "";
    m_colour = "";
    m_year   = "";
    m_vin    = "";
    m_vehiclePhoto = "asset:///images/picture1.png";
    loadVehicleFromConfig();
}

Vehicle::~Vehicle() {
}

/**
 * UI has got the Vehicle info from the user, save it in the object
 */
void Vehicle::saveVehicleInfo (QString make, QString model, QString colour, QString year, QString vin)
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
            m_make         = vFirstDriver["make"].toString();
            m_model        = vFirstDriver["model"].toString();
            m_colour       = vFirstDriver["colour"].toString();
            m_year         = vFirstDriver["year"].toString();
            m_vin          = vFirstDriver["vin"].toString();
        }
    }
    else {
        qDebug() << "No File Opened so Empty Record";
    }

}

/**
 * Save the current Driver info to the file driver.xml
 */
void Vehicle::saveVehicleInfoToFile ()
{
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
bool Vehicle::vehicleEdit() {
    return m_editMode;
}

/**
 * play shutter noise when camera is activated.
 */
void Vehicle::playShutter () {
    soundplayer_play_sound("event_camera_shutter");
}

/**
 * Take a string from the camera qml, convert it to a QUrl and save it
 */
void Vehicle::setVehiclePhoto(const QString fileName) {
    QImageReader reader;

    if (!fileName.isEmpty()) {
        // Convert to QImage
        reader.setFileName(fileName);
        QImage image = reader.read();
        QSize imageSize = image.size();

        // Scale to 900 x 900
        QSize thumbSize(900,900);
        QImage scaled(image.scaled(thumbSize, Qt::KeepAspectRatio));

        QDir home = QDir::home();
        home.cd("data");
        QFile file(home.absoluteFilePath("vehicle.jpg"));
        QString saveFile = file.fileName();
        if (file.open(QIODevice::ReadWrite | QIODevice::Text)) {
            scaled.save(saveFile, "JPG");
        }
        file.close();

        m_vehiclePhoto = saveFile;
        emit photoChanged();
    }
}

void Vehicle::showPreview(const QString fileName) {
    bb::system::InvokeManager manager;
    bb::system::InvokeRequest request;

    request.setUri(QUrl::fromLocalFile(fileName));
    request.setTarget("sys.pictures.card.previewer");
    request.setAction("bb.action.VIEW");
    InvokeTargetReply *targetReply = manager.invoke(request);
    manager.setParent(this);

    if (targetReply == NULL) {
        qDebug() << "InvokeTargetReply is NULL: targetReply = " << targetReply;
    } else {
        targetReply->setParent(this);
    }
}

} /* namespace vehicle */
