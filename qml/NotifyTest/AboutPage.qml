import QtQuick 2.2
Rectangle {
    width:450
    height: 800
    //color: "white"
    id:root
    signal pagemoved;
    signal backClicked;
    signal nextClicked;
    property int itemNumber: 10
    Image {
        source: "qrc:/initBG.png"
        anchors.fill: parent
    }
    ListView{
        id: aboutview
        header: Rectangle{
            width: root.width
            height: root.height/8
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
                id: head
                text: qsTr("关于")
                font.pixelSize: root.height/30/0.8
                font.bold: true
                color: "white"
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.family: "微软雅黑"
            }
        }
        anchors.fill: parent
        spacing: 2
        pressDelay: 100
        boundsBehavior: Flickable.StopAtBounds
        model: listmodel
        delegate: Item {
            width: root.width
            height: root.height/itemNumber
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
    ListModel{
        id:listmodel
        ListElement{
            listText:"给我们五星好评"
            isLable:false
        }

        ListElement{
            listText:"协议"
            isLable:false
            ind:2
        }
        ListElement{
            listText:"我们的工作室"
            isLable:false
        }
        ListElement{
            listText:"加入我们"
            isLable:false
        }
        ListElement{imageSource:"";listText:"";isLable:true}
    }
}
