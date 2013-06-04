/*
 * Incident.cpp
 *
 *  Created on: 2013-04-03
 *      Author: gperry
 */

#include "Incident.hpp"
#include "IncidentMap.hpp"

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

    IncidentMap *incidentMap = new IncidentMap();

    emit incidentLogged();
}
