import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
//import QtGraphicalEffects 1.0
import "../toolcomps"

Popup {
    id:editactivity
    focus: true
    modal: true
    dim: true
    x: parent.width/2-width/2
    y:parent.height/2-height/2
    Material.elevation: 8
    width :Math.min(parent.width / 1.25 , 400)
    height: Math.min(parent.height / 2 ,400 ) //layout.implicitHeight+50
    property var fromTime: null
    property var toTime: null
    property alias tasktext: tasktextfiled.text
    property alias notetext: notetextfiled.text
    property string fromtimevalue: "0"
    property string totimevalue: "0"

    Pane{
        anchors.fill: parent
        Flickable {
            id:flickarea
            anchors.fill: parent
            //contentHeight: layout.height
            clip: true
           // contentWidth: contentItem.childrenRect.width;
            contentHeight: contentItem.childrenRect.height

            ColumnLayout {
                id:layout
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.right: parent.right
                spacing:10
                RowLayout{
                    Layout.preferredWidth: editactivity.width
                    //Layout.preferredHeight:parent.height
                    Layout.alignment: Qt.AlignRight
                    spacing: 3
                    Label{
                        Layout.alignment: Qt.AlignHCenter
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        text:"EDIT ACTIVITY"
                        color: Material.color(Material.DeepOrange)
                        font.bold: true
                        font.pointSize: 15
                        horizontalAlignment:Text.AlignHCenter
                        verticalAlignment:TextInput.AlignVCenter

                        font.underline: true
                    }

                    ToolButton{
                        id:deleteicon
                        Layout.preferredHeight: 50
                        Layout.preferredWidth: 50
                        ToolTip.text: "close"
                        ToolTip.visible: pressed
                        ToolTip.delay:500
                        ToolTip.timeout: 1000
                        Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                        Image {
                            anchors.centerIn: parent
                            source: "qrc:/images/close.png"
                        }
                        onClicked: {
                            editactivity.close()
                        }
                    }
                }
//                HorizontalDivider{
//                    Layout.fillWidth: true
//                    Layout.preferredWidth: parent.width

//                }
                TextField{
                    id:tasktextfiled
                    Layout.alignment:  Qt.AlignBottom
                    placeholderText: qsTr("task: (ex:subject to study)")
                    //text : name2
                    //implicitWidth: 300
                    Layout.preferredWidth: parent.width  //Math.min(userinfopage.width-txt.width,200)
                    color: Material.color(Material.Indigo)
                    focus: true
                    activeFocusOnPress:true
                    echoMode:TextInput.Normal
                    horizontalAlignment:Text.AlignLeft
                    verticalAlignment:TextInput.AlignBottom
                    font.pointSize: 15
                    maximumLength:100
                    selectByMouse:true
                    readOnly:false
                    //inputMask: '>A'
                    //validator: IntValidator {bottom: 11; top: 31;}
                    onTextChanged: {
                       // console.log(text)
                       //responsestr[index] = text;
                       // console.log("Settings : "+responsestr)
                    }
                }
                TextField{
                    id:notetextfiled
                    Layout.alignment:  Qt.AlignBottom
                    placeholderText: qsTr("Note : (ex: author name)")
                    //text : name2
                    //implicitWidth: 300
                    Layout.preferredWidth: parent.width  //Math.min(userinfopage.width-txt.width,200)
                    color: Material.color(Material.Indigo)
                    focus: true
                    activeFocusOnPress:true
                    echoMode:TextInput.Normal
                    horizontalAlignment:Text.AlignLeft
                    verticalAlignment:TextInput.AlignBottom
                    font.pointSize: 15
                    maximumLength:100
                    selectByMouse:true
                    readOnly:false
                    //inputMask: '>A'
                    //validator: IntValidator {bottom: 11; top: 31;}
                    onTextChanged: {
                       // console.log(text)
                       //responsestr[index] = text;
                       // console.log("Settings : "+responsestr)
                    }
                }

                TextField{
                    id:fromTimeTextField
                    Layout.alignment:  Qt.AlignBottom
                    placeholderText: qsTr("From Time")
                    //text : name2
                    Layout.preferredWidth: parent.width  //Math.min(userinfopage.width-txt.width,200)
                    color: Material.color(Material.Indigo)
                    focus: true
                    activeFocusOnPress:true
                    echoMode:TextInput.Normal
                    horizontalAlignment:Text.AlignLeft
                    verticalAlignment:TextInput.AlignBottom
                    font.pointSize: 15
                    maximumLength:100
                    selectByMouse:true
                    readOnly:true
                    //inputMask: '>A'
                    //validator: IntValidator {bottom: 11; top: 31;}
                    onTextChanged: {
                       // console.log(text)
                       //responsestr[index] = text;
                       // console.log("Settings : "+responsestr)
                    }

                    onPressed: {
                        if(fromTime === null) {
                            fromTime = Qt.createQmlObject("TimePicker{}",timetablepage);
                            fromTime.onClosed.connect(deleteobj)
                            fromTime.open()
                        }
                        function deleteobj()
                        {
                            if(fromTime != null)
                            {
                                fromtimevalue = fromTime.timevalue
                                text = fromtimevalue
                                fromTime.destroy()
                            }
                        }
                    }
                }




                TextField{
                    id:toTimeTextField
                    Layout.alignment:  Qt.AlignBottom
                    placeholderText: qsTr("To Time")
                    //text : name2
                    Layout.preferredWidth: parent.width  //Math.min(userinfopage.width-txt.width,200)
                    color: Material.color(Material.Indigo)
                    focus: true
                    activeFocusOnPress:true
                    echoMode:TextInput.Normal
                    horizontalAlignment:Text.AlignLeft
                    verticalAlignment:TextInput.AlignBottom
                    font.pointSize: 15
                    maximumLength:100
                    selectByMouse:true
                    readOnly:true
                    //inputMask: '>A'
                    //validator: IntValidator {bottom: 11; top: 31;}
                    onTextChanged: {
                       // console.log(text)
                       //responsestr[index] = text;
                       // console.log("Settings : "+responsestr)
                    }
                    onPressed: {
                        if(toTime === null) {
                            toTime = Qt.createQmlObject("TimePicker{}",timetablepage);
                            toTime.onClosed.connect(deleteobj)
                            toTime.open()
                        }
                        function deleteobj()
                        {
                            if(toTime != null)
                            {
                                totimevalue = toTime.timevalue
                                text = totimevalue
                                toTime.destroy()
                            }
                        }
                    }
                }

                ButtonFlat {
                    id: okButton
                    text: qsTr("SAVE")
                    textColor: "#FFFFFF"
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom
                    Layout.fillWidth: true
                    onClicked: {
                        itemdelg.ListView.view.model.setProperty(index, "subj", tasktext)
                        itemdelg.ListView.view.model.setProperty(index, "note",notetext)
                        itemdelg.ListView.view.model.setProperty(index, "fromTime",fromtimevalue)
                        itemdelg.ListView.view.model.setProperty(index, "toTime",totimevalue)
                        editactivity.close()
                    }
                }





            }
        }
    }

    Component.onCompleted: {
        console.log("EditActivityPopup created")
    }
    Component.onDestruction: {
        console.log("EditActivityPopup Destroyed")
    }
}

