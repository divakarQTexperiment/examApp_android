import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import QtGraphicalEffects 1.0
import "../toolcomps"
import "../jsfiles/handle.js" as Jsexec

Page {
    id:page1
    focus:true
//    anchors.fill: parent
//  property alias swipecurrentindex: swipepage.currentIndex
    property alias swipecurrentindex: panel.currentIndex
//  property string variable: qsTr("33")

    header: Toolbaroptions {
        id:exheader
        height:40
        toolbarcolor: Material.color(Material.Teal)
        labeltext:optionheading
        source1:qsTr("qrc:/images/white/back24.png")
        source2:qsTr("qrc:/images/white/settings24.png")
    }


    Tabbar {
    id:pagetoolbar
    height: 140
    width: parent.width
    backgroundcolor:Material.color(Material.Teal)

//    Connections {
//        target: poppause
//        onClosed: {
//            console.log("ex1 : pause popup closed")
//            pagetoolbar.playiconsource = Qt.resolvedUrl(pagetoolbar.playbutton)
//            pagetoolbar.startTimer()
//            console.log("ex1 : Timer started")
//        }
//        onOpened: {
//            console.log("ex1 : pause popup opened")
//           pagetoolbar.stopTimer()
//            console.log("ex1 : Timer stoped")
//        }
//    }
}

//    ListView {
//        id : panel
//        anchors.fill : parent
////      property real currentIndex : 0
//        property int currentIndex : 0
//        model:Delegatemodelexpanel{}
//        contentItem.height: panel.height
//        contentItem.width: panel.width
////      contentItem.anchors.fill: panel
//        onCurrentIndexChanged: {
//            pagetoolbar.tabcurrentindex = currentIndex;
//        }
////      model : queryModel
////      delegate: DelOfPanel{}
//    }

    SwipeQnOt {
        id : panel
        anchors.top: pagetoolbar.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        Component.onCompleted: {
           // console.log("ex1 : intially calling query")
//            var query = Jsexec.formquerystring(stackView.testNoquery , popquestgrid.questclicked)
//            console.log(query)
//            Jsexec.setquery(query)
            Jsexec.setquery(stackView.testNoquery , popquestgrid.questclicked)
          //  console.log("ex1 : intially calling query ends here")
        }

    }
    PageIndicator {
        id: indicator
        count: panel.count
        currentIndex: panel.currentIndex
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }

//    FloatingButton {
//        id:plusfloatbutton
//        backgroundColor:Material.color(Material.Orange)
////      shadowcolor:"black"
//        imageSource: Qt.resolvedUrl("qrc:/images/white/add24.png")
//        z: 1
//        anchors.margins: 20
//        anchors.right: parent.right
//        anchors.bottom: parent.bottom
//        scale: 1
//        ToolTip.text: "floating button"
//        ToolTip.visible: pressed
//        ToolTip.delay:1000
//        ToolTip.timeout: 1000
//        onClicked: {
//            popup.open()
//           if(imageSource == Qt.resolvedUrl("qrc:/images/white/add24.png"))
//            imageSource= Qt.resolvedUrl("qrc:/images/white/multiply24.png")
//     }
//    }

//    PopupFloatbtn{
//        id:popup
//        parent: page1
//        x:plusfloatbutton.x-(implicitWidth)-10//+(plusfloatbutton.implicitWidth)-(width)-plusfloatbutton.anchors.leftMargin
//        y:plusfloatbutton.y+plusfloatbutton.implicitHeight+80//-plusfloatbutton.implicitHeight-(implicitHeight)
//          //plusfloatbutton.y+plusfloatbutton.height+20-100//-implicitHeight-20
//        onClosed: {
//            plusfloatbutton.imageSource="qrc:/images/white/add24.png"
//            console.log(plusfloatbutton.y,plusfloatbutton.x,y,x,plusfloatbutton.height,plusfloatbutton.implicitHeight)
//        }
//    }

//    Rectangle{
//        height: 10
//        width: 10
//        color: "black"
////        y:popup.y
////        x:popup.x
//        x:popup.x
//        y:popup.y
//    }

    PopQuestgrid {
        id:popquestgrid
        parent: page1
       // signal changequestiongridcolor(int buttonnum)
       // y:pagetoolbar.ycordofqppopup
        //x:pagetoolbar.xcordofqppopup
        //x:0
       // clip: true
//        onChangequestiongridcolor: {
//            //if(buttonnum == 1)

//        }
    }

//    PopupPause {
//        id:poppause
//        parent: page1
//        leftMargin: (parent.width/2)-(implicitWidth/2)
//        rightMargin: (parent.width/2)-(implicitWidth/2)
//        topMargin: (parent.height/2)-(implicitHeight/2)
//        bottomMargin: (parent.height/2)-(implicitHeight/2)
//    }

}
