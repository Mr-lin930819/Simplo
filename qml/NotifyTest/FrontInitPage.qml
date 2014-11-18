import QtQuick 2.3
import QtQuick.Controls 1.2
Rectangle {
    id:root
    color: "transparent"
    property int totalItems: 4
    property int totalListHeight:height/*-height/20*1*/
    signal button1Click;
    signal button2Click;
    signal button3Click;
    signal button4Click;
    signal button5Click;



    Timer{
        id:timer
        interval: 1000
        running: false
        onTriggered:{
            menu.y = root.height/20*19
        }
    }
    Item{
        id: menu
        width: root.width
        height: root.height
        Behavior on y{
            NumberAnimation{ easing.type: Easing.OutQuad;
                duration: (menu.y<=slideBar.height/2)?100:300}
        }

        Rectangle{
            id: slideBar
            border.color:"#6998f2"
            width: parent.width
            height: parent.height/20
            color: "#436a8e"
            anchors.top: parent.top
//            anchors.topMargin: height+parent.y*0.1
            MouseArea{
                id:sliderMouseArea
                x:0;/*y:-parent.height;*/y:0;height: parent.height; width: parent.width;
                //anchors.fill: parent
                drag{
                    target: menu
                    axis: Drag.YAxis
                    minimumY: 0
                }
                onReleased: {
                    if(menu.y>=slideBar.height/2){//当菜单向下收缩超过屏幕一半时，应该继续向下:
                        if(root.state != "SliderClosed"){
                            menu.y=root.height-slideBar.height*2
                            root.state="SliderClosed"
                            timer.start();
                        }
                    }else if(menu.y<=slideBar.height/2){//当菜单是向上展开时，应该继续向上至顶
                        menu.y=0
                        //menu.destroy();
                    }
                }
            }

            Column{
                anchors.centerIn: parent
                spacing: parent.height/6
                Repeater{
                    model: 3
                    Rectangle{
                        color: "white"
                        width: root.width/10
                        height: slideBar.height/6
                    }
                }
            }
        }
        Column{
            id:buttonColumn
            //anchors.top: slideBar.bottom
            anchors.top: slideBar.top
//            anchors.topMargin: slideBar.height/*-menu.y*0.08*/
            //spacing: -30-menu.y/totalItems    //用于收缩动画
            spacing: 0
            ButtomItem{
                id:button1
                //buttoncolor: "red"
                buttoncolor: "#fa7967"
                iconRes: "qrc:/main_icon1.png"
                buttonlabel: "课程表"
                labelcolor: "white"
                buttonRadius: 0
                height: totalListHeight/totalItems
                width: root.width
                onButtonclicked: button1Click();
            }
            ButtomItem{
                id:button2
                //buttoncolor: "green"
                buttoncolor: "#84d0be"
                //buttonBack: "qrc:/buttonpad.png"
                iconRes: "qrc:/main_icon2.png"
                buttonlabel: "成绩单"
                labelcolor: "white"
                buttonRadius: 0
                height: totalListHeight/totalItems
                width: root.width
                onButtonclicked: button2Click();
            }
            ButtomItem{
                id:button3
                //buttoncolor: "lightgreen"
                buttoncolor: "#9b79c3"
                //buttonBack: "qrc:/buttonpad.png"
                buttonlabel: "话匣子"
                iconRes: "qrc:/main_icon3.png"
                labelcolor: "white"
                buttonRadius: 0
                height: totalListHeight/totalItems
                width: root.width
                onButtonclicked: button3Click();
            }
            ButtomItem{
                id:button4
                //buttoncolor: "orange"
                buttoncolor: "#ffaf57"
                //buttonBack: "qrc:/buttonpad.png"
                buttonlabel: "好基友"
                iconRes: "qrc:/main_icon4.png"
                labelcolor: "white"
                buttonRadius: 0
                height: totalListHeight/totalItems
                width: root.width
                onButtonclicked: {
                    //notificationClient.notification="我的app"
                    button4Click();
                }
            }
//            ButtomItem{
//                id:button5
//                //buttoncolor: "lightgrey"
//                buttoncolor: "transparent"
//                buttonBack: "qrc:/buttonpad.png"
//                buttonlabel: "退出"
//                labelcolor: "black"
//                buttonRadius: 0
//                height: totalListHeight/totalItems
//                width: root.width
//                onButtonclicked: {
//                    button5Click();
//                    Qt.quit()
//                }
//            }
        }
    }
    states: [
        State {
            name: "SliderClosed"
            PropertyChanges {
                target: sliderMouseArea
                onReleased:{
                    if(menu.y<=root.height-slideBar.height){
                        menu.y=0
                        root.state="invalidState"

                    }else{
                        //menu.y=root.height-slideBar.height*5
                    }
                }
                y:0
            }
            PropertyChanges {
                target: buttonColumn
                enabled:false
            }
        }
    ]
}
