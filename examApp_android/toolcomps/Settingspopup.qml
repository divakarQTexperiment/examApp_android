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
    x: parent.width-width
    y: parent.height
//    width: Math.max(mainWindow.width, mainWindow.height) / 3
//    height:Math.min(mainWindow.height, theContent.height + 30)
    width: (Math.max(Math.round((Math.max(parent.height,parent.width))/2),200)) > mainWindow.width ? mainWindow.width-100 : (Math.max(Math.round((Math.max(parent.height,parent.width))/2),200))
    height:(Math.max(Math.round((Math.max(parent.height,parent.width))/4),250)) > mainWindow.height ? mainWindow.height-100 : Math.max(Math.round((Math.max(parent.height,parent.width))/4),250)

    property int fontsize: 10
  //  property bool isOk: false
    property bool lightTheme: false
    property alias timerEnabled: timerswitch.checked
    property alias fontSizeChange: fontchange.checked
    property var slider: null


    Flickable {
        contentHeight: popup.height
        anchors.fill: parent
        // Attention: clip should be used carefully,
        // but using a ListView inside a Popup
        // you must set it to true
        // otherwise content will appear outside while scrolling
        // don't clip at Paopup: will cut the elevation shadow
        clip: true

        ColumnLayout {
            id: theContent
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.top: parent.top
            spacing: 6
            Label {
                Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                text: qsTr("Settings")
                font.pointSize: 18
                font.bold: true
                color: Material.color(Material.Orange)
            }
            Switch {
                id: themeswitch
                Layout.alignment: Qt.AlignLeft
                topPadding: 6
                leftPadding: 12
                text: qsTr("Light Theme")
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
            Switch {
                id: timerswitch
                Layout.alignment: Qt.AlignLeft
                leftPadding: 12
                text: qsTr("Timer Enabled")
                checked: true
                onCheckedChanged: {
                    if(checked === false)
                    {
                        pagetoolbar.stopTimer()
                        text = qsTr("Timer Disable")
                        console.log("SettingsPopup : Disable Timer")
                    }
                    else
                    {
                        pagetoolbar.startTimer()
                        text = qsTr("Timer Enabled")
                        console.log("SettingsPopup : Enable Timer")

                    }
                }
            }
            RadioButton {
                id: fontchange
                text: qsTr("Change Font Size")
                checked:false
                topPadding: 6
                leftPadding: 12
                Layout.alignment: Qt.AlignLeft
                ToolTip.text : "font size " + panel.fontsize;
                ToolTip.visible: false
                ToolTip.delay: 3
                ToolTip.timeout: 1500

                onCheckedChanged: {
//                    if(checked == true)
//                    {
//                        sliderpopup.open()
//                    }
                    if(checked === true)
                    {
                        //sliderpopupRightMenu.open()
//                        Createobj.createObjects("qrc:/toolcomps/Sliderpopup.qml",toolbaroptions)
//                        var slider = Createobj.obj
//                        slider.fontsizevalueChanged.connect(changefontsize)
//                        slider.closed.connect(changeCheckedstate)
//                        if(slider !== null) {
//                           slider.x = ((mainWindow.width/2)-(slider.width/2))
//                           slider.y = ((mainWindow.height/2)-(slider.height/2))
//                           slider.open()
//                    }
//                    else {
//                        console.log("object null")
//                    }
                        if(slider == null)
                        {
                            Createobj.createObjects("qrc:/toolcomps/Sliderpopup.qml",page1)
                            slider = Createobj.obj
                            slider.fontsizevalueChanged.connect(changefontsize)
                            slider.closed.connect(changeCheckedstate)
                            if(slider !== null) {
                               //slider.x = ((mainWindow.width/2)-(slider.width/2))
                               //slider.y = ((mainWindow.height/2)-(slider.height/2))
                               slider.fontsizevalue  = panel.fontsize
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
                                checked =false;
                            }
                            else
                                console.log("wrong !!")
                        }

                        if(ToolTip.visible === false )
                            ToolTip.visible = true;
                        else
                            ToolTip.visible = false;

                        function changefontsize() {
                            if(slider.fontsizevalue >= 1) {
                                panel.fontsize = Math.round(slider.fontsizevalue) ;
                            }
                        }
                }
               }
            }


           // RowLayout {
//                ButtonFlat {
//                    id: cancelButton
//                    text: qsTr("Cancel")
//                    textColor: Material.color(Material.Blue)
//                    opacity: 0.7//opacityBodySecondary
//                    onClicked: {
//                        isOk = false
//                        popup.close()
//                    }
//                }
                ButtonFlat {
                    id: okButton
                    text: qsTr("Close")
                    textColor:Material.color(Material.Blue)// accentColor
                    onClicked: {
                       // isOk = true
                        popup.close()
                    }
                }
           // }
        }

        ScrollIndicator.vertical: ScrollIndicator { }

    }

//    function update() {
//        if(isOk) {
//        mainWindow.themeColor = lightTheme


//        }
//        themeswitch.checked = lightTheme
//        timerswitch.checked = timerEnabled
//        fontchange.checked = fontSizeChange;

//    }

//    onClosed: {
//        update()
//    }

} // popup
