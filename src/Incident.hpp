/*
 * Incident.hpp
 *
 *  Created on: 2013-04-03
 *      Author: gperry
 */

#ifndef INCIDENT_HPP_
#define INCIDENT_HPP_

#include <qobject.h>
#include <QtLocationSubset/QGeoPositionInfoSource>

using namespace QtMobilitySubset;

class Incident: public QObject {
    Q_OBJECT
    Q_PROPERTY(QString incident     READ getIncident     WRITE setIncident NOTIFY incidentLogged)
    Q_PROPERTY(QString incidentTime READ getIncidentTime                   NOTIFY incidentOccured)
    Q_PROPERTY(double longitude     READ getLongitude                      NOTIFY incidentOccured)
    Q_PROPERTY(double latitude      READ getLatitude                       NOTIFY incidentOccured)

public:
    Incident();
    virtual ~Incident();

    Q_INVOKABLE void CreateIncidentReport();

    // Property getters and setters
    Q_INVOKABLE QString getIncident () { return m_incident; };
    void setIncident (QString newIncident) { m_incident = newIncident; };

    Q_INVOKABLE QString getIncidentTime();
    Q_INVOKABLE double getLongitude ()    { return recordedPos.coordinate().longitude(); };
    Q_INVOKABLE double getLatitude ()     { return recordedPos.coordinate().latitude(); };

    void setSource();
    void recordIncident();

signals:
    void incidentLogged();
    void incidentOccured();

public slots:
    void positionUpdated (const QGeoPositionInfo &position);

private:
    QString m_incident;
    QtMobilitySubset::QGeoPositionInfoSource *source;
    QtMobilitySubset::QGeoPositionInfo recordedPos;
    bool present;

};

#endif /* INCIDENT_HPP_ */
