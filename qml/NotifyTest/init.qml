import QtQuick 2.0
import QtQuick.Controls 1.1

Rectangle {
    id:initscreen
//    width: mainview.width
//    height: mainview.height
    width: 360
    height: 640
    Image {
        id: bg
        source: "qrc:/initbg.jpg"
        anchors.fill: parent
        Behavior on opacity {
            NumberAnimation{ duration: 1000; easing.type: Easing.InQuad}
        }

        onOpacityChanged: {
            if(opacity<=0.05){
                mainpage.opacity=1
                //console.debug("full.........")
                //mainview.show();
            }
        }
    }
    Loader{
        id:mainpage
        opacity: 0
        Behavior on opacity {
            NumberAnimation{ duration: 350; easing.type: Easing.InQuad}
        }
    }
    Timer{
        id:timer
        interval: 100
        repeat: false
        onTriggered: {
            //mainview.showFullScreen()
            mainpage.setSource("main.qml",{"height":parent.height,"width":parent.width})
            focus=false
            mainpage.focus=true
            bg.opacity=0
        }
        running: true
    }

}
