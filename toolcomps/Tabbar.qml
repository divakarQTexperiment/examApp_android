import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import QtGraphicalEffects 1.0
import "../toolcomps"
import "../jsfiles/CreateObjectDynamic.js" as Createobj


ToolBar{
    id:tabbar

    property alias backgroundcolor:backrect.color
    property color textcolor: Material.color(Material.DeepPurple)
    property double ycordofqppopup:questionpallet.y+questionpallet.height
    property double xcordofqppopup:questionpallet.x  /*topRow.spacing+digitaltimer.width+
                                   topRow.spacing+questionpallet.width*/
    property int rwlthgt: 70
    property int itemhght: 70
    property int itemwdth: 70
    property int maxhgt: 100
    property int maxwdth: 100
    property int prefhgt: 70
    property int prefwdth: 70
    property alias playiconsource: playicon.source
    property alias tabcurrentindex: tabBarIcon.currentIndex
    property var tabbarmodel: [{text:"DESCRIPTION",icon:"description.png",tooltip:"Question description"},
                            {text:"QUESTION",icon:"question.png",tooltip:"Question"},
                            {text:"OPTIONS",icon:"options.png",tooltip:"Options"},]

    property string prevbutton: "qrc:/images/white/prev24.png"
    property string nextbutton: "qrc:/images/white/next24.png"
    property string gridbutton: "qrc:/images/white/grid24.png"
    property string playbutton: "qrc:/images/white/play24.png"
    property string pausebutton: "qrc:/images/white/pause24.png"

    signal stopTimer()
    signal startTimer()

    property var popuppuaseVar: null
    property var questgridpopup: null

    Component.onCompleted: {
         stopTimer.connect(digitaltimer.stopTimerInterrup)
        startTimer.connect(digitaltimer.startTimerInterrup)
      }

    contentItem: Rectangle{
            id: backrect
            color: backgroundcolor
    }

    focus: true

    RowLayout{
        id:topRow
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.verticalCenter

        spacing: 6
        focus: true
         DigitalTimer{
             id:digitaltimer
             Layout.minimumHeight: itemhght
             Layout.minimumWidth: itemwdth
             Layout.maximumHeight: maxhgt
             Layout.maximumWidth: maxwdth
             Layout.preferredHeight: prefhgt
             Layout.preferredWidth: prefwdth
             Layout.leftMargin: parent.spacing
             Layout.alignment: Qt.AlignVCenter
             textcolor: Material.color(Material.Yellow)
             color:Material.color(Material.LightBlue)
             radius: 40
         }

    ToolButton {
         id:questionpallet
         focus: true
//         Layout.minimumHeight: itemhght
//         Layout.minimumWidth: itemwdth
//         Layout.maximumHeight: maxhgt
//         Layout.maximumWidth: maxwdth
         Layout.preferredHeight: prefhgt
         Layout.preferredWidth: prefwdth
         Layout.alignment: Qt.AlignTop
         ToolTip.text: "question pallet"
         ToolTip.visible: pressed
         ToolTip.delay:1000
         ToolTip.timeout: 1000
         leftPadding: 10
         Image {
                 anchors.centerIn:parent
                 source:Qt.resolvedUrl(gridbutton)
             }
         onClicked: {
             popquestgrid.x = questionpallet.x+questionpallet.width-popquestgrid.width/2
             popquestgrid.y =questionpallet.y+questionpallet.width+25
             popquestgrid.open()

//             if(questgridpopup == null)
//             {
//                 Createobj.createObjects("qrc:/toolcomps/PopQuestgrid.qml",page1)
//                 questgridpopup = Createobj.obj
//                 if(questgridpopup !== null) {
//                    questgridpopup.open()
//                    console.log("questgridpopup was null,now it is created and opened")
//                 }
//                 else
//                 {
//                   console.log(" Tabbar : questgridpopup object creation failure !!",questgridpopup)
//                 }
//             }
//             else {
//                 questgridpopup.open()
//                 console.log("questgridpopup already created ,opened")
//             }

         }
         }

     ToolButton{
         id:pause
         focus: true

         Layout.minimumHeight: itemhght
         Layout.minimumWidth: itemwdth
         Layout.maximumHeight: maxhgt
         Layout.maximumWidth: maxwdth
         Layout.preferredHeight: prefhgt
         Layout.preferredWidth: prefwdth
         Layout.alignment: Qt.AlignTop
         ToolTip.text: "pause"
         ToolTip.visible: pressed
         ToolTip.delay:1000
         ToolTip.timeout: 1000
         Image {
             id:playicon
             anchors.centerIn:parent
             source:Qt.resolvedUrl(playbutton)
         }
         onClicked:{
          //   poppause.open()

//         Createobj.createObjects("qrc:/toolcomps/PopupPause.qml",page1)
//         var popuppuase = Createobj.obj
//         if(popuppuase !== null) {
//                popuppuase.x = ((mainWindow.width/2)-(popuppuase.width/2))
//                popuppuase.y = ((mainWindow.height/2)-(popuppuase.height/2))
//                popuppuase.open()
//         }
//         else {
//             console.log("object null")
//         }

         if(popuppuaseVar == null)
         {
             Createobj.createObjects("qrc:/toolcomps/PopupPause.qml",page1)
             popuppuaseVar = Createobj.obj
             if(popuppuaseVar !== null) {
                 popuppuaseVar.onOpened.connect(changeIcon)
                  popuppuaseVar.onOpened.connect(tabbar.stopTimer)
                 popuppuaseVar.onClosed.connect(changeIcon)
                 popuppuaseVar.onClosed.connect(tabbar.startTimer)
                popuppuaseVar.open()
                console.log("popuppuaseVar was null,now it is created and opened")
             }
             else
             {
               console.log(" Tabbar : popuppuaseVar object creation failure !!",popuppuaseVar)
             }
         }
         else {
             popuppuaseVar.open()
             console.log("popuppuaseVar already created ,opened")
         }

            function changeIcon()
            {
                 if(playicon.source == Qt.resolvedUrl(playbutton))
                     playicon.source = Qt.resolvedUrl(pausebutton)
                 else
                     playicon.source = Qt.resolvedUrl(playbutton)
            }
         }

        }
     ToolButton{
         id:previous
         focus: true
         Layout.minimumHeight: itemhght
         Layout.minimumWidth: itemwdth
         Layout.maximumHeight: maxhgt
         Layout.maximumWidth: maxwdth
         Layout.preferredHeight: prefhgt
         Layout.preferredWidth: prefwdth
         Layout.alignment: Qt.AlignTop
         ToolTip.text: "previous"
         ToolTip.visible: pressed
         ToolTip.delay:1000
         ToolTip.timeout: 1000
         Image {
             id:previcon
             anchors.centerIn:parent
             source:Qt.resolvedUrl(prevbutton)
         }
         onClicked: {
         //    console.log("previous question button clicked")
              popquestgrid.fakemouseclick(2,(popquestgrid.questclicked-2))
              //   console.log("called  popquestgrid.fakemouseclick(2,)"+(popquestgrid.questclicked-1))
         }
      }
     ToolButton{
         id:next
         focus: true
         Layout.minimumHeight: itemhght
         Layout.minimumWidth: itemwdth
         Layout.maximumHeight: maxhgt
         Layout.maximumWidth: maxwdth
         Layout.preferredHeight: prefhgt
         Layout.preferredWidth: prefwdth
         Layout.alignment: Qt.AlignTop
         ToolTip.text: "next"
         ToolTip.visible: pressed
         ToolTip.delay:1000
         ToolTip.timeout: 1000
        onClicked: {
      //  console.log("next question button clicked")
         popquestgrid.fakemouseclick(1,popquestgrid.questclicked)
        //    console.log("called  popquestgrid.fakemouseclick(1,) "+ popquestgrid.questclicked)
        }
         Image {
             id:nexticon
             anchors.centerIn:parent
             source:Qt.resolvedUrl(nextbutton)
         }

       }
    }
 //  }
    TabBar{
        id: tabBarIcon
        Material.accent: Material.color(Material.Pink)
        anchors.top: topRow.bottom
        anchors.left: parent.left
       anchors.right: parent.right
        anchors.bottom: parent.bottom
        currentIndex: page1.swipecurrentindex //0
        background: Rectangle{
                id: backrect2
                color: backgroundcolor
        }
//        contentItem:
//            Rectangle{
//                id: backrect2
//                implicitHeight: 10
//                implicitWidth: 10
//                color: backgroundcolor
//        }

        onCurrentIndexChanged: {
            //swipepage.currentIndex=currentIndex
            page1.swipecurrentindex=currentIndex
        }
        Repeater {
            model: tabbarmodel
            anchors.fill: parent
            TabButton {
                focusPolicy: Qt.NoFocus
                height: tabbar.height-(topRow.height-digitaltimer.height)
                //opacity: index == tabBarIcon.currentIndex? 1 : 0.5
                anchors.bottom: parent.bottom
                anchors.verticalCenter:parent.verticalCenter
                ToolTip.text: modelData.tooltip
                ToolTip.visible: pressed
                ToolTip.delay:1000
                ToolTip.timeout: 1000
                contentItem:
                    Item {
                    anchors.centerIn: parent
                    Label {
                        anchors.centerIn: parent
                        //color: textcolor
                        opacity: index == tabBarIcon.currentIndex? 1 : 0.75
                        text: modelData.text
                        font.pointSize: 12
                    }
                }
            }
        }
    }
}



