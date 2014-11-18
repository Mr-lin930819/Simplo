import QtQuick 2.0

Rectangle {
    property real splitWidth: 100
    property real splitHeight: 1
    property real splitOpacity: 0.8
    property color splitColor: "white"
    width: splitWidth;height: splitHeight;opacity: splitOpacity;
    color: splitColor
    anchors.bottom: parent.bottom;
    anchors.horizontalCenter: parent.horizontalCenter
}
