
TARGET = tangentapp
TEMPLATE = app

QT += quick
CONFIG += c++11
QT += sql
QT += core
QT += widgets
QT += quickcontrols2
QT += charts
QT += widgets
# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += main.cpp \
    sqltablemodel.cpp \
    shareutils.cpp \
    timetablemodel.cpp \
    sortandfilterclass.cpp

HEADERS += \
    mainwindow.h \
    sqltablemodel.h \
    shareutils.h \
    timetable.h \
    sortfilterclass.h

RESOURCES += \
    qml.qrc

#ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
#android{
#QT += androidextras
#}

android{
QT += androidextras
message(android device)
ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android_data
my_files.path = /assets
my_files.files = $$PWD/android/*
INSTALLS += my_files
DEPLOYMENT += my_files

OTHER_FILES += $$PWD/android_data/src/com/lasconic

#QT += androidextras
#deployment.files += $$PWD/android/*
#deployment.path = /assets
#INSTALLS += deployment
#message("ANDROID")
#message($$my_files.files)
}

unix{
message(unix device)

}

addFiles.files +=$$PWD/android/*
addFiles.path = .
DEPLOYMENT += addFiles
INSTALLS += addFiles


# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin

!isEmpty(target.path): INSTALLS += target



#DESTDIR = $$PWD
message($$DESTDIR)

DISTFILES += \
    android_data/AndroidManifest.xml \
    android_data/gradle/wrapper/gradle-wrapper.jar \
    android_data/gradlew \
    android_data/res/values/libs.xml \
    android_data/build.gradle \
    android_data/gradle/wrapper/gradle-wrapper.properties \
    android_data/gradlew.bat \
    android_data/AndroidManifest.xml \
    android_data/gradle/wrapper/gradle-wrapper.jar \
    android_data/gradlew \
    android_data/res/values/libs.xml \
    android_data/build.gradle \
    android_data/gradle/wrapper/gradle-wrapper.properties \
    android_data/gradlew.bat \
    android_data/AndroidManifest.xml \
    android_data/AndroidManifest.xml \
    android_data/gradle/wrapper/gradle-wrapper.jar \
    android_data/gradlew \
    android_data/res/values/libs.xml \
    android_data/build.gradle \
    android_data/gradle/wrapper/gradle-wrapper.properties \
    android_data/gradlew.bat \
    android_data/AndroidManifest.xml \
    android_data/gradle/wrapper/gradle-wrapper.jar \
    android_data/gradlew \
    android_data/res/values/libs.xml \
    android_data/build.gradle \
    android_data/gradle/wrapper/gradle-wrapper.properties \
    android_data/gradlew.bat \
    android_data/AndroidManifest.xml \
    android_data/gradle/wrapper/gradle-wrapper.jar \
    android_data/gradlew \
    android_data/res/values/libs.xml \
    android_data/build.gradle \
    android_data/gradle/wrapper/gradle-wrapper.properties \
    android_data/gradlew.bat
