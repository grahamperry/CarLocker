// Tabbed pane project template
#ifndef CarLocker_HPP_
#define CarLocker_HPP_

#include <QObject>

namespace bb { namespace cascades { class Application; }}

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