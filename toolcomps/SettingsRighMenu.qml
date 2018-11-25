import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import QtGraphicalEffects 1.0
import "../toolcomps"
import "../jsfiles/CreateObjectDynamic.js" as Createobj

Popup {
    id: popup
    Material.elevation: 8
    x: parent.width/2-width/2
    y:parent.height/2-height/2
    modal: true
    dim: true
    property int fontsize: 10
  //property bool isOk: false
    property bool lightTheme: false
    //property alias timerEnabled: timerswitch.checked
    property alias fontSizeChange: fontchange.checked
    property var slider: null

//    width: Math.min(Math.round((Math.max(parent.height,parent.width))/2),1.8*theContent.implicitWidth)
//    height:Math.min(Math.round((Math.max(parent.height,parent.width))/4),1.8*theContent.height)
   // width: (Math.max(Math.round((Math.max(parent.height,parent.width))/2),400)) > mainWindow.width ? mainWindow.width-100 : (Math.max(Math.round((Math.max(parent.height,parent.width))/2),400))
   // height:(Math.max(Math.round((Math.max(parent.height,parent.width))/4),200)) > mainWindow.height ? mainWindow.height-100 : Math.max(Math.round((Math.max(parent.height,parent.width))/4),200)
    width :Math.min(parent.width / 1.5 , 400)
    height: Math.min(parent.height / 2 , theContent.implicitHeight+50)


    Pane{
     anchors.fill: parent
    Flickable {
        id:flick
         anchors.fill: parent
         clip: true
        //contentWidth: theContent.width
        contentHeight: theContent.height
        ColumnLayout {
            id: theContent
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.top: parent.top
         //   implicitHeight: labelItem.implicitHeight+labeltext.contentHeight
          // implicitWidth:Math.max(labeltext.contentWidth,themeswitch.implicitWidth,fontchange.implicitWidth)
            spacing: 3
            Label {
                id:labeltext
                Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                text: qsTr("Settings")
                font.pointSize: mainWindow.fontsize1 //fontsize
                font.bold: true
                color: Material.color(Material.Orange)
            }
            HorizontalDivider {
                id:divider
                Layout.preferredWidth:theContent.width
                Layout.fillWidth: true
                //Layout.alignment: Qt.AlignCenter
            }
            Switch {
                id: themeswitch
                Layout.alignment: Qt.AlignLeft
                topPadding: 6
                leftPadding: 12
                text: qsTr("Light Theme")
                font.pointSize: mainWindow.fontsize1-3
                checked: lightTheme
                onCheckedChanged: {
                   if(checked === false)
                   {
                       text = qsTr("Light Theme")
                       lightTheme = false
                   }
                   else
                   {
                       text = qsTr("Dark Theme")
                       lightTheme = true
                   }
                   mainWindow.themeColor = lightTheme
                }
            }
//            Switch {
//                id: timerswitch
//                Layout.alignment: Qt.AlignLeft
//                leftPadding: 12
//                text: qsTr("Timer Enabled")
//                checked: true
//                onCheckedChanged: {
//                    if(checked === false)
//                    {
//                        pagetoolbar.stopTimer()
//                        text = qsTr("Timer Disable")
//                        console.log("SettingsPopup : Disable Timer")
//                    }
//                    else
//                    {
//                        pagetoolbar.startTimer()
//                        text = qsTr("Timer Enabled")
//                        console.log("SettingsPopup : Enable Timer")

//                    }
//                }
//            }
            RadioButton {
                id: fontchange
                text: qsTr("Change Font Size")
                font.pointSize: mainWindow.fontsize1-3
                checked:false
                topPadding: 6
                leftPadding: 12
                Layout.alignment: Qt.AlignLeft
                ToolTip.text : "font size " + homepage.hometextFontsize;
                ToolTip.visible: false
                ToolTip.delay: 3
                ToolTip.timeout: 1500

                onCheckedChanged: {
                    if(checked === true)
                    {
                        //sliderpopupRightMenu.open()
                        if(slider == null) {
                            Createobj.createObjects("qrc:/toolcomps/Sliderpopup.qml",homepage)
                            slider = Createobj.obj
                            slider.fontsizevalueChanged.connect(changefontsize)
                            slider.closed.connect(changeCheckedstate)
                            if(slider !== null) {
                               slider.fontsizevalue  = homepage.hometextFontsize
                               slider.open()
                                console.log("slider was null,now created and opened")
                            }
                            else {
                                console.log("object null")
                            }
                        }
                        else {
                            slider.open()
                            console.log("slider already created now opened it")
                        }

                    function changeCheckedstate() {
                        if(checked === true) {
                            checked = false;
                        }
                        else {
                            console.log("wrong !!")
                        }

                        if(fontchange.ToolTip.visible === false )
                            fontchange.ToolTip.visible = true;
                        else
                            fontchange.ToolTip.visible = false;
                    }
                        function changefontsize() {
                            if(slider.fontsizevalue >= 1) {
                                homepage.hometextFontsize = Math.round(slider.fontsizevalue) ;
                            }
                        }
                }
            }

            }

            ButtonFlat {
                id: okButton
                text: qsTr("CLOSE")
                Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                textColor:"#FFFFFF"   //Material.color(Material.Blue)// accentColor
                onClicked: {
                    popup.close()
                }
            }

        }
        ScrollIndicator.vertical: ScrollIndicator { }

    }
  }

} // popup
