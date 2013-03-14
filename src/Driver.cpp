/*
 * Driver.cpp
 *
 *  Created on: 2013-03-06
 *      Author: gperry
 */

#include "Driver.h"

Driver::Driver() {
	m_name      = "";
	m_address   = "";
	m_address2  = "";
	m_city      = "";
	m_state     = "";
	m_country   = "";
	m_telephone = "";
	m_email     = "";
}

Driver::~Driver() {
}

Q_INVOKABLE void Driver::saveDriverInfo (QString name,
		                                 QString address,
		                                 QString address2,
		                                 QString city,
		                                 QString state,
		                                 QString country,
		                                 QString postcode,
		                                 QString tel,
		                                 QString email)
{
	setDriverName(name);
	setDriverAddress(address);
	setDriverAddress2(address2);
    setDriverCity(city);
    setDriverState(state);
    setDriverPostcode(postcode);
    setDriverCountry(country);
    setDriverTelephone(tel);
    setDriverEmail(email);

    // Emit signal that tells the QML to refresh
	emit driverChanged();
}

Q_INVOKABLE void Driver::saveDriverInfoToFile ()
{
	qDebug() << "c++ saveDriverInfoToFile";
}

