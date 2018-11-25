import QtQuick 2.2
import QtCharts 2.2
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0


Page {
    id:timetablepage
    header: HeaderResult {
        toolbarcolor: Material.color(Material.Teal)
        labeltext:"TIME TABLE"
    }
    property string timendate:Qt.formatDateTime(new Date(),"hh:mm:ss ap \ndd.MM.yyyy");


        ColumnLayout{
            id:clmlyt
           // anchors.horizontalCenter: parent.horizontalCenter
            anchors.fill: parent
//            anchors.left: parent.left
//            anchors.top: parent.top
            spacing: 0

            CurrentTime{

            }

            ListView{
                id:timetableview
               // height: contentHeight
                //anchors.margins: 10
               // Layout.alignment:  Qt.AlignHCenter //Qt.AlignVCenter | Qt.AlignTop
                //Layout.preferredHeight: contentHeight
               // Layout.preferredWidth: contentWidth
                Layout.preferredHeight: contentHeight
                //Layout.alignment: Qt.AlignLeft | Qt.AlignTop
                Layout.alignment: Qt.AlignLeft
                Layout.preferredWidth: contentWidth
                Layout.margins: 5
               // anchors.fill: parent
               // clip: true
                //height: contentHeight;anchors.left: parent.left;anchors.top: datentime.bottom

    //            Layout.fillWidth: true
    //            Layout.fillHeight: true
                model: TimetableModel{
                    id:timetablemodel
                }
                spacing: 5
                property int lll: 10
                delegate: TimetableDelegate{

                    Component.onCompleted: {
                       // console.log("cccccccc"+model.index)
                    }
                }
            }

            ButtonFlat {
                id: okButton
                text: qsTr("UPDATE")
                textColor: "#FFFFFF"
                ToolTip.text:"updated"
                Layout.alignment: Qt.AlignHCenter
                ToolTip.delay: 10
                ToolTip.timeout: 10
                Layout.preferredHeight: 50
                Layout.margins: 5
                Layout.preferredWidth: Math.min(timetablepage.width/1.5,150)
                Layout.fillWidth: false
            }
        }
}
