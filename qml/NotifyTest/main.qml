import QtQuick 2.2
Rectangle {
    id:root
    width: 450
    height: 800


    FrontMainpage{
        id:frontpage
        anchors.fill: parent
        z:1
        focus:true
        onFrontinitpageStateChanged: {
            if(frontpage.frontinitpageState=="SliderClosed")
                root.state="SliderClosed"
            if(frontpage.frontinitpageState=="invalidState")
                root.state=""
        }
        onMainHasHide:root.state = "SliderClosed"
        onMainHasActive: root.state = ""
    }
//    Test{
//        id:test
//        z:34
//        focus:true
//    }

    BackMainpage{
        id:backpage
        anchors.fill: parent
        z:0
        focus: false
        enabled: false
    }
    Rectangle{
        id:upKey
        z:4
        y:root.height
        width: root.width
        height: root.height*0.05
        Behavior on y{
            NumberAnimation{ easing.type: Easing.InCubic}
        }

        //y:root.height*0.9
        color: "transparent"
        Image {
            source: "qrc:/shangla.png"
            height: parent.height*0.6
            fillMode: Image.PreserveAspectFit
            anchors{
                horizontalCenter: parent.horizontalCenter
                verticalCenter: parent.verticalCenter
            }
            visible: (upKey.y < root.height*0.95)?0:1
        }
        MouseArea{
            id:me
            anchors.fill: parent
            drag.axis: Drag.YAxis
            drag.target: upKey

            onReleased: {
                if(upKey.y>root.height*0.95&&upKey.y<root.height){
                    //root.state = "SliderClosed"
                    upKey.y=root.height*0.95
                }
                else{
                    upKey.y=root.height
                    //upKey.opacity = 0
                    frontpage.up.contentY = 0;
                }
            }
            onMouseYChanged: {

                //frontpage.up.positionViewAtBeginning()
                if(upKey.y>=root.height*0.95){}
                else{
                    console.debug(upKey.y)
                    frontpage.up.contentY = -upKey.y+upKey.height
                }

            }
        }
    }
//    CitySelect{
//        anchors.fill: parent
//        onSchoolSelected: {
//            console.debug(s)
//        }
//    }


    states: [
        State {//frontSliderClosed
            name: "SliderClosed"
            PropertyChanges {
                target: frontpage
                focus:false
            }
            PropertyChanges {
                target: backpage
                focus:true
                enabled: true
            }
            PropertyChanges {
                target: upKey
                y:root.height*0.95
            }
        }
    ]
//    MultiPointTouchArea{
//        anchors.fill: parent
//        minimumTouchPoints: 1
//        maximumTouchPoints: 3
//        touchPoints: [
//            TouchPoint { id: point1 }
//        ]

//    }

}
