/*
 * Settings.cpp
 *
 *  Created on: 2013-05-22
 *      Author: gperry
 */

#include "Settings.hpp"

#include <QDebug>
#include <QSettings>

Settings::Settings() {

    QSettings settingsFile ("Craigiebarns", "CarLocker");

    QString emailAccount = settingsFile.value("emailAccount").toString();
    if (emailAccount.isNull() || emailAccount.isEmpty()) {
        emailAccount = "Unconfigured";
    }
    m_emailAccount = emailAccount;
    m_emergencyContact = settingsFile.value("emergencyContact").toString();
}

Settings::~Settings() {
    // TODO Auto-generated destructor stub
}

void Settings::setEmailAccount (QString newEmail) {
    qDebug() << "setEmailAccount : " << newEmail;
    QSettings settingsFile ("Craigiebarns", "CarLocker");

    m_emailAccount = newEmail;
    settingsFile.setValue("emailAccount", newEmail);
    emit settingsChanged();
}

void Settings::setEmergencyContact (QString newEmergencyContact) {
    qDebug() << "setEmergencyContact : " << newEmergencyContact;
    QSettings settingsFile ("Craigiebarns", "CarLocker");

    m_emergencyContact = newEmergencyContact;
    settingsFile.setValue("emergencyContact", newEmergencyContact);
    emit settingsChanged();
}

