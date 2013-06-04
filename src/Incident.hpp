/*
 * Incident.hpp
 *
 *  Created on: 2013-04-03
 *      Author: gperry
 */

#ifndef INCIDENT_HPP_
#define INCIDENT_HPP_

#include <qobject.h>

class Incident: public QObject {
    Q_OBJECT
    Q_PROPERTY(QString incident   READ getIncident  WRITE setIncident NOTIFY incidentLogged)

public:
    Incident();
    virtual ~Incident();

    Q_INVOKABLE void CreateIncidentReport();

    // Property getters and setters
    Q_INVOKABLE QString getIncident () { return m_incident; };
    void setIncident (QString newIncident) { m_incident = newIncident; };

signals:
    void incidentLogged();

private:
    QString m_incident;


};

#endif /* INCIDENT_HPP_ */
