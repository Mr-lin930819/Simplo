import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQml.Models 2.1
Rectangle {
    id:root
    property string frontinitpageState
    signal mainHasHide()
    signal mainHasActive()
    property ListView up: mainV
    color: "transparent"
    property Component frontinitpage: FrontInitPage{
        onButton1Click: {mainview.push(classtablepage);mainV.interactive=false}
        onButton2Click: mainview.push(friendgrouppage)
        onButton3Click: mainview.push(gradesearchpage)
        onButton4Click: mainview.push(friendspage)
        Binding{
            target: root
            property:"frontinitpageState"
            value: state
        }
    }
    property Component friendspage: FriendsPage{
        onPagemoved: {
            if(mouseMovedistance>root.width/3){
                mainview.pop(frontinitpage)
            }
        }
        Binding{
            target: root
            property: "frontinitpageState"
            value: stateName
        }
    }
    property Component gradesearchpage: GradeSearchPage{
        onPagemoved: {
            if(mouseMovedistance>root.width/3){
                mainview.pop(frontinitpage)
            }
        }
        Binding{
            target: root
            property: "frontinitpageState"
            value: stateName
        }
    }
    property Component friendgrouppage: FriendGroupPage{
        onPagemoved: {
            if(mouseMovedistance>root.width/3){
                mainview.pop(frontinitpage)
            }
        }
        Binding{
            target: root
            property: "frontinitpageState"
            value: stateName
        }
    }
    property Component classtablepage: ClassTablePage{
        //返回手势
        onPagemoved: {
            if(mouseMovedistance>root.width/3){
                mainview.pop(frontinitpage)
                mainV.interactive=true
            }
        }
        Binding{
            target: root
            property: "frontinitpageState"
            value: stateName
        }
        //下滑手势
        onDownGesture: {
            if(mouseDowndistance >=root.height/16){
                mainV.contentY = -root.height
            }
        }
    }

    Keys.onReleased: {
        if(event.key===Qt.Key_Back)
        {
            event.accepted=true
            console.debug("backing.........")
            if(mainview.depth>1)
                mainview.pop()
        }
    }
    ListView{
        id:mainV
        Behavior on contentY {
            NumberAnimation{ easing.type: Easing.InSine}
        }

        model: kkkk
        width: root.width;height: root.height
        pressDelay: 100
        boundsBehavior: Flickable.StopAtBounds
        verticalLayoutDirection: ItemView.BottomToTop
        snapMode: ListView.SnapToItem
        onContentYChanged: {
            console.debug("DEPTH"+mainview.depth)
            //console.debug(contentY+"jjj"+mainV.y)
            if(contentY <= -root.height+1){
                //focus = false
                mainHasHide()
//                root.enabled = false

                //root.state = "hasclose"
                //mainV.height = root.height*0.1
                //mainV.y = root.height*0.9
                interactive = false
            }else if(contentY>-root.height+20){
                //root.enabled = true
                mainHasActive()
                //root.state = ""
                //mainV.height = root.height
                //mainV.y = 0
//                if(mainview.depth > 1)//如果是主菜单则可以下滑，否则不能
//                    interactive = false
//                else
                    interactive = true            }
        }
    }

    ObjectModel{
        id:kkkk

        StackView{
            id:mainview
            y:0
            width: root.width;height: root.height
            focus: true

            initialItem: frontinitpage
            delegate: StackViewDelegate {
                pushTransition: StackViewTransition {
                    function transitionFinished(properties)
                    {
                        properties.exitItem.opacity = 1
                    }
                    PropertyAnimation {
                        target: enterItem
                        property: "x"
                        from: target.width
                        to: 0
                        duration: 300
                        easing.type: Easing.OutSine
                    }
                    PropertyAnimation {
                        target: exitItem
                        property: "x"
                        from: 0
                        to: -target.width
                        duration: 300
                        easing.type: Easing.OutSine
                    }
                }
                popTransition: StackViewTransition {
                    function transitionFinished(properties)
                    {
                        properties.exitItem.opacity = 1
                    }
                    PropertyAnimation {
                        target: enterItem
                        property: "x"
                        from: -target.width
                        to: 0
                        duration: 300
                        easing.type: Easing.OutSine
                    }
                    PropertyAnimation {
                        target: exitItem
                        property: "x"
                        from: 0
                        to: target.width
                        duration: 300
                        easing.type: Easing.OutSine

                    }
                }

                property Component replaceTransition: pushTransition
            }
        }
        Rectangle{
            id:blankRect
            width: root.width;height: root.height
            color: "transparent"
        }
    }

}
