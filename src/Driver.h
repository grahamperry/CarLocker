/*
 * Driver.h
 *
 *  Created on: 2013-03-06
 *      Author: gperry
 */

#ifndef DRIVER_H_
#define DRIVER_H_

#include <bb/cascades/AbstractPane>

#include <QObject>
#include <QString>

class Driver : public QObject {
	Q_OBJECT

public:
	Driver();
	virtual ~Driver();

	Q_PROPERTY(QString driverName      READ getDriverName      WRITE setDriverName      NOTIFY driverChanged)
	Q_PROPERTY(QString driverAddress   READ getDriverAddress   WRITE setDriverAddress   NOTIFY driverChanged)
	Q_PROPERTY(QString driverAddress2  READ getDriverAddress2  WRITE setDriverAddress2  NOTIFY driverChanged)
	Q_PROPERTY(QString driverCity      READ getDriverCity      WRITE setDriverCity      NOTIFY driverChanged)
	Q_PROPERTY(QString driverState     READ getDriverState     WRITE setDriverState     NOTIFY driverChanged)
	Q_PROPERTY(QString driverCountry   READ getDriverCountry   WRITE setDriverCountry   NOTIFY driverChanged)
	Q_PROPERTY(QString driverTelephone READ getDriverTelephone WRITE setDriverTelephone NOTIFY driverChanged)
	Q_PROPERTY(QString driverEmail     READ getDriverEmail     WRITE setDriverEmail     NOTIFY driverChanged)

	Q_INVOKABLE void saveDriverInfo (QString name, QString address1, QString address2, QString city,
			                         QString state, QString postcode, QString country,
			                         QString tel, QString email );
	Q_INVOKABLE void saveDriverInfoToFile();

	Q_INVOKABLE QString getDriverName      () { return m_name; };
	Q_INVOKABLE QString getDriverAddress   () { return m_address; };
	Q_INVOKABLE QString getDriverAddress2  () { return m_address2; };
	Q_INVOKABLE QString getDriverCity      () { return m_city; };
	Q_INVOKABLE QString getDriverState     () { return m_state; };
	Q_INVOKABLE QString getDriverCountry   () { return m_country; };
	Q_INVOKABLE QString getDriverTelephone () { return m_telephone; };
	Q_INVOKABLE QString getDriverEmail     () { return m_email; };
	Q_INVOKABLE QString getDriverPostcode  () { return m_postcode; };

	void setDriverName      (QString newName)      { m_name = newName; };
	void setDriverAddress   (QString newAddress)   { m_address = newAddress; };
	void setDriverAddress2  (QString newAddress2)  { m_address2 = newAddress2; };
	void setDriverCity      (QString newCity)      { m_city = newCity; };
	void setDriverState     (QString newState)     { m_state = newState; };
	void setDriverCountry   (QString newCountry)   { m_country = newCountry; };
	void setDriverTelephone (QString newTelephone) { m_telephone = newTelephone; };
	void setDriverEmail     (QString newEmail)     { m_email = newEmail; };
	void setDriverPostcode  (QString newPostcode)  { m_postcode = newPostcode; };


signals:
	void driverChanged();

private:
	QString m_name;
	QString m_address;
	QString m_address2;
	QString m_city;
	QString m_state;
	QString m_country;
	QString m_telephone;
	QString m_email;
	QString m_postcode;
};

#endif /* DRIVER_H_ */
