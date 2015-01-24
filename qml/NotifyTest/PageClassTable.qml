import QtQuick 2.2
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import QtQuick.XmlListModel 2.0

Rectangle {
    width: 360
    height: 640
    id:root
    //获取当前星期
    function getDay(){
        return "thu";
    }
    XmlListModel {
        id: xmlModel
        source: "qrc:/classtable.xml"
        query: "/rss/channel/item"

        XmlRole { name: "className"; query: "className/string()" }
        XmlRole { name: "day"; query: "day/number()" }
        XmlRole { name: "time"; query: "time/number()" }
        XmlRole { name: "addr"; query: "addr/string()" }
    }

//    GridView{
//        id : classTable
//        anchors.fill: parent
//    }
    Rectangle{
        id:title
        color: "#fc7664"
        width: root.width
        height: root.height/12
        z:2
        Text {
            text: qsTr("课程表")
            color: "white"
            font.pixelSize: title.height/2
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }
        Item {
            width: parent.width/3
            height: title.height
            Column{
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                Text{
                    text: "2014年"
                    color: "white"
                    font.pixelSize: title.height/5
                }
                Text{
                    text: "AUGEST"
                    color: "white"
                    font.pixelSize: title.height/3
                }
            }
        }
    }
    Rectangle{
        id:weekheader
        color: "#fdfbdf"
        anchors.top:title.bottom
        width: root.width
        height: root.height/13
        property real cellwidth: (weekheader.width-classheader.width)/7
        z:2
        Row{
            Rectangle{
                width: classheader.width
                height: weekheader.height
                color: "transparent"
                Image{
                    anchors.fill: parent
                    source: "qrc:/corner.png"
                }
            }
            Rectangle{
                width: weekheader.cellwidth
                height: weekheader.height
                color: "transparent"
                Image {
                    fillMode: Image.PreserveAspectFit
                    anchors.fill: parent
                    source: (getDay()==="mon")?"qrc:/selDay.png":undefined
                }
                Text {
                    id:monText
                    text: qsTr("MON")
                    font.pixelSize: parent.height/3
                    color: getDay()==="mon"?"white":"black"
                    anchors{
                        verticalCenter: parent.verticalCenter
                        verticalCenterOffset: -parent.height/8
                        horizontalCenter: parent.horizontalCenter
                    }
                }
                Text {
                    id: date1
                    text: qsTr("10")
                    font.pixelSize: parent.height/3
                    color: getDay()==="mon"?"white":"black"
                    anchors{
                        top:monText.bottom
                        horizontalCenter: parent.horizontalCenter
                    }
                }
            }
            Rectangle{
                width: weekheader.cellwidth
                height: weekheader.height
                color: "transparent"
                Image {
                    fillMode: Image.PreserveAspectFit
                    anchors.fill: parent
                    source: (getDay()==="tur")?"qrc:/selDay.png":undefined
                }
                Text {
                    id:turText
                    text: qsTr("TUE")
                    font.pixelSize: parent.height/3
                    color: getDay()==="tur"?"white":"black"
                    anchors{
                        verticalCenter: parent.verticalCenter
                        verticalCenterOffset: -parent.height/8
                        horizontalCenter: parent.horizontalCenter
                    }
                }
                Text {
                    id: date2
                    text: qsTr("11")
                    font.pixelSize: parent.height/3
                    color: getDay()==="tur"?"white":"black"
                    anchors{
                        top:turText.bottom
                        horizontalCenter: parent.horizontalCenter
                    }
                }
            }
            Rectangle{
                width: weekheader.cellwidth
                height: weekheader.height
                color: "transparent"
                Image {
                    fillMode: Image.PreserveAspectFit
                    anchors.fill: parent
                    source: (getDay()==="wed")?"qrc:/selDay.png":undefined
                }
                Text {
                    id:wedText
                    text: qsTr("WED")
                    font.pixelSize: parent.height/3
                    color: getDay()==="wed"?"white":"black"
                    anchors{
                        verticalCenter: parent.verticalCenter
                        verticalCenterOffset: -parent.height/8
                        horizontalCenter: parent.horizontalCenter
                    }
                }
                Text {
                    id: date3
                    text: qsTr("10")
                    font.pixelSize: parent.height/3
                    color: getDay()==="wed"?"white":"black"
                    anchors{
                        top:wedText.bottom
                        horizontalCenter: parent.horizontalCenter
                    }
                }
            }
            Rectangle{
                width: weekheader.cellwidth
                height: weekheader.height
                color: "transparent"
                Image {
                    fillMode: Image.PreserveAspectFit
                    anchors.fill: parent
                    source: (getDay()==="thu")?"qrc:/selDay.png":undefined
                }
                Text {
                    id:thuText
                    text: qsTr("THU")
                    font.pixelSize: parent.height/3
                    color: getDay()==="thu"?"white":"black"
                    anchors{
                        verticalCenter: parent.verticalCenter
                        verticalCenterOffset: -parent.height/8
                        horizontalCenter: parent.horizontalCenter
                    }
                }
                Text {
                    id: date4
                    text: qsTr("13")
                    font.pixelSize: parent.height/3
                    color: getDay()==="thu"?"white":"black"
                    anchors{
                        top:thuText.bottom
                        horizontalCenter: parent.horizontalCenter
                    }
                }
            }
            Rectangle{
                width: weekheader.cellwidth
                height: weekheader.height
                color: "transparent"
                Image {
                    fillMode: Image.PreserveAspectFit
                    anchors.fill: parent
                    source: (getDay()==="fri")?"qrc:/selDay.png":undefined
                }
                Text {
                    id:friText
                    text: qsTr("FRI")
                    font.pixelSize: parent.height/3
                    color: getDay()==="fri"?"white":"black"
                    anchors{
                        verticalCenter: parent.verticalCenter
                        verticalCenterOffset: -parent.height/8
                        horizontalCenter: parent.horizontalCenter
                    }
                }
                Text {
                    id: date5
                    text: qsTr("14")
                    font.pixelSize: parent.height/3
                    color: getDay()==="fri"?"white":"black"
                    anchors{
                        top:friText.bottom
                        horizontalCenter: parent.horizontalCenter
                    }
                }
            }
            Rectangle{
                width: weekheader.cellwidth
                height: weekheader.height
                color: "transparent"
                Image {
                    fillMode: Image.PreserveAspectFit
                    anchors.fill: parent
                    source: (getDay()==="sat")?"qrc:/selDay.png":undefined
                }
                Text {
                    id:satText
                    text: qsTr("SAT")
                    font.pixelSize: parent.height/3
                    color: getDay()==="sat"?"white":"black"
                    anchors{
                        verticalCenter: parent.verticalCenter
                        verticalCenterOffset: -parent.height/8
                        horizontalCenter: parent.horizontalCenter
                    }
                }
                Text {
                    id: date6
                    text: qsTr("10")
                    font.pixelSize: parent.height/3
                    color: getDay()==="sat"?"white":"black"
                    anchors{
                        top:satText.bottom
                        horizontalCenter: parent.horizontalCenter
                    }
                }
            }
            Rectangle{
                width: weekheader.cellwidth
                height: weekheader.height
                color: "transparent"
                Image {
                    fillMode: Image.PreserveAspectFit
                    anchors.fill: parent
                    source: (getDay()==="sun")?"qrc:/selDay.png":undefined
                }
                Text {
                    id:sunText
                    text: qsTr("SUN")
                    font.pixelSize: parent.height/3
                    color: getDay()==="sun"?"white":"black"
                    anchors{
                        verticalCenter: parent.verticalCenter
                        verticalCenterOffset: -parent.height/8
                        horizontalCenter: parent.horizontalCenter
                    }
                }
                Text {
                    id: date7
                    text: qsTr("16")
                    font.pixelSize: parent.height/3
                    color: getDay()==="sun"?"white":"black"
                    anchors{
                        top:sunText.bottom
                        horizontalCenter: parent.horizontalCenter
                    }
                }
            }
        }
    }
    Item{
        id:classheader
        anchors.top:weekheader.bottom

        anchors.topMargin: -classTable.contentY
        z:1
        Column{
            Rectangle{
                color: "#fdfbdf"
                height: classheader.height/6
                width: classheader.width
                border.color: "#7d764e"
                border.width: 1
                Text {
                    text: qsTr("1")
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: parent.height*2/3
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pixelSize: parent.width/2
                }
                Text {
                    text: qsTr("2")
                    anchors.top: parent.top
                    anchors.topMargin: parent.height*2/3
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pixelSize: parent.width/2
                }
            }
            Rectangle{
                color: "#fcfbdc"
                height: classheader.height/6
                width: classheader.width
                border.color: "#7d754e"
                border.width: 1
                Text {
                    text: qsTr("3")
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: parent.height*2/3
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pixelSize: parent.width/2
                }
                Text {
                    text: qsTr("4")
                    anchors.top: parent.top
                    anchors.topMargin: parent.height*2/3
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pixelSize: parent.width/2
                }
            }
            Rectangle{
                color: "#fdfcdf"
                height: classheader.height/6
                width: classheader.width
                border.color: "#7d754e"
                border.width: 1
                Text {
                    text: qsTr("5")
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: parent.height*2/3
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pixelSize: parent.width/2
                }
                Text {
                    text: qsTr("6")
                    anchors.top: parent.top
                    anchors.topMargin: parent.height*2/3
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pixelSize: parent.width/2
                }
            }
            Rectangle{
                color: "#fcfbdc"
                height: classheader.height/6
                width: classheader.width
                border.color: "#7d754e"
                border.width: 1
                Text {
                    text: qsTr("7")
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: parent.height*2/3
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pixelSize: parent.width/2
                }
                Text {
                    text: qsTr("8")
                    anchors.top: parent.top
                    anchors.topMargin: parent.height*2/3
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pixelSize: parent.width/2
                }
            }
            Rectangle{
                color: "#fcfbdc"
                height: classheader.height/6
                width: classheader.width
                border.color: "#7d754e"
                border.width: 1
                Text {
                    text: qsTr("9")
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: parent.height*2/3
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pixelSize: parent.width/2
                }
                Text {
                    text: qsTr("10")
                    anchors.top: parent.top
                    anchors.topMargin: parent.height*2/3
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pixelSize: parent.width/2
                }
            }
            Rectangle{
                color: "#fcfbdc"
                height: classheader.height/6
                width: classheader.width
                border.color: "#7d754e"
                border.width: 1
                Text {
                    text: qsTr("11")
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: parent.height*2/3
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pixelSize: parent.width/2
                }
                Text {
                    text: qsTr("12")
                    anchors.top: parent.top
                    anchors.topMargin: parent.height*2/3
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pixelSize: parent.width/2
                }
            }
        }

        width: weekheader.height*0.75
        height: (root.height-2*title.height)*2*6/10
    }
    Rectangle{
        id:tableback
        anchors.top: weekheader.bottom
        anchors.left: classheader.right
        width: parent.width-classheader.width
        height: parent.height-2*title.height
        color: "#fdfbdf"
    }
    GridView{
        id:classTable
        anchors.top: weekheader.bottom
        anchors.left: classheader.right
        width: parent.width-classheader.width
        height: parent.height-2*title.height
        cellWidth : width/7
        cellHeight:  height/5

//        header: Item{
//            Row{
//                Rectangle{
//                    color: "red"
//                    width: root.width/1.5
//                    height: title.height
//                }
//                Rectangle{
//                    color: "green"
//                    height: title.height
//                    width: root.width/1.5
//                }
//            }
//        }
        boundsBehavior:Flickable.StopAtBounds
//        TableViewColumn{ role: "mon"  ; title: "Mon" ; width: parent.width/7 }
//        TableViewColumn{ role: "tur" ; title: "Tur" ; width: parent.width/7}
//        TableViewColumn{ role: "wen" ; title: "Wen" ; width: parent.width/7}
//        TableViewColumn{ role: "thu" ; title: "Thu" ; width: parent.width/7}
//        TableViewColumn{ role: "fri" ; title: "Fri" ; width: parent.width/7}
//        TableViewColumn{ role: "sat" ; title: "Sat" ; width: parent.width/7}
//        TableViewColumn{ role: "sun" ; title: "Sun" ; width: parent.width/7 }
        model: xmlModel
        delegate: Column {
//            width: parent.width/7
//            height: parent.height/6
            Image{
                width: classTable.width/7
                height: classTable.height/5
                //anchors.fill: parent
                source: /*cellback*/((day+time)%2==0)?"qrc:/class_cell.png":"qrc:/class_cell_2.png"
                clip: true
                anchors.horizontalCenter: parent.horizontalCenter
                Text {
                    text: /*tur*/className
                    horizontalAlignment: Text.AlignHCenter
                    wrapMode: Text.WordWrap
                    verticalAlignment: Text.AlignVCenter
                    width: parent.width
                    height: parent.height
                    color: "white"
                    font.pixelSize: parent.width/4
                    //anchors.bottom: parent.bottom

                    anchors.verticalCenter: parent.verticalCenter
                }
            }

        }
    }
    ListModel {
       id: libraryModel
       ListElement{ tur: "毛概" ;cellback:"qrc:/class_cell.png"}
       ListElement{ mon: "A Masterpiece" ; tur: "Gabriel" ;wen:"kakak";thu:"lLl";fri:"ksks";sat:"dad";sun:"sun"}
       ListElement{ mon: "A Masterpiece" ; tur: "Gabriel" ;wen:"kakak";thu:"lLl";fri:"ksks";sat:"dad";sun:"sun"}
       ListElement{ mon: "A Masterpiece" ; tur: "Gabriel" ;wen:"kakak";thu:"lLl";fri:"ksks";sat:"dad";sun:"sun"}
       ListElement{ mon: "A Masterpiece" ; tur: "Gabriel" ;wen:"kakak";thu:"lLl";fri:"ksks";sat:"dad";sun:"sun"}
       ListElement{ tur: "经济学" ;cellback:"qrc:/class_cell_2.png"}
       ListElement{ mon: "A Masterpiece" ; tur: "Gabriel" ;wen:"kakak";thu:"lLl";fri:"ksks";sat:"dad";sun:"sun"}
       ListElement{ mon: "A Masterpiece" ; tur: "Gabriel" ;wen:"kakak";thu:"lLl";fri:"ksks";sat:"dad";sun:"sun"}
       ListElement{ mon: "A Masterpiece" ; tur: "Gabriel" ;wen:"kakak";thu:"lLl";fri:"ksks";sat:"dad";sun:"sun"}
       ListElement{ tur: "大学英语" ;cellback:"qrc:/class_cell_3.png"}
       ListElement{ mon: "A Masterpiece" ; tur: "Gabriel" ;wen:"kakak";thu:"lLl";fri:"ksks";sat:"dad";sun:"sun"}
       ListElement{ mon: "A Masterpiece" ; tur: "Gabriel" ;wen:"kakak";thu:"lLl";fri:"ksks";sat:"dad";sun:"sun"}
       ListElement{ tur: "高数" ;cellback:"qrc:/class_cell_4.png"}
       ListElement{ mon: "A Masterpiece" ; tur: "Gabriel" ;wen:"kakak";thu:"lLl";fri:"ksks";sat:"dad";sun:"sun"}
       ListElement{ mon: "A Masterpiece" ; tur: "Gabriel" ;wen:"kakak";thu:"lLl";fri:"ksks";sat:"dad";sun:"sun"}
       ListElement{ mon: "A Masterpiece" ; tur: "Gabriel" ;wen:"kakak";thu:"lLl";fri:"ksks";sat:"dad";sun:"sun"}
       ListElement{ tur: "土木工程" ;cellback:"qrc:/class_cell.png"}
       ListElement{ mon: "A Masterpiece" ; tur: "Gabriel" ;wen:"kakak";thu:"lLl";fri:"ksks";sat:"dad";sun:"sun"}
       ListElement{ mon: "A Masterpiece" ; tur: "Gabriel" ;wen:"kakak";thu:"lLl";fri:"ksks";sat:"dad";sun:"sun"}
       ListElement{ mon: "A Masterpiece" ; tur: "Gabriel" ;wen:"kakak";thu:"lLl";fri:"ksks";sat:"dad";sun:"sun"}
       ListElement{ mon: "A Masterpiece" ; tur: "Gabriel" ;wen:"kakak";thu:"lLl";fri:"ksks";sat:"dad";sun:"sun"}
       ListElement{ mon: "A Masterpiece" ; tur: "Gabriel" ;wen:"kakak";thu:"lLl";fri:"ksks";sat:"dad";sun:"sun"}
       ListElement{ tur: "汇编语言" ;cellback:"qrc:/class_cell_2.png"}
       ListElement{ tur: "体育" ;cellback:"qrc:/class_cell.png"}
       ListElement{ mon: "A Masterpiece" ; tur: "Gabriel" ;wen:"kakak";thu:"lLl";fri:"ksks";sat:"dad";sun:"sun"}
       ListElement{ mon: "A Masterpiece" ; tur: "Gabriel" ;wen:"kakak";thu:"lLl";fri:"ksks";sat:"dad";sun:"sun"}
       ListElement{ tur: "计算机网络" ;cellback:"qrc:/class_cell_3.png"}
       ListElement{ tur: "思修" ;cellback:"qrc:/class_cell.png"}
       ListElement{ mon: "A Masterpiece" ; tur: "Gabriel" ;wen:"kakak";thu:"lLl";fri:"ksks";sat:"dad";sun:"sun"}
       ListElement{ mon: "A Masterpiece" ; tur: "Gabriel" ;wen:"kakak";thu:"lLl";fri:"ksks";sat:"dad";sun:"sun"}
       ListElement{ mon: "A Masterpiece" ; tur: "Gabriel" ;wen:"kakak";thu:"lLl";fri:"ksks";sat:"dad";sun:"sun"}
       ListElement{ mon: "A Masterpiece" ; tur: "Gabriel" ;wen:"kakak";thu:"lLl";fri:"ksks";sat:"dad";sun:"sun"}
       ListElement{ mon: "A Masterpiece" ; tur: "Gabriel" ;wen:"kakak";thu:"lLl";fri:"ksks";sat:"dad";sun:"sun"}
       ListElement{ mon: "A Masterpiece" ; tur: "Gabriel" ;wen:"kakak";thu:"lLl";fri:"ksks";sat:"dad";sun:"sun"}
       ListElement{ mon: "A Masterpiece" ; tur: "Gabriel" ;wen:"kakak";thu:"lLl";fri:"ksks";sat:"dad";sun:"sun"}
       ListElement{ mon: "A Masterpiece" ; tur: "Gabriel" ;wen:"kakak";thu:"lLl";fri:"ksks";sat:"dad";sun:"sun"}
       ListElement{ tur: "宏观经济学" ;cellback:"qrc:/class_cell_4.png"}
       ListElement{ mon: "A Masterpiece" ; tur: "Gabriel" ;wen:"kakak";thu:"lLl";fri:"ksks";sat:"dad";sun:"sun"}
       ListElement{ mon: "A Masterpiece" ; tur: "Gabriel" ;wen:"kakak";thu:"lLl";fri:"ksks";sat:"dad";sun:"sun"}
       ListElement{ mon: "A Masterpiece" ; tur: "Gabriel" ;wen:"kakak";thu:"lLl";fri:"ksks";sat:"dad";sun:"sun"}
       ListElement{ mon: "A Masterpiece" ; tur: "Gabriel" ;wen:"kakak";thu:"lLl";fri:"ksks";sat:"dad";sun:"sun"}
       ListElement{ mon: "A Masterpiece" ; tur: "Gabriel" ;wen:"kakak";thu:"lLl";fri:"ksks";sat:"dad";sun:"sun"}

    }
}
