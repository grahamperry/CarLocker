/*
 * IncidentMap.hpp
 *
 *  Created on: 2013-04-03
 *      Author: gperry
 */

#ifndef INCIDENTMAP_HPP_
#define INCIDENTMAP_HPP_

#include <QObject>
#include <bb/cascades/AbstractPane>
#include <QString>
#include <QTime>
#include <QDate>

#include <QtLocationSubset/QGeoPositionInfoSource>

using namespace QtMobilitySubset;

class IncidentMap : public QObject {
    Q_OBJECT
    Q_PROPERTY(QString incidentTime READ getIncidentTime NOTIFY incidentOccured)

public:
    IncidentMap();
    virtual ~IncidentMap();

    QString getIncidentTime();

    Q_INVOKABLE void recordIncident();

signals:
    void incidentOccured();

public slots:
    void positionUpdated (const QGeoPositionInfo &position);

private:
    QtMobilitySubset::QGeoPositionInfoSource *source;
    QtMobilitySubset::QGeoPositionInfo recordedPos;
    bool present;
};

#endif /* INCIDENTMAP_HPP_ */
