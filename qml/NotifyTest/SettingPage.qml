import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1
Rectangle {
    width:450
    height: 800
    //color: "white"
    Image{//背景
        anchors.fill: parent
        source: "qrc:/initBG.png"
    }

    id:root
    signal pagemoved;
    signal backClicked;
    signal nextClicked;
    signal aboutClicked;
    property int ind: 0
    property real dargDistance: 0
    property int itemNumber: 10
    Rectangle{
        id:head
        width: root.width
        height: root.height/8;z:1
        color: "transparent"
        Rectangle{
            width: parent.width
            height: 1
            anchors.bottom: parent.bottom
            opacity: 0.75
        }
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
        Text {
            id: headText
            text: qsTr("设置")
            font.pixelSize: root.height/30/0.8
            font.bold: true
            color: "white"
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font.family: "微软雅黑"
        }
    }
    ScrollView{
        width: root.width
        anchors{top:head.bottom;bottom: root.bottom}
        style: ScrollViewStyle{
            transientScrollBars: true
        }
        ListView{
            id: aboutview
            pressDelay: 100
            //anchors.fill: parent
            width: parent.width
            height: parent.height
            spacing: 2
            function animat(){
                var i = 0;
                for(i=0;i<listmodel.count;i++){
                    aniTimer.start()

                }
            }


            Timer{
                id:aniTimer
                interval: 50
                repeat: true
                onTriggered: {
                    if(ind<listmodel.count){
                        listmodel.get(ind).xLocation = 0
                        ind ++;
                    }else{
                        repeat = false
                        ind = 0;
                    }
                }
            }

            Component.onCompleted: {
//                var i = 0;
//                for(i=0;i<10;i++){
//                    listmodel.get(i).xLocation = 150
//                    console.debug(i+" : "+listmodel.get(i).xLocation)
//                }
                animat();
            }

//            populate: Transition {
//                    NumberAnimation { properties: "x"; duration: 1000 }
//                }
            boundsBehavior: Flickable.StopAtBounds
            model: listmodel


            delegate: Item {
                width: root.width
                height: root.height/itemNumber
                Behavior on x{
                    NumberAnimation{ duration: 300; easing.type: Easing.Linear}
                }
                x:xLocation
                Rectangle{
                    //color: "#d6f9f2"
                    color: "transparent"
                    anchors.fill: parent
                    opacity: isLable?0.5:1
                    MouseArea{
                        id:clickarea
                        enabled: isLable?false:true
                        anchors.fill: parent
                        onClicked: {
                            switch(ind)
                            {
                            case 2:nextClicked();break;
                            case 3:aboutClicked();break;
                            }
                        }
                    }

                    Text {
                        id:label
                        text: listText
                        anchors.left: parent.left
                        anchors.leftMargin: parent.width/10
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.verticalCenterOffset: isLable?(parent.height-label.height)/3:0
                        font.pixelSize: isLable?parent.height/3.5:parent.height/2.5
                        color: clickarea.pressed?"black":"white"
                    }
                    Image {
                        height: parent.height/2
                        width: height
                        anchors{
                            right: parent.right;rightMargin: parent.width/10
                            verticalCenter: parent.verticalCenter
                        }
                        source: isLable?"":"qrc:/icon4.png"
                    }
                    ZComponentSpliter{
                        splitWidth: root.width*0.8
                    }
                }
            }
        }
    }

    //设置菜单项
    ListModel{
        id:listmodel
        ListElement{
            listText:"通知"
            isLable:true
            xLocation:150
        }
        ListElement{
            listText:"通知中心"
            ind:2
            isLable:false
            xLocation:150
        }
        ListElement{
            listText:"课程表设定"
            isLable:true
            xLocation:150
        }
        ListElement{
            listText:"学期"
            isLable:false
            xLocation:150
        }
        ListElement{
            listText:"周数"
            isLable:false
            xLocation:150
        }
        ListElement{
            listText:"一天几节课"
            isLable:false
            xLocation:150
        }
        ListElement{
            listText:"学校设定"
            isLable:true
            xLocation:150
        }
        ListElement{
            listText:"更改学校"
            isLable:false
            xLocation:150
        }
        ListElement{
            listText:"关于"
            imageSource:""
            ind:3
            isLable:false
            xLocation:150
        }
        ListElement{imageSource:"";listText:"";isLable:true}
    }
}
