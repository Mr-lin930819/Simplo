import QtQuick 2.2
import QtGraphicalEffects 1.0
Rectangle {
    width: 450
    height: 800
    signal settingClicked;
    signal sendClicked;
    signal noteClicked;
    id:root
    property real itemnum: 4.2
    property real fontSplit: 10-itemnum  //决定字体大小的除数
    property string fontName: "微软雅黑" //显示字体名称
    property color pressedColor: Qt.rgba(0.1,0.73,0.82,0.3)
    property real iconLeftMargin: width/6
    property real splitWidth: width*0.8

    Image{
        id:initBG;anchors.fill: parent
        source: "qrc:/initBG.png"
    }

    Column{
        Rectangle{
            id:item1
            color: item1Area.pressed?Qt.rgba(0.1,0.73,0.82,0.3)
                                      :"transparent"
            width: root.width;height: ((root.height-2*(itemnum-1))/itemnum)*1
            MouseArea{
                id:item1Area
                anchors.fill: parent
            }
            Rectangle { //头像显示窗口
                id:touXiangWindow
                color: "transparent"
                width: parent.height*0.45;height: width;
                anchors.verticalCenter: parent.verticalCenter
                anchors.verticalCenterOffset: width/5
                anchors.left: parent.left;anchors.leftMargin: iconLeftMargin
                Image {
                    id: touxiang
                    source: "qrc:/touxiang2.jpg"
                    anchors.fill: parent;visible: false
                    fillMode: Image.PreserveAspectCrop
                }
                Image {
                    id: touxiangmask;visible: false
                    anchors.fill: parent;source: "qrc:/TouxiangMask.png"
                }
                //圆形头像遮罩
                OpacityMask{
                    anchors.fill: touxiang
                    maskSource: touxiangmask
                    source: touxiang
                }
            }
            Text {
                id: username
                text: qsTr("Tom Zhang")
                font.family: fontName
                font.pixelSize: parent.height/fontSplit
                color: "white"
                anchors.verticalCenter: parent.verticalCenter
                anchors.verticalCenterOffset: width/10
//                anchors.left: touXiangWindow.right;anchors.leftMargin: parent.width/4
                anchors.horizontalCenter: parent.horizontalCenter;
                anchors.horizontalCenterOffset: parent.width/6
            }
            Rectangle{width: splitWidth;height: 1;opacity: 0.8;
                anchors.bottom: parent.bottom;color: "white"
                anchors.horizontalCenter: parent.horizontalCenter}
        }
        Rectangle{
            id:item2
            color: item2Area.pressed?pressedColor
                                      :"transparent"
            Text {
                id: item2label
                text: qsTr("说两句")
                font.family: fontName
                font.pixelSize: parent.height/fontSplit
                color: "white"
                anchors{verticalCenter: parent.verticalCenter;
                    horizontalCenter: parent.horizontalCenter;
                    horizontalCenterOffset: parent.width/6}
            }
            width: root.width;height: (root.height-2*(itemnum-1))/itemnum
            MouseArea{
                id:item2Area
                anchors.fill: parent
                onClicked: sendClicked();
            }
            Image {
                id: penyouquan
                source: "qrc:/sendIcon.png"
                width: parent.height*0.45;height: width;
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left;anchors.leftMargin: iconLeftMargin
            }
            Rectangle{width: splitWidth;height: 1;opacity: 0.8;
                anchors.bottom: parent.bottom;color: "white";
                anchors.horizontalCenter: parent.horizontalCenter}
        }
        Rectangle{
            id:item3
            color: item3Area.pressed?pressedColor
                                      :"transparent"
            width: root.width;height: (root.height-2*(itemnum-1))/itemnum
            MouseArea{
                id:item3Area
                anchors.fill: parent
                onClicked: noteClicked();
            }
            Image {
                id: caogaoxiang
                source: "qrc:/caogaoIcon.png"
                width: parent.height*0.45;height: width;
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left;anchors.leftMargin: iconLeftMargin
            }
            Text {
                id: item3label
                text: qsTr("草稿箱")
                font.family: fontName
                font.pixelSize: parent.height/fontSplit
                color: "white"
                anchors{verticalCenter: parent.verticalCenter;
                    horizontalCenter: parent.horizontalCenter;
                    horizontalCenterOffset: parent.width/6}            }
            Rectangle{width: splitWidth;height: 1;opacity: 0.8;
                anchors.bottom: parent.bottom;color: "white";
                anchors.horizontalCenter: parent.horizontalCenter}
        }
        Rectangle{
            id:item4
            color: item4Area.pressed?pressedColor
                                      :"transparent"
            width: root.width;height: (root.height-2*(itemnum-1))/itemnum
            MouseArea{
                id:item4Area
                anchors.fill: parent
                onClicked: settingClicked()
            }
            Image {
                source: "qrc:/settingIcon.png"
                width: parent.height*0.45;height: width;
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left;anchors.leftMargin: iconLeftMargin
            }
            Text {
                id: item4label
                text: qsTr("设置")
                font.family: fontName
                font.pixelSize: parent.height/fontSplit
                color: "white"
                anchors{verticalCenter: parent.verticalCenter;
                    horizontalCenter: parent.horizontalCenter;
                    horizontalCenterOffset: parent.width/6}
            }
//            Rectangle{width: splitWidth;height: 1;opacity: 0.8;
//                anchors.bottom: parent.bottom;color: "white"
//                anchors.horizontalCenter: parent.horizontalCenter}
        }
//        Rectangle{
//            id:item5
//            color: item5Area.pressed?pressedColor
//                                      :"transparent"
//            width: root.width;height: (root.height-2*(itemnum-1))/itemnum
//            MouseArea{
//                id:item5Area
//                anchors.fill: parent
//                onClicked: Qt.quit();
//            }
//            Text {
//                id: item5label
//                text: qsTr("退出")
//                font.family: fontName
//                font.pixelSize: parent.height/4
//                color: "white"
//                anchors{verticalCenter: parent.verticalCenter;
//                    horizontalCenter: parent.horizontalCenter;
//                    horizontalCenterOffset: parent.width/6}
//            }
//            Image {
//                source: "qrc:/quitIcon.png"
//                width: parent.height*0.6;height: width*0.76;
//                anchors.verticalCenter: parent.verticalCenter
//                anchors.left: parent.left;anchors.leftMargin: iconLeftMargin
//            }
//            Rectangle{width: splitWidth;height: 1;opacity: 0.8;
//                anchors.bottom: parent.bottom;color: "white"
//                anchors.horizontalCenter: parent.horizontalCenter}
//        }

/*        Rectangle{
            id:item6
            color: "transparent"
            width: root.width;height:(root.height-2*(itemnum-1))/itemnum
        }
*/
    }
}
