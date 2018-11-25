import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.2
import QtQuick.Window 2.3
import QtQuick.Dialogs 1.3
import "../toolcomps"
import "../jsfiles/CreateObjectDynamic.js" as Createobj

ToolBar {
    id:toolbaroptions
    //focus: true
    property string toolbarcolor: Material.color(Material.Teal)
    property string labeltext:qsTr("home")
    property string source1:qsTr("qrc:/images/black/prev_64")
    property string source2:qsTr("qrc:/images/black/settings64_2")
    property int itemhght: 48
    property int itemwdth: 48
    property int maxhgt: 60
    property int maxwdth: 60
    property int prefhgt: 48
    property int prefwdth: 48
    focus: true
    //contentHeight: 50
    //contentWidth: mainWindow.width
    //implicitHeight: 60
    //implicitWidth: mainWindow.width
   // opacity: 1

//    background: Rectangle {
//    anchors.fill: parent
//    color: toolbarcolor
//    }

    property var settingsPopup: null
    property var msgdbbox: null
//    Settingspopup {
//        id :settingpopup

//        onClosed: {
//            panel.fontsize = Math.round(sliderpopup.fontsizevalue) ;

//        }
//    }

//    Sliderpopup {
//        id:sliderpopup

//        onClosed: {
//          settingpopup.fontSizeChange = false;
//        }
//    }

    contentItem: Rectangle{
            //implicitHeight: implicitHeight
            //implicitWidth: implicitWidth
            color: toolbarcolor
        }

    RowLayout {
        focus: true
        //spacing: 6
        anchors.fill: parent
        ToolButton {
            id:gotohome
            focus: true
            Layout.minimumHeight: itemhght
            Layout.minimumWidth: itemwdth
            Layout.maximumHeight: maxhgt
            Layout.maximumWidth: maxwdth
            Layout.preferredHeight: prefhgt
            Layout.preferredWidth: prefwdth
            Layout.alignment: Qt.AlignLeft
            ToolTip.text: "double click to exit"
            ToolTip.visible: ma1.pressed
            ToolTip.delay:1000
            ToolTip.timeout: 1000
            Image {
                anchors.centerIn:parent
                source: source1
            }

            MouseArea{
                id:ma1
                anchors.fill: parent
//                onDoubleClicked: {
//                  //  console.log("double clicked")
//                    stackView.pop()
//                }

                onClicked: {
                    if(msgdbbox == null)
                    {
                        Createobj.createObjects("qrc:/toolcomps/MessageDialogueBox.qml",homepage)
                         msgdbbox = Createobj.obj
                        if(msgdbbox !== null) {
                            msgdbbox.title= "Exit "
                            msgdbbox.text= "exit the test?"
                            msgdbbox.yes.connect(exittest)
                            msgdbbox.no.connect(nopressed)
                            msgdbbox.visible =true
                            console.log("msgdbbox was null,now created opened")
                        }
                        else
                        {
                          console.log(" RightMenuPopup : MessageDialogueBox object creation failure !!")
                        }
                  }
                  else {
                        msgdbbox.open()
                        console.log("msgdbbox was already created,now  opened")
                  }

                    function exittest()
                    {
                        stackView.pop()
                    }
                    function nopressed()
                    {
                        console.log("no pressed")
                    }

                }
            }
        }

        Label{
            id:optionlabel
           //anchors.centerIn: parent
           Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
            text:labeltext
            font.pointSize: 12
            //color: Material.color(Material.Indigo)
        }

        ToolButton{
            id:settingsbutton
            focus: false
            Layout.minimumHeight: itemhght
            Layout.minimumWidth: itemwdth
            Layout.maximumHeight: maxhgt
            Layout.maximumWidth: maxwdth
            Layout.preferredHeight: prefhgt
            Layout.preferredWidth: prefwdth
            Layout.alignment: Qt.AlignRight
            //anchors.right: parent.right
            ToolTip.text: "settings"
            ToolTip.visible: pressed
            ToolTip.delay:1000
            ToolTip.timeout: 1000
            Image {
                id:img1
                anchors.centerIn:parent
                source: source2
            }
            onClicked:{
                //stackView.push(setcomp)
                //if(stackView.currentItem !== "qrc:/toolcomps/Settings.qml")

//                stackView.find(function(item) {
                  //  console.log(item.name)

                 //   if(item.name === "jjj")  console.log("hhhh") ;
              //  });


                //if(stackView.currentItem != )
                //if(!stackView.pop(settingcomp))
              //  stackView.push(settingpopup)
               // settingpopup.open()
               // console.log(stackView.currentItem)

//                stackView.pop({Item: stackView.currentItem, immediate: true})
//                console.log(stackView.currentItem)
               //console.log("total page pushed ",stackView.depth)

                if(settingsPopup == null)
                {
                    Createobj.createObjects("qrc:/toolcomps/Settingspopup.qml",settingsbutton)
                    settingsPopup = Createobj.obj
                    if(settingsPopup !== null) {
                       settingsPopup.open()
                        console.log("settingsPopup was null,now it is created and opened")
                    }
                    else
                    {
                      console.log(" RightMenuPopup : settingsPopup object creation failure !!",settingsPopup)
                    }
                }
                else {
                    settingsPopup.open()
                    console.log("settingsPopup already created ,opened")

                }

            }
        }
    }
}

