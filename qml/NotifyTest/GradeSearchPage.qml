import QtQuick 2.0

Rectangle {
    width: 450
    height: 800
    id:root
    color: "#1158d3"
    property string stateName: "invalidState"
    property real mouseMovedistance: bgMouseArea.j
    signal pagemoved;

    Behavior on y{
        NumberAnimation{ duration: 350; easing.type: Easing.InQuad}
    }

    MouseArea{
        property real mouseStartX
        property real mouseStartY
        property real j
        id:bgMouseArea
        anchors.fill: parent
        onPressed: {
            mouseStartX=mouseX
            mouseStartY=mouseY
        }
        drag{
            target: root
            axis: Drag.YAxis
        }
        onMouseXChanged: {
            if(Math.abs(mouseY-mouseStartY) < root.height/8){
                j=mouseX-mouseStartX
                pagemoved();
            }
        }

        onMouseYChanged: {
            if(stateName=="invalidState"){
                if(mouseStartY<=root.height/20&&root.y==0){
                    drag.minimumY =0
                    drag.maximumY=root.height
                }else if(mouseStartY>root.height/20){
                    drag.maximumY=0
                    drag.minimumY=0
                }
            }else if(stateName=="SliderClosed"){
                if(mouseStartY>0&&root.y==-root.height+root.height/20){
                    drag.minimumY = -root.height+root.height/20
                    drag.maximumY = 0
                }else if(mouseStartY<0){
                    drag.maximumY=0
                    drag.minimumY=0
                }
            }
        }
        onReleased: {
            if(mouseStartY<root.height/20&&root.stateName=="invalidState"){
                root.y=height-root.height/20
                root.stateName ="SliderClosed"
            }else if(mouseStartY>0&&stateName=="SliderClosed"){
                root.y=0
                root.stateName = "invalidState"
            }
        }
    }

    /********************************
      ****
      ****      此处输入需要放置的界面
      ****
      ******************************/
    Text {
        id: friendpageLabel
        text: qsTr("成绩查询")
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: root.height/10
    }
}
