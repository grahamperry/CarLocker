/*
 * Incident.cpp
 *
 *  Created on: 2013-04-03
 *      Author: gperry
 */

#include "Incident.hpp"

#include <QDebug>
#include <QDateTime>


Incident::Incident() {
    // TODO Auto-generated constructor stub
    m_incident = "No Recorded Incident";
}

Incident::~Incident() {
    // TODO Auto-generated destructor stub
}


void Incident::CreateIncidentReport() {

    qDebug() << "Incident::CreateIncidentReport();";
    m_incident = QDateTime::currentDateTime().toString();
    setSource();
    emit incidentLogged();
}

void Incident::recordIncident () {
    source->requestUpdate();
    qDebug() << "recordIncident c++";
}

void Incident::positionUpdated (const QGeoPositionInfo &position) {
    // record incident position and time
    qDebug() << "Incident::positionUpdated";
    present = true;
    recordedPos = position;
    qDebug() << "longitude : " << recordedPos.coordinate().longitude();
    qDebug() << "latitude  : " << recordedPos.coordinate().latitude();
    emit incidentOccured();

}


QString Incident::getIncidentTime() {
    qDebug() << "getIncidentTime : " << recordedPos.timestamp().date().toString();
    if (present) {
        return recordedPos.timestamp().date().toString();
    }
    else {
        return "No Time";
    }
}

void Incident::setSource() {
    present = 0;
    qDebug() << "Incident::setSource";

    source = QGeoPositionInfoSource::createDefaultSource(0);
    if (source) {
        source->setPreferredPositioningMethods(QGeoPositionInfoSource::AllPositioningMethods);

        bool positionUpdatedConnected = connect(source, SIGNAL(positionUpdated(const QGeoPositionInfo &)),
                this, SLOT(positionUpdated(const QGeoPositionInfo &)));

        if (positionUpdatedConnected) {
            source->requestUpdate();
        }
    }
    else {
        qDebug() << "Source Selection Failed";
    }

}
