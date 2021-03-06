// Tabbed pane project template
#ifndef CarLocker_HPP_
#define CarLocker_HPP_

#include <QObject>

#include <bps/soundplayer.h>
#include <QtCore/QObject>
#include <QtCore/QMetaType>

namespace bb {

    namespace cascades {
        class Application;
        class Invocation;
    }
}

/*!
 * @brief Application pane object
 *
 *Use this object to create and init app UI, to create context objects, to register the new meta types etc.
 */
class CarLocker : public QObject
{
    Q_OBJECT
public:
    CarLocker(bb::cascades::Application *app);
    virtual ~CarLocker() {}

};

#endif /* CarLocker_HPP_ */
