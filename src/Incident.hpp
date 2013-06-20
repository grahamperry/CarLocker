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
#include <QtLocationSubset/QGeoServiceProvider>
#include <QtLocationSubset/QGeoSearchManager>
#include <QtLocationSubset/QGeoBoundingArea>
#include <QtLocationSubset/QGeoPlace>

using namespace QtMobilitySubset;

class Incident: public QObject {
    Q_OBJECT
    Q_PROPERTY(QString incident     READ getIncident     WRITE setIncident   NOTIFY incidentOccured)
    Q_PROPERTY(QString incidentTime READ getIncidentTime                     NOTIFY incidentOccured)
    Q_PROPERTY(QString address      READ getAddress      WRITE setAddress    NOTIFY incidentOccured)
    Q_PROPERTY(double longitude     READ getLongitude                        NOTIFY incidentOccured)
    Q_PROPERTY(double latitude      READ getLatitude                         NOTIFY incidentOccured)
    Q_PROPERTY(int altitude         READ getAltitude     WRITE setAltitude   NOTIFY incidentOccured)
    Q_PROPERTY(bool mapVisible      READ getMapVisible   WRITE setMapVisible NOTIFY incidentOccured)

public:
    Incident();
    virtual ~Incident();

    Q_INVOKABLE void CreateIncidentReport();
    Q_INVOKABLE void fakeIncidentReport();
    Q_INVOKABLE void mapZoomOut();
    Q_INVOKABLE void mapZoomIn();

    Q_INVOKABLE void zoomIn();
    Q_INVOKABLE void zoomOut();

    // Property getters and setters
    Q_INVOKABLE QString getIncident () { return m_incident; };
    void setIncident (QString newIncident) { m_incident = newIncident; };
    void setAddress (QString newAddress) { m_address = newAddress; };
    void setMapVisible (bool visible) { m_mapvisible = visible; };
    void setAltitude (int newAltitude) { m_altitude = newAltitude; };


    Q_INVOKABLE QString getIncidentTime();
    Q_INVOKABLE QString getAddress()      { return m_address; };
    Q_INVOKABLE double getLongitude ()    { return m_longitude; };
    Q_INVOKABLE double getLatitude ()     { return m_latitude; };
    Q_INVOKABLE bool   getMapVisible ()   { return m_mapvisible; };
    Q_INVOKABLE int    getAltitude()      { return m_altitude; };

    void requestPosition();
    void recordIncident();
    void findAddress (const QGeoPositionInfo &position);

signals:
    void incidentOccured();

public slots:
    void positionUpdated (const QGeoPositionInfo &position);
    void readReverseGeocode();

private:
    QString m_incident;
    QtMobilitySubset::QGeoPositionInfoSource *source;
    QtMobilitySubset::QGeoServiceProvider *serviceProvider;
    QGeoSearchManager *searchManager;
    QGeoSearchReply *reply;
    bool present;
    bool m_mapvisible;
    double m_longitude;
    double m_latitude;
    QString m_incidentTime;
    QString m_address;
    int m_altitude;
};

#endif /* INCIDENT_HPP_ */
