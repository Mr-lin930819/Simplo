import QtQuick 2.0
import QtQuick.Controls 1.1

Rectangle {
    width:450
    height: 800
    id:root
    property real mouseMovedistance:settingArea.j
    signal pagemoved;
    signal loginPageAccepted;
    signal loginPageClicked;
    color: "#7513f5"
    Text {
        id: label
        text: qsTr("个人资料")
        font.pixelSize: parent.width/3
    }
    MouseArea{
        id: settingArea
        property int i
        property int j
        anchors.fill: parent
        onPressed: {
            i=mouseX;
            Qt.inputMethod.hide()
            loginPageAccepted()
        }


        onMouseXChanged: {
            j=mouseX-i
            pagemoved();
        }
    }
    LoginPage{
        id:loginpage
        anchors.fill: parent
        onInputAccepted: loginPageAccepted();
        onLoginButtonClicked: loginPageClicked()
    }
}
