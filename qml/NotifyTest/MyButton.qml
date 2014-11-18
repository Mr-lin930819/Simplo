import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1
Rectangle {
    signal buttonClicked;
    property color backColor: "lightblue"
    property string buttonLabel: "返回"
    property string imgfile: ""
    color: backColor
    Button{
        id:titlebutton
        anchors.fill: parent
        onClicked: buttonClicked();
        style: ButtonStyle{
            background: Rectangle{
                anchors.fill: parent
                color: backColor
                Image {
                    anchors.fill: parent
                    source: imgfile
                }
            }
            label: Item{
                Text{
                    text: buttonLabel
                    font.family: "微软雅黑"
                    anchors.centerIn: parent
                    font.pixelSize: titlebutton.height/2
                }
            }
        }
    }
}
