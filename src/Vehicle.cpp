/*
 * Vehicle.cpp
 *
 *  Created on: 2013-03-12
 *      Author: gperry
 */

#include "Vehicle.hpp"

namespace vehicle {

Vehicle::Vehicle() {
	// TODO Auto-generated constructor stub
    m_make = "";
}

Vehicle::~Vehicle() {
}

Q_INVOKABLE void Vehicle::saveVehicleInfo (QString make, QString model, QString colour, QString year, QString vin)
{
	setVehicleMake(make);
	setVehicleModel(model);
	setVehicleColour(colour);
	setVehicleYear(year);
	setVehicleVIN(vin);

	emit vehicleChanged();
}

} /* namespace vehicle */
