# Auto-generated by IDE. All changes by user will be lost!
# Created at 15/03/13 3:27 PM

BASEDIR = $$_PRO_FILE_PWD_

INCLUDEPATH +=  \
    $$BASEDIR/src

SOURCES +=  \
    $$BASEDIR/src/CarLocker.cpp \
    $$BASEDIR/src/Driver.cpp \
    $$BASEDIR/src/Vehicle.cpp \
    $$BASEDIR/src/main.cpp

HEADERS +=  \
    $$BASEDIR/src/CarLocker.hpp \
    $$BASEDIR/src/Driver.h \
    $$BASEDIR/src/Vehicle.hpp

CONFIG += precompile_header
PRECOMPILED_HEADER = $$BASEDIR/precompiled.h

lupdate_inclusion {
    SOURCES += \
        $$BASEDIR/../assets/*.qml
}

TRANSLATIONS = \
    $${TARGET}.ts

