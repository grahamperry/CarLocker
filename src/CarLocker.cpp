#include "CarLocker.hpp"

#include <bb/cascades/Application>
#include <bb/cascades/QmlDocument>
#include <bb/cascades/AbstractPane>
#include <bb/cascades/multimedia/Camera>

#include <QDebug>

#include "Driver.h"
#include "Vehicle.hpp"


using namespace bb::cascades;
using namespace bb::cascades::multimedia;

using namespace vehicle;

//===================================
// Return true if the qml has errors,
// and report the errors.
// This is equivalent to:
//    qml == 0 || qml->hasErrors()
// except that it also logs errors.
//===================================
bool reportErrors(QmlDocument* qml) {
	if (qml == 0) {
		qDebug() << "Unable to create qml document (unknown error)";
		return true;
	}
	else if (qml->hasErrors()) {
		foreach (QDeclarativeError error, qml->errors()) {
			qDebug() << "QML Error: " << error.toString();
		}
		return true;
	}
	return false;
}

CarLocker::CarLocker(bb::cascades::Application *app)
: QObject(app)
{
    // create scene document from main.qml asset
    // set parent to created document to ensure it exists for the whole application lifetime
    QmlDocument *qml = QmlDocument::create("asset:///main.qml").parent(this);
	if (reportErrors(qml)) {
		qDebug() << "Unable to load main.qml";
		return;
	}

	qmlRegisterType < Camera > ("bb.cascades.multimedia", 1, 0, "Camera");

    Driver *driver = new Driver();
    qml->setContextProperty("driver", driver);

    Vehicle *vehicle = new Vehicle();
    qml->setContextProperty("vehicle", vehicle);

    // create root object for the UI
    AbstractPane *root = qml->createRootObject<AbstractPane>();

//    Camera *camera = root->findChild<Camera*>("camera1");
//    QObject::connect(camera, SIGNAL(shutterFired()), this, SLOT(onShutterFired()));

    // set created root object as a scene
    app->setScene(root);


}




