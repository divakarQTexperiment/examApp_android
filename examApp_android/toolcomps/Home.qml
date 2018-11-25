import QtQuick 2.9
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.2
import QtQuick.Window 2.3
import QtQuick.Dialogs 1.3
import "../toolcomps"
//import QtTimeTableClass 1.0


   Page {
    id:homepage
    property real hometextFontsize: 12 //texthome.font.pointSize
   // anchors.fill: parent
    header: ToolbarHome{
        id : header
            //toolbarheight: 80
            //labeltext:qsTr("HOME")
            //source1:qsTr("qrc:/images/black/list32.png")
            //source1: Qt.resolvedUrl("qrc:/images/white/list24.png")

//            Connections {
//                target: header.drawerhome
//                onClosed: {
//                    if(header.optionmenustate=="iconchanged"){
//                       header.optionmenustate="";
//                    }
//                }
//            }
        }

    SwipeView{
        id:swp
        anchors.fill: parent
        currentIndex: tabBar.currentIndex
//        Item{
//            Text {
//                id: home
//                anchors.centerIn: parent
//                font.pointSize: hometextFontsize
//                text: qsTr("HOME PAGE")
//            }
//        }
        ListView{

            model: proxyModel
            delegate: Text{
                id:pp
                text: task
            }

        }

        Item{
            Text {
                id: cpage
                anchors.centerIn: parent
                font.pointSize: hometextFontsize
                text: qsTr("C Program")
            }
        }

        Item{
            Text {
                id: cpppage
                anchors.centerIn: parent
                font.pointSize: hometextFontsize
                text: qsTr("C++ Program")
            }
        }

        Item{
            Text {
                id: javapage
                anchors.centerIn: parent
                font.pointSize: hometextFontsize
                text: qsTr("Java Program")
            }
        }

    }


    footer:HomeFooter{
        id: tabBar
          currentIndex: swp.currentIndex

    }





//    Component.onCompleted: {
////    drawerhome.y = header.height
//    }
//    Component.onProgressChanged: {
//        console.log("ffffffffffff")
//    }


//    Path {
//        id:line
//        startX: 100; startY: 100
//        PathLine { id:pt;x: 100000; y: 100 }


//    }
//    Image {
//        id:jjj
//        source: "qrc:/images/icon.jpg"
//        //scale: 0.25
//    }


//    NumberAnimation {
//        id: xyAnimation
//        loops: 1
//        target: pt
//        properties: "x,y"
//        easing.type: Easing.InOutQuad
//        duration: 2000
//        to: 500
//        running: false
//    }

//    Component.onCompleted: {
//        xyAnimation.running=true
//    }

}
