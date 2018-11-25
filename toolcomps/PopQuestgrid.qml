import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import QtGraphicalEffects 1.0
import "../toolcomps"
import "../jsfiles/handle.js" as Jsexec


 Popup{
        id: popquestgrid
        focus: true
        modal: true
        dim: false
        property int totalNoOfquestion: 60
        closePolicy: Popup.CloseOnEscape |Popup.CloseOnPressOutside
        z:0
        property int questclicked: 1
        signal fakemouseclick(int mousevent,int questionclicked)
        property int minquestionnum: 1
        property int maxquestnum: 60
        height:Math.min(Math.max(mainWindow.height,mainWindow.width)/1.5,420)
        width: Math.min(Math.max(mainWindow.height,mainWindow.width)/1.5,280)

        x: parent.width/2-width/2
        y:parent.height/2-height/2

        Flickable {
        anchors.fill: parent
        clip: true
        contentHeight: content.height
        //contentWidth: content.width

        ScrollIndicator.vertical: ScrollIndicator { }
        ScrollIndicator.horizontal: ScrollIndicator { }

        GridLayout {
         id:content
         anchors.right: parent.right
         anchors.left: parent.left
         anchors.top: parent.top

         columns: 6
         rows:10
         flow: GridLayout.TopToBottom
         Repeater {
             id:questgrid
             model: totalNoOfquestion

             property int clickedQuestion: 0
             delegate: Rectangle {
                 id:questpallet
                 Layout.preferredHeight: 35
                 Layout.preferredWidth: 35
                 property int colorstate: 0
                 property MouseArea bbb: ma
                 //signal clickedquestno(int k)
                // signal changecolor(color whichcolor)
                 signal setprevcolorascolor(color whichcolor,bool imgvisible)
                 color: Material.color(Material.LightBlue)
                 Text{text:index+1 ;anchors.centerIn: parent;font.pointSize: 10}
                 Image {
                     id: tickMark
                     source: "qrc:/images/test_img/tick.png"
                     scale: 1
                     anchors.bottom: parent.bottom
                     anchors.right: parent.right
                     anchors.margins: 2
                     visible: false
                 }

                 onSetprevcolorascolor: {
                     if((whichcolor === Material.color(Material.LightBlue)) && (color===Material.color(Material.Brown))) {
                       color=Material.color(Material.red)

                     }
                     else
                     {
                        color=whichcolor
                     }
                     tickMark.visible=imgvisible

                 }

                 MouseArea {
                     id :ma
                     anchors.fill: parent
                     onClicked: {
                         if (mouse===null ) {
                             console.log("PopQuestgrid  : mouse-->null ")
                         }
                         whichcolortoset() //here previously entered quest set to proper color
                         questpallet.color=Material.color(Material.Brown)
                         questclicked=index+1;
                         console.log(" PopQuestgrid : questclicked "+questclicked)
                         Jsexec.setquery(stackView.testNoquery , popquestgrid.questclicked)

                         panel.currentIndex=0
                 }


             }
          }
             Component.onCompleted: {
                 var i
                 for(i=totalNoOfquestion-1;i>=0;i--)
                questgrid.itemAt(i).bbb.clicked(null);

                 //fakeclickhandle(0,null);
             }
       }
        Component.onCompleted: {
            popquestgrid.fakemouseclick.connect(fakeclickhandle)
        }
     }
 }


        function fakeclickhandle(msevent,questionclicked) {
            if((questionclicked >= (minquestionnum-1)) && (questionclicked <= (maxquestnum-1))) {
            questgrid.itemAt(questionclicked).bbb.clicked(msevent);
            }
            else {
                if(questionclicked < (minquestionnum-1))
                    questgrid.itemAt(maxquestnum-1).bbb.clicked(msevent);
                if(questionclicked > (maxquestnum-1))
                    questgrid.itemAt(minquestionnum-1).bbb.clicked(msevent);
            }
        }

        function whichcolortoset() {
            var col = Material.color(Material.Yellow)
            var k=false
            Jsexec.setquery(stackView.testNoquery , popquestgrid.questclicked)
            var temp = queryModel.retRespVal()
         //   console.log("PopQuestgrid  : queryModel.respVal "+temp)
            if((temp==="a")||(temp==="b")||(temp==="c")||(temp==="d")||(temp==="e")) {
               // console.log("#####saved answer#####"+Material.color(Material.LightGreen))
                questgrid.itemAt(questclicked-1).setprevcolorascolor(Material.color(Material.LightGreen),false)
            }
            else if((temp==="ra")||(temp==="rb")||(temp==="rc")||(temp==="rd")||(temp==="re")) {
               // console.log("#####mark for review answer#####")
                questgrid.itemAt(questclicked-1).setprevcolorascolor(Material.color(Material.Purple),false)
            }
            else if((temp==="ar")||(temp==="br")||(temp==="cr")||(temp==="dr")||(temp==="er"))
            {
               // console.log("#####saved and mark for review answer#####")
                questgrid.itemAt(questclicked-1).setprevcolorascolor(Material.color(Material.Purple),true)

            }
            else if(temp==="n") {
               // console.log("#####cleared answer#####")
                questgrid.itemAt(questclicked-1).setprevcolorascolor(Material.color(Material.red),false)

            }
            else if(temp==="x") {
              //  console.log("#####not entered response answer#####")
                questgrid.itemAt(questclicked-1).setprevcolorascolor(Material.color(Material.LightBlue),false)

            }
            else{
              //  console.log("#####exp condition#####")
                questgrid.itemAt(questclicked-1).setprevcolorascolor(Material.color(Material.Yellow),false)
            }

        }

        enter: Transition {
             NumberAnimation { property: "opacity"; from: 0.0; to: 1.0 }
         }
        exit: Transition {
                NumberAnimation { property: "opacity"; from: 1.0; to: 0.0 }
            }

   }

