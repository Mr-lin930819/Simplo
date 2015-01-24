import QtQuick 2.0
/*
 *本页面为协议页面
 *用户协议存放于此
 */
Rectangle {
    width: 450
    height: 800
    signal backClicked;
    Rectangle{
        id: header
        width: root.width
        height: root.height/8
        color: "grey"
        MyButton{
            x:10
            width: parent.width/7
            height: parent.height/1.5
            anchors.verticalCenter: parent.verticalCenter
            onButtonClicked: backClicked();
            backColor: "transparent"
            buttonLabel: ""
            imgfile: "qrc:/backIcon.png"
        }
    }

    Text {
        id: protoText
        anchors.top:header.bottom
        font.pixelSize: 24
        text: qsTr("<center>协议内容： </center>\n没有内容.\n")
    }
}
