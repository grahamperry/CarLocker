/*
 * Settings.hpp
 *
 *  Created on: 2013-05-22
 *      Author: gperry
 */

#ifndef SETTINGS_HPP_
#define SETTINGS_HPP_

#include <QObject>
#include <QString>
#include <QTime>
#include <QSettings>

class Settings : public QObject {
    Q_OBJECT
public:
    Q_PROPERTY(QString emailAccount     READ getEmailAccount     WRITE setEmailAccount     NOTIFY settingsChanged)
    Q_PROPERTY(QString emergencyContact READ getEmergencyContact WRITE setEmergencyContact NOTIFY settingsChanged)

    Settings();
    virtual ~Settings();

    Q_INVOKABLE QString getEmailAccount () { return m_emailAccount; };
    Q_INVOKABLE QString getEmergencyContact () { return m_emergencyContact; };

    void setEmailAccount (QString newEmail);
    void setEmergencyContact (QString newEmergencyContact);

signals:
    void settingsChanged();

private:

    QString m_emailAccount;
    QString m_emergencyContact;

};

#endif /* SETTINGS_H_ */
