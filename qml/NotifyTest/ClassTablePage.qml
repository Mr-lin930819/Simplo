import QtQuick 2.0

Rectangle {
    width: 450
    height: 800
    id:root
    color: "#e6b608"
    clip: true
    property string stateName: "invalidState"
    property real mouseMovedistance: bgMouseArea.j
    property real mouseDowndistance:bgMouseArea.dy
    property MouseArea bgMouseArea: bgMouseArea
    signal pagemoved;
    signal downGesture;

    Behavior on y{
        NumberAnimation{ duration: 350; easing.type: Easing.InQuad}
    }

    MouseArea{
        property real mouseStartX
        property real mouseStartY
        property real j
        property real dy
        id:bgMouseArea
        anchors.fill: parent
        onPressed: {
            mouseStartX=mouseX
            mouseStartY=mouseY
        }
        onMouseXChanged: {
            if(Math.abs(mouseY-mouseStartY) < root.height/8){
                j=mouseX-mouseStartX
                pagemoved();
            }
        }
        onMouseYChanged:{
            if(Math.abs(mouseX-mouseStartX) < root.width/8){
            dy=mouseY-mouseStartY
            downGesture();
            }
        }

//        onMouseYChanged: {
//            if(stateName=="invalidState"){
//                if(mouseStartY<=root.height/20&&root.y==0){
//                    drag.minimumY =0
//                    drag.maximumY=root.height
//                }else if(mouseStartY>root.height/20){
//                    drag.maximumY=0
//                    drag.minimumY=0
//                }
//            }else if(stateName=="SliderClosed"){
//                if(mouseStartY>0&&root.y==-root.height+root.height/20){
//                    drag.minimumY = -root.height+root.height/20
//                    drag.maximumY = 0
//                }else if(mouseStartY<0){
//                    drag.maximumY=0
//                    drag.minimumY=0
//                }
//            }
//        }
//        onReleased: {
//            if(mouseStartY<root.height/20&&root.stateName=="invalidState"){
//                root.y=height-root.height/20
//                root.stateName ="SliderClosed"
//            }else if(mouseStartY>0&&stateName=="SliderClosed"){
//                root.y=0
//                root.stateName = "invalidState"
//            }
//        }
    }

    /********************************
      ****
      ****      此处输入需要放置的界面
      ****
      ******************************/
    PageClassTable{
        anchors.fill: parent
    }
    MouseArea{
        anchors.fill: parent
        onPressed: {
            mouse.accepted = false
        }
        drag.target: root
        drag.axis: Drag.XAxis
    }

//    Text {
//        id: friendpageLabel
//        text: qsTr("课程表")
//        anchors.horizontalCenter: parent.horizontalCenter
//        font.pixelSize: root.height/10
//    }
}
