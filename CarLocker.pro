APP_NAME = CarLocker

CONFIG  += qt warn_on cascades10
HEADERS += ../src/*hpp ../src/*h
LIBS    += -lbbdata -lbbmultimedia -lmmrndclient -lasound -lstrm  -lcamapi -lscreen -lEGL -lGLESv2 -lGLESv1_CM -lfreetype -lpps -lpng -lbbdevice -lbbsystem
LIBS    += -lQtLocationSubset -lbbcascadesmultimedia -lbbcascadesmaps -lbbplatform
include(config.pri)
