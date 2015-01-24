#include <QtGui/QGuiApplication>
#include "qtquick2applicationviewer.h"
//#include "notificationclient.h"
#include <QQmlContext>
#include <QQmlEngine>
int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    //QQuickView viewer;
    QtQuick2ApplicationViewer viewer;
    viewer.connect(viewer.engine(),SIGNAL(quit()),
                   &viewer,SLOT(close()));
/*    调用本地Android java API实现通知栏     */
//    NotificationClient *notificationClient = new NotificationClient(&viewer);
//    viewer.engine()->rootContext()->setContextProperty(QLatin1String("notificationClient"),
//                                                     notificationClient);
//    viewer.engine()->rootContext()->setContextProperty(QLatin1String("mainview"),
//                                                       &viewer);

    //viewer.setVisibility(QWindow::FullScreen);
    //    viewer.setResizeMode(QQuickView::SizeRootObjectToView);
    //viewer.setSource(QUrl(QStringLiteral("qrc:/qml/NotifyTest/init.qml")));

    viewer.setMainQmlFile(QLatin1String("qml/NotifyTest/init.qml"));
    viewer.showExpanded();
    //viewer.showFullScreen();
    return app.exec();
}


