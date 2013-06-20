/*
 * Incident.cpp
 *
 *  Created on: 2013-04-03
 *      Author: gperry
 */

#include "Incident.hpp"

#include <QDebug>
#include <QDateTime>
#include <QStringList>

Incident::Incident() :
    m_longitude(0),
    m_latitude(0),
    m_altitude(2000),
    m_mapvisible(false),
    source(NULL)
{
    setIncident("No Recorded Incident");
    setAddress("Unknown Address");

}

Incident::~Incident() {
    // TODO Auto-generated destructor stub
}


void Incident::CreateIncidentReport() {

    qDebug() << "Incident::CreateIncidentReport();";
    requestPosition();

}


void Incident::fakeIncidentReport() {

    qDebug() << "Incident::fakeIncidentReport();";
    setIncident("Fake Incident");
    setAddress("Ibrox Stadium, Glasgow");
    m_longitude = -4.309816;
    m_latitude = 55.852095;
    setMapVisible (true);
    emit incidentOccured();

}

void Incident::mapZoomOut() {

    qDebug() << "Incident::mapZoomOut();";
    setAltitude(m_altitude + 1000);
    emit incidentOccured();

}

void Incident::mapZoomIn() {

    qDebug() << "Incident::mapZoomIn();";
    if (m_altitude > 1000) {
        setAltitude(m_altitude - 1000);
        emit incidentOccured();
    }
}

void Incident::recordIncident () {
    source->requestUpdate();
}

void Incident::positionUpdated (const QGeoPositionInfo &position) {
    // record incident position and time
    qDebug() << "Incident::positionUpdated";
    present = true;
    setIncident(QDateTime::currentDateTime().toString(Qt::SystemLocaleShortDate));
    setAddress("Unknown Address");
    m_longitude = position.coordinate().longitude();
    m_latitude =  position.coordinate().latitude();
    m_incidentTime = position.timestamp().date().toString();
    qDebug() << "longitude : " << m_longitude;
    qDebug() << "latitude  : " << m_latitude;

    setMapVisible (true);
    emit incidentOccured();

    // Reverse Geocode to find address of incident
    findAddress(position);
}

void Incident::findAddress (const QGeoPositionInfo &position) {
    qDebug() << "Incident::findAddress";

    QStringList serviceProviders = QGeoServiceProvider::availableServiceProviders();
    if (serviceProviders.size()) {
        serviceProvider = new QtMobilitySubset::QGeoServiceProvider(serviceProviders.at(0));
        searchManager = serviceProvider->searchManager();
    }
    if (searchManager) {
        //Request reverse geocoding
        reply = searchManager->reverseGeocode(position.coordinate());
        bool finished_connected = connect(  reply,
                                            SIGNAL(finished()),
                                            this,
                                            SLOT(readReverseGeocode()));
        if (finished_connected) {
            qDebug() << "connect to readReverseGeocode success";
        }
        else {
            qDebug() << "connect to readReverseGeocode failed";
        }
    }
    else{
        qDebug() << "searchManager not found";
    }

}

void Incident::readReverseGeocode() {
    qDebug() << "Incident::readReverseGeocode : " << reply;
    qDebug() << "Error String : "  << reply->errorString();
    QList <QGeoPlace> listOfPlaces = reply->places();
    QGeoPlace place = listOfPlaces[0];
    qDebug() << "Place[0] : "  << place.address().text();
    QString addressStr = place.address().text().section(",", 0, 1);
    setAddress(addressStr);
    emit incidentOccured();

}


QString Incident::getIncidentTime() {
    qDebug() << "getIncidentTime : " << m_incidentTime;
    if (present) {
        return m_incidentTime;
    }
    else {
        return "No Time";
    }
}

void Incident::requestPosition() {
    present = 0;
    qDebug() << "Incident::setSource";

    if (!source) {
        source = QGeoPositionInfoSource::createDefaultSource(0);
    }

    if (source) {
        source->setPreferredPositioningMethods(QGeoPositionInfoSource::AllPositioningMethods);

        bool positionUpdatedConnected = connect(source, SIGNAL(positionUpdated(const QGeoPositionInfo &)),
                this, SLOT(positionUpdated(const QGeoPositionInfo &)));

        source->requestUpdate();

    }
    else {
        qDebug() << "Source Selection Failed";
    }

}

void Incident::zoomIn() {
    qDebug() << "Incident::zoomIn";
    setAltitude(m_altitude - 500);
}

void Incident::zoomOut() {
    qDebug() << "Incident::zoomOut";
    setAltitude(m_altitude + 500);
}
