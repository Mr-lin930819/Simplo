import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1

Rectangle {
    property real titleSpiler: 13
    signal loginButtonClicked()
    id:root
//    property alias logininputfocus: loginnameInput.focus
//    property alias passwordinputfocus: paddwordInputInput.focus
    signal inputAccepted;
    color: "#4077b7"        //背景色

    /**
      登录标题栏:
        高度:屏幕高度的1/13,宽度:屏幕宽度
        色彩:#2b539f,文字:欢迎使用Simplo
        */
    Rectangle{
        id:lgTitle
        x:0;y:0
        color: "#2b539f"        //标题栏颜色
        width: parent.width;height: parent.height/titleSpiler
        Text {
            id: titleLable
            text: qsTr("欢迎使用Simplo")
            color: "white"
            font.family: "微软雅黑"
            font.pixelSize: parent.height/2
            anchors{
                horizontalCenter: parent.horizontalCenter
                verticalCenter: parent.verticalCenter
            }
        }
    }

    /**
      LOGO
      */
    Text{
        id:titleLabel
        width: 214/320*parent.width
        color: "#ffffff"
        height: 108/568*parent.height
        anchors{
            horizontalCenter: parent.horizontalCenter
            top:parent.top;        }
        text:"Logo"
        horizontalAlignment: Text.AlignHCenter
        anchors.horizontalCenterOffset: 1
        anchors.topMargin: 116/568*parent.height
        font.pixelSize: parent.height/30
        font.family: "Segoe UI Light"
    }

    /**
      输入框
      */
    Item {
        id: inputField
        width: parent.width
        height: parent.height/6
        y: root.height/2
        Behavior on y{
            NumberAnimation{}
        }

        //输入提示标志:邮箱
        Rectangle{
            width:parent.width*0.25;height: parent.height/2.5
            x:parent.width*0.1
            color:"transparent"
            Image {
                id: icon1
                source: "qrc:/lg_icon2.png"
                height: parent.height*0.6;width: height
                anchors.verticalCenter: parent.verticalCenter
            }
            Text {
                id: emailName
                x:parent.height
                anchors.verticalCenter: parent.verticalCenter
                color: "white"
                text: qsTr("邮箱:")
                font.pixelSize: parent.height/2.5
                font.family: "微软雅黑"
            }
        }

        //邮箱输入框
        TextField {
            id: loginnameInput
            style: TextFieldStyle{
                background: Rectangle{
                    anchors.fill: parent
                    color: "transparent"
                }
                placeholderTextColor: "#bec3ca"
            }
            width: parent.width*0.55;height: parent.height/2.5
            x:parent.width*0.35
            //anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: height/2
            placeholderText: qsTr("Input E-Mail")
            textColor: "white"
            onAccepted: {
                inputAccepted();
            }
            Keys.onReleased: {
                if(event.key===Qt.Key_Back){
                    event.accepted=true;
                    accepted();
                }
                loginnameInput.focus=false
            }
        }
        Rectangle{
            anchors.top:loginnameInput.bottom
            height: 1;width: parent.width*0.8
            anchors.horizontalCenter: parent.horizontalCenter
            color: "#bec3ca"
            opacity: 0.3
        }

        //输入提示标志:密码
        Rectangle{
            width:parent.width*0.25;height: parent.height/2.5
            x:parent.width*0.1;
            anchors.top:loginnameInput.bottom
            anchors.topMargin: parent.height/5
            color:"transparent"
            Image {
                id: icon2
                source: "qrc:/lg_icon1.png"
                height: parent.height*0.6;width: height
                anchors.verticalCenter: parent.verticalCenter
            }
            Text {
                id: password
                x:parent.height
                anchors.verticalCenter: parent.verticalCenter
                color: "white"
                text: qsTr("密码:")
                font.pixelSize: parent.height/2.5
                font.family: "微软雅黑"
            }
        }

        //密码输入框
        TextField {
            id: paddwordInputInput
            style: TextFieldStyle{
                background: Rectangle{
                    anchors.fill: parent
                    color: "transparent"
                }
                placeholderTextColor: "#bec3ca"
            }
            width: parent.width*0.55;height: parent.height/2.5
            anchors.top:loginnameInput.bottom
            anchors.topMargin: parent.height/5
            //anchors.horizontalCenter: parent.horizontalCenter
            x:parent.width*0.35
            font.pixelSize: height/2
            placeholderText: qsTr("Input Password")
            textColor: "white"
            echoMode: TextInput.Password
            onAccepted: {
                inputAccepted();
            }

            Keys.onReleased: {
                if(event.key===Qt.Key_Back){
                    event.accepted=true;
                    accepted();
                }
                paddwordInputInput.focus=false
                if(event.key===Qt.Key_Enter){
                    //登录
                    ;
                }
            }

            onActiveFocusChanged: {

                if(paddwordInputInput.activeFocus ===true){
                    inputField.y = lgTitle.height*4
                    console.debug("LKJHH")
                }else{
                    inputField.y = root.height/2
                }
            }
        }
        Rectangle{
            anchors.top:paddwordInputInput.bottom
            height: 1;width: parent.width*0.8
            anchors.horizontalCenter: parent.horizontalCenter
            color: "#bec3ca"
            opacity: 0.3
        }
    }

    /**
      登录按键
      */
    Button{
        id:loginButton
        style: ButtonStyle{
            background: Rectangle{
                anchors.fill: parent
                color: loginButton.pressed? Qt.darker("#1dbbed",2) : "#1dbbed"
            }
        }
        x:root.width*0.1
        anchors.top: inputField.bottom;anchors.topMargin: root.height/18
        height: root.height/13;width: root.width*0.8
        Text {
            text: qsTr("登  录")
            font.pixelSize: loginButton.height/2.5
            color: "white"
            anchors{
                verticalCenter: parent.verticalCenter
                horizontalCenter: parent.horizontalCenter
            }
        }
        onClicked: loginButtonClicked()
    }

    Text{
        text:"注册|帮助"
        anchors.bottom: parent.bottom;anchors.bottomMargin: root.height/13
        anchors.horizontalCenter:parent.horizontalCenter
        font.pixelSize: parent.height/45
        font.family: "微软雅黑"
        color: "#bfc3cb"
    }
}
