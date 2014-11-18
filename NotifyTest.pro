# Add more folders to ship with the application, here
folder_01.source = qml/NotifyTest
folder_01.target = qml
DEPLOYMENTFOLDERS = folder_01
QT += quick qml#androidextras
CONFIG += qt plugin
QT+=xmlpatterns
#ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android-sources

# Additional import path used to resolve QML modules in Creator's code model
QML_IMPORT_PATH = QtQml/Models.2

# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += main.cpp
#\
#    notificationclient.cpp

# Installation path
# target.path =

# Please do not modify the following two lines. Required for deployment.
include(qtquick2applicationviewer/qtquick2applicationviewer.pri)
qtcAddDeployment()

#OTHER_FILES += \
#    android-sources/AndroidManifest.xml \
#    android-sources/src/org/qtproject/example/NotifyTest/NotificationClient.java

#HEADERS += #\#    调用本地Android java API实现通知�?
    #notificationclient.h

RESOURCES += \
    main.qrc

OTHER_FILES += \
    qml/NotifyTest/ZComponentSpliter.qml \
    android/version.xml \
    android/AndroidManifest.xml \
    qml/NotifyTest/Test.qml

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
