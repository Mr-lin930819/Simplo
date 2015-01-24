import QtQuick 2.0

Rectangle {
    width:450
    height: 800
    id:root
    property real mouseMovedistance:settingArea.j
    signal pagemoved;
    MouseArea{
        id: settingArea
        property int i
        property int j
        anchors.fill: parent
        onMouseXChanged: {
            j=mouseX-i
            pagemoved();
        }
    }
    color: "#4077b7"
    AnimatedImage {
        width: parent.width
        fillMode: Image.PreserveAspectFit
        source: "qrc:/logining.gif"
        anchors.centerIn: parent
    }
}
