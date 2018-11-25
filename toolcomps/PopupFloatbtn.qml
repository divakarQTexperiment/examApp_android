import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import QtGraphicalEffects 1.0
import "../toolcomps"
import "../jsfiles/handle.js" as Jsexec


 Popup{
     id: popflatbutton
     focus: true
     modal: true
     dim: false
     closePolicy: Popup.CloseOnEscape |Popup.CloseOnPressOutside
     implicitWidth: contentlayout.implicitWidth
     implicitHeight: contentlayout.implicitHeight
     Material.elevation: 8
     z:1

     property var buttoninfo:[{name:"mark for review" ,icon:"qrc:/images/white/markreview24.png",color:Material.color(Material.Purple) },
                              {name:"save" ,icon:"qrc:/images/white/save24.png",color:Material.color(Material.LightGreen) },
                              {name:"clear" ,icon:"qrc:/images/white/clear24.png",color:Material.color(Material.red) },
                              {name:"exit" ,icon:"qrc:/images/white/exit24.png",color:Material.color(Material.Teal) }]
         Flickable{
          anchors.fill: parent

 /*        ColumnLayout {
             id:contentlayout
             anchors.fill: parent
             spacing: 6
             Repeater{
                model: buttoninfo
               delegate:
                   RowLayout{
                   spacing: 5
                   Rectangle{
                       id:buttondetail
                   //height:textfield.height+5
                   //width:100
                   border.width: 1
                   border.color: Material.color(Material.BlueGrey)
                   opacity: 1
                        scale: 0.85
                       height: textfield.height+20
                       width: 180
                       Layout.alignment: Qt.AlignCenter
                    anchors.left: parent.left
                    //anchors.right: parent.horizontalCenter
                    color: Material.color(Material.BlueGrey)
                   Text {
                       id: textfield
                       clip: true
                       anchors.right: parent.right
                       anchors.margins: 15
                       anchors.verticalCenter: parent.verticalCenter
                       text: qsTr(modelData.name)
                       color:"#FFFFFF" //Material.color(Material.LightBlue)
                       font.pointSize: 12
                   }
                   }
                   FloatingButton {
                   scale: 0.75
                   //x:parent.width
                   backgroundColor:modelData.color
                   imageSource:modelData.icon
                   onClicked: {

                   }
                }
             }
           }
          }*/
          RowLayout{
              anchors.centerIn: parent
              id:contentlayout
              spacing: 6
              Repeater{
                 model: buttoninfo

                delegate:
                    FloatingButton {
                    scale: 0.75
                    //x:parent.width
                    ToolTip.text: modelData.name
                    ToolTip.visible: pressed
                    ToolTip.delay:1000
                    ToolTip.timeout: 1000
                    backgroundColor:modelData.color
                    imageSource:modelData.icon
                    onClicked: {
                     //popquestgrid.changeColor(modelData.color)
                        if(modelData.name === "save") {
                            console.log("PopupFloatbtn : clicked save");
                            console.log("PopupFloatbtn : arg to editdb "+popquestgrid.questclicked+panel.radioButtonClicked+stackView.testNoquery)
                            writeToDb.setdbdata(popquestgrid.questclicked,panel.radioButtonClicked,stackView.testNoquery )
                            Jsexec.setquery(stackView.testNoquery , popquestgrid.questclicked)

                        }

                        if(modelData.name === "clear") {
                            console.log("PopupFloatbtn : clicked clear");
                            console.log("PopupFloatbtn :  arg to editdb "+popquestgrid.questclicked+panel.radioButtonClicked+stackView.testNoquery)
                            writeToDb.setdbdata(popquestgrid.questclicked,"n",stackView.testNoquery )
                            Jsexec.setquery(stackView.testNoquery , popquestgrid.questclicked)

                        }

                        if(modelData.name === "mark for review") {
                            console.log("PopupFloatbtn :  clicked mark for review");


                            //Jsexec.setquery(stackView.testNoquery , popquestgrid.questclicked)
                            var temp = queryModel.retRespVal()
                            console.log("PopupFloatbtn : queryModel.respVal is ok "+temp)
                            if(((temp === "a") || (temp === "b") || (temp === "c") ||(temp === "d")||(temp === "e")/*|| (temp === "n")*/) &&(temp===panel.radioButtonClicked))
                            {
                                console.log("PopupFloatbtn :  arg to editdb "+popquestgrid.questclicked+panel.radioButtonClicked+stackView.testNoquery)
                                writeToDb.setdbdata(popquestgrid.questclicked,(panel.radioButtonClicked+"r"),stackView.testNoquery )
                            }
                            else
                            {
                                var optclick = ""
                                if(panel.radioButtonClicked === "n") { optclick = panel.radioButtonClicked}
                                else {optclick = "r"+panel.radioButtonClicked}
                                writeToDb.setdbdata(popquestgrid.questclicked,optclick,stackView.testNoquery )
                                Jsexec.setquery(stackView.testNoquery , popquestgrid.questclicked)
                            }

                        }

                       // console.log("PopupFloatbtn : color set "+modelData.color)
                  }
               }
            }
          }
        }

         enter: Transition {
              NumberAnimation { property: "opacity"; from: 0.0; to: 1.0 }
          }
         exit: Transition {
                 NumberAnimation { property: "opacity"; from: 1.0; to: 0.0 }
             }

  }


