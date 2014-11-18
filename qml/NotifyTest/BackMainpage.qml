import QtQuick 2.0
import QtQuick.Controls 1.1

Rectangle {
    id:root
    width: 450
    height: 800
    property Component initpage: InitPage{
        onSettingClicked: mainview.push({item:settingpage,destroyOnPop:false})
        onSendClicked: mainview.push({item:informationpage,destroyOnPop:true})
        onNoteClicked: mainview.push({item:classtablepage,destroyOnPop:true})
    }
    property Component settingpage: SettingPage{
        onPagemoved: {
            if(mouseMovedistance>root.width/3){
                mainview.pop(settingpage)
            }
        }
        onBackClicked: mainview.pop(settingpage)
        onAboutClicked: mainview.push(aboutpage)
    }
    property Component informationpage: InformationPage{
        onPagemoved: {
            if(mouseMovedistance>root.width/3){
                mainview.pop(informationpage)
            }
        }
        onLoginPageAccepted: {
            root.focus=true;
            //console.debug("-------------focus:"+root.focus+"canBack"+canBack)
        }
        onLoginPageClicked: mainview.push(hasloginpage)
    }
    property Component classtablepage: PageClassTable{

    }
    property Component aboutpage: AboutPage{
        onBackClicked: {
            mainview.pop(aboutpage)
        }
        onNextClicked: {
            mainview.push(protocolpage)
        }
    }
    property Component protocolpage: ProtocolPage{
        onBackClicked: mainview.pop(protocolpage)
    }
    property Component hasloginpage: HasLoginPage{
        onPagemoved: {
            if(hasloginpage.mouseMovedistance>root.width/3){
                mainview.pop(hasloginpage)
            }
        }
    }

    Keys.onPressed: {
        console.debug("releasing........."+focus)
        if(event.key===Qt.Key_Back)
        {
            event.accepted=true
            console.debug("back.........")
            if(mainview.depth>1)
                mainview.pop()
        }
    }
    StackView{
        id:mainview
        anchors.fill: parent
        focus: true
        initialItem: initpage
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
}
