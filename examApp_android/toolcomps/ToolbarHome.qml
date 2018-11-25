import QtQuick 2.9
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.2
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.3
import "../jsfiles/CreateObjectDynamic.js" as Createobj

ToolBar {
    id:hometoolbar

    property color toolbarcolor: Material.color(Material.Purple)
    Material.accent: Material.color(Material.Pink)
    property var drawerhome: null
    property var rightmenupopup: null
    property alias optionmenustate: optionopen.state
//    opacity: 1
    implicitHeight: 60
//    implicitWidth: 60

    background: Rectangle {
    anchors.fill: parent
    color: toolbarcolor
    }

//    contentItem:Rectangle {
//       // anchors.fill: parent
//       // implicitWidth: hometoolbar.implicitWidth
//       // implicitHeight: hometoolbar.implicitHeight
//        color: toolbarcolor
//        }

    RowLayout {
        anchors.fill: parent
        spacing : 6
        ToolButton {
            id:optionopen
            Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
            Layout.preferredHeight: 50
            Layout.preferredWidth: 50
            Image {
                id : optionopenicon
                anchors.centerIn:parent
                source: "qrc:/images/menu.png"
            }

            onClicked: {
                if(drawerhome === null) {
                    console.log(" creating drawerhome ")
                    Createobj.createObjects("qrc:/toolcomps/DrawerHome.qml",mainWindow)
                    drawerhome = Createobj.obj
                    if(drawerhome !== null) {
                      console.log("drawerhome : drawerhome creation success!!")
                      drawerhome.y = header.height
                    }
                    else
                    {
                      console.log(" drawerhome : drawerhome object creation failure !!",drawerhome)
                    }
                }
                else {
                    console.log("drawerhome : drawerhome object already created !!")
                }

                if(drawerhome != null)
                {
                    if(!drawerhome.opened)
                    {
                        drawerhome.open()
                        console.log("drawer opened")
                        state="iconchanged"

                    }
                    else {
                        drawerhome.close()
                        console.log("drawer closed")
                        state=""
                    }
              }

              else {
                console.log("drawerhome : drawerhome creation failure!!")
              }

            }


            states: State {
                           name: "iconchanged"
                           PropertyChanges { target: optionopenicon;source:Qt.resolvedUrl("qrc:/images/back.png")}
                       }

            transitions: Transition {
                RotationAnimator {
                    target: optionopenicon;
                    from: 0;
                    to: 360;
                    duration: 200
                    //running: true
                    //easing.type: Easing.InOutQuad
                     //easing.type: Easing.InOutElastic;
                     easing.type:Easing.Linear//Easing.InOutQuad//Easing.OutQuad//Easing.InQuad //Easing.Linear
                }
            }
        }

        Label{
            id: labelhome
            Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
            Layout.preferredHeight: 50
            Layout.preferredWidth: 50
            Layout.fillWidth: true
            Text {
                text: qsTr("APP 1.0")
                anchors.centerIn: parent
                font.pointSize: 15
                font.bold: true
                color: "white"
            }
        }

        ToolButton {
            id:rightMenu
//            anchors.right: parent.right
//            anchors.verticalCenter: parent.verticalCenter
            Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
            Layout.preferredHeight: 50
            Layout.preferredWidth: 50
            Image {
                id: buttonImage
                anchors.centerIn: parent
                source: "qrc:/images/rightmenu.png"
            }
            onClicked: {
                //rightmenupopup.open()
                /*if object not created create it,if object alreday there use created object*/
                if(rightmenupopup == null) {
                    Createobj.createObjects("qrc:/toolcomps/RightMenuPopup.qml",rightMenu)
                    rightmenupopup = Createobj.obj
                    if(rightmenupopup !== null) {
                       rightmenupopup.x = ( parent.x+parent.width-width)
                       rightmenupopup.y = (parent.y)
                       console.log("rightmenupopup was null,now created and opening it..")
                       rightmenupopup.open()
                    }
                    else
                    {
                      console.log(" RightMenuPopup : rightmenupopup object creation failure !!",rightmenupopup)
                    }
                }
                else {
                    console.log("rightmenupopup already created just opening it..")
                    rightmenupopup.open()
                }
            }
        }
}
}

