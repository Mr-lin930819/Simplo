import QtQuick 2.0

/***
  --作为主菜单的按键组件--
  **属性如下:
  @buttonlabel  显示文字
  @labelcolor   文字颜色
  @buttoncolor  按键背景色
  @buttonRadius 按键弧度半径
  @buttonBack   按键背景图片
  @iconRes      按键图标资源
  **信号:
  @buttonclicked()  按键点击事件
  **/
Rectangle{

    id:root
    property string buttonlabel: "好友"
    property string labelcolor: "white"
    property string buttoncolor: "red"
    property string buttonBack: ""
    property real buttonRadius: 15
    property string iconRes: "qrc:/main_icon1.png"
    signal buttonclicked();
    color: button1Area.pressed?Qt.darker(buttoncolor,3)
                              :buttoncolor
    Image {
        id: bgImg
        source: buttonBack
        anchors.fill: parent
        smooth: false
    }
    Text {
        text: buttonlabel
        x:parent.width/1.8
        font.pixelSize: root.height/4.5
        font.family: "微软雅黑"
        anchors{
            verticalCenter: parent.verticalCenter
            verticalCenterOffset: -parent.height/6
        }
        color: labelcolor
    }
    //图标
    Image {
        source: iconRes
        anchors.verticalCenter: parent.verticalCenter
        x:parent.width/11
        width: parent.height*0.65;height: width
        z:10
    }
    radius: buttonRadius
    MouseArea{
        id:button1Area
        anchors.fill: parent
        onClicked: buttonclicked();

    }
}
