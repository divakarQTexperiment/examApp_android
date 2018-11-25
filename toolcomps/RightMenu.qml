import QtQuick 2.9
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.2


ToolButton {
    id:rightmenu

//    height: 40
//    width: 40
    opacity: 1
    ToolTip.text: "Menu"
    ToolTip.visible: pressed
    ToolTip.delay:1000
    ToolTip.timeout: 1000
//    contentItem: Item {
////        implicitHeight: 24
////        implicitWidth: 24
//        Image {
//            id: toolbutton2icon
//            source: "qrc:/images/white/home/menu.png"
//            //anchors.centerIn: parent
//        }
//    }

    Image {
        id: toolbutton2icon
        source: "qrc:/images/white/home/menu.png"
        anchors.centerIn: parent
    }

}
