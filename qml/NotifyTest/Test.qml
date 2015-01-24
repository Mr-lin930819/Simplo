import QtQuick 2.0

Rectangle {
    id:root
    ListView{
        id:mylist
        model: myModel
    }
    VisualItemModel{
        id:myModel
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
        }
        Rectangle{
            anchors.fill:parent
            color: "transparent"
        }
    }
}
