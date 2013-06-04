/*
 * IncidentMap.cpp
 *
 *  Created on: 2013-04-03
 *      Author: gperry
 */

#include "IncidentMap.hpp"
#include <QDebug>
#include <QtLocationSubset/QGeoPositionInfoSource>

using namespace QtMobilitySubset;

IncidentMap::IncidentMap():
    present(0) {
    // Initialise position source
    qDebug() << "IncidentMap Constructor";

    source = QGeoPositionInfoSource::createDefaultSource(0);
    if (source) {
        source->setPreferredPositioningMethods(QGeoPositionInfoSource::AllPositioningMethods);

        bool positionUpdatedConnected = connect(source, SIGNAL(positionUpdated(const QGeoPositionInfo &)),
                this, SLOT(positionUpdated(const QGeoPositionInfo &)));

        if (positionUpdatedConnected) {
            source->requestUpdate();

            qDebug() << "positionUpdatedConnected";
        }
    }

}

IncidentMap::~IncidentMap() {
    // TODO Auto-generated destructor stub
}

void IncidentMap::recordIncident () {
    source->requestUpdate();
    qDebug() << "recordIncident c++";
}

void IncidentMap::positionUpdated (const QGeoPositionInfo &position) {
    // record incident position and time
    qDebug() << "positionUpdated : " << position;
    present = true;
    recordedPos = position;
    qDebug() << "timestamp Date: " << recordedPos.timestamp().date().toString();
    qDebug() << "timestamp Time: " << recordedPos.timestamp().time().toString();
    qDebug() << "longitude : " << recordedPos.coordinate().longitude();
    qDebug() << "latitude  : " << recordedPos.coordinate().latitude();
    qDebug() << "altitude  : " << recordedPos.coordinate().altitude();
    qDebug() << "emit incidentOccured";
    emit incidentOccured();

}


QString IncidentMap::getIncidentTime() {
    qDebug() << "getIncidentTime : " << recordedPos.timestamp().date().toString();
    if (present) {
        return recordedPos.timestamp().date().toString();
    }
    else {
        return "No Time";
    }
}
