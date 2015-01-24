import QtQuick 2.0

Rectangle {
    width: 450
    height: 800
    id:root
    property real borderweight: root.height/120
    signal schoolSelected(string s)
    Image {
        id: bg
        source: "qrc:/lgbg.jpg"
        anchors.fill: parent
    }
    ListView{
        header: Text {
            id: head
            text: qsTr("选择学校")
            font.pixelSize: root.height/30/0.8
            font.bold: true
            color: "white"
            anchors.horizontalCenter: parent.horizontalCenter
            font.family: "微软雅黑"
        }
        anchors.fill: parent
        boundsBehavior: Flickable.StopAtBounds
        model: listmodel
        delegate: Item {
            width: root.width
            height: root.height/12
            MouseArea{
                id:clickarea
                anchors.fill: parent
                onClicked: schoolSelected(label.text)
                enabled: mouseareaEnable
            }

            Text {
                id:label
                text: listText
                x:root.width/8/Math.pow(split,2)
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: parent.height/2.5/split
                font.bold: isbold
                color: clickarea.pressed?"lightblue":"white"
            }
            Rectangle{
                color: "white"
                anchors.horizontalCenter: parent.horizontalCenter
                height: borderweight/borderheight
                width: root.width*0.8*split
                anchors.bottom: parent.bottom
                visible: hasSplit
            }
        }
    }
    ListModel{
        id:listmodel
        ListElement{
            listText: "福建"
            isbold:true
            borderheight: 2
            split:1
            hasSplit:true
        }
        ListElement{
            listText: "福建师范大学"
            isbold:false
            borderheight: 4
            split: 0.8
            hasSplit:true
            mouseareaEnable:true
        }
        ListElement{
            listText: "集美大学"
            isbold:false
            borderheight: 4
            split: 0.8
            mouseareaEnable:true
            hasSplit:true
        }
        ListElement{
            listText: "厦门大学"
            isbold:false
            borderheight: 4
            split: 0.8
            mouseareaEnable:true
            hasSplit:true
        }
        ListElement{
            listText: "福州大学"
            isbold:false
            borderheight: 4
            split: 0.8
            mouseareaEnable:true
            hasSplit:true
        }
        ListElement{
            listText: "厦门理工大学"
            isbold:false
            borderheight: 4
            split: 0.8
            mouseareaEnable:true
            hasSplit:true
        }
        ListElement{
            listText: "福建工程学院"
            isbold:false
            borderheight: 4
            split: 0.8
            mouseareaEnable:true
        }
        //江西
        ListElement{
            listText: "江西"
            isbold:true
            borderheight: 2
            split: 1
            hasSplit:true
        }
        ListElement{
            listText: "华东交通大学"
            isbold:false
            borderheight: 4
            split: 0.8
            mouseareaEnable:true
        }
        //北京
        ListElement{
            listText: "北京"
            isbold:true
            borderheight: 2
            split: 1
            hasSplit:true
        }
        ListElement{
            listText: "北京科技大学"
            isbold:false
            borderheight: 4
            split: 0.8
            mouseareaEnable:true
            hasSplit:true
        }
        ListElement{
            listText: "清华大学"
            isbold:false
            borderheight: 4
            split: 0.8
            mouseareaEnable:true
            hasSplit:true
        }
        ListElement{
            listText: "北京大学"
            isbold:false
            borderheight: 4
            split: 0.8
            mouseareaEnable:true
        }

    }
    focus: true


}
