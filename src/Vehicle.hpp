/*
 * Vehicle.hpp
 *
 *  Created on: 2013-03-12
 *      Author: gperry
 */

#ifndef VEHICLE_HPP_
#define VEHICLE_HPP_

#include <QObject>
#include <QString>

namespace vehicle {

class Vehicle : public QObject {
	Q_OBJECT

public:
	Vehicle();
	virtual ~Vehicle();

	Q_PROPERTY(QString vehicleMake   READ getVehicleMake   WRITE setVehicleMake   NOTIFY vehicleChanged)
	Q_PROPERTY(QString vehicleModel  READ getVehicleModel  WRITE setVehicleModel  NOTIFY vehicleChanged)
	Q_PROPERTY(QString vehicleColour READ getVehicleColour WRITE setVehicleColour NOTIFY vehicleChanged)
	Q_PROPERTY(QString vehicleYear   READ getVehicleYear   WRITE setVehicleYear   NOTIFY vehicleChanged)
	Q_PROPERTY(QString vehicleVIN    READ getVehicleVIN    WRITE setVehicleVIN    NOTIFY vehicleChanged)

	Q_INVOKABLE QString getVehicleMake   () { return m_make; };
	Q_INVOKABLE QString getVehicleModel  () { return m_model; };
	Q_INVOKABLE QString getVehicleColour () { return m_colour; };
	Q_INVOKABLE QString getVehicleYear   () { return m_year; };
	Q_INVOKABLE QString getVehicleVIN    () { return m_vin; };

	void setVehicleMake   (QString newMake)   { m_make   = newMake; };
	void setVehicleModel  (QString newModel)  { m_model  = newModel; };
	void setVehicleColour (QString newColour) { m_colour = newColour; };
	void setVehicleYear   (QString newYear)   { m_year   = newYear; };
	void setVehicleVIN    (QString newVIN)    { m_vin    = newVIN; };

	Q_INVOKABLE void saveVehicleInfo (QString make, QString model, QString colour, QString year, QString vin);


signals:
	void vehicleChanged();

private:
	QString m_make;
	QString m_model;
	QString m_colour;
	QString m_year;
	QString m_vin;

};

} /* namespace vehicle */
#endif /* VEHICLE_HPP_ */
