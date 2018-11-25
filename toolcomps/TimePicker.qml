import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.2

Popup {
    id:timePickerPopup

    x: parent.width/2-width/2
    y:parent.height/2-height/2
    width :Math.min(parent.width / 2, 250)
    height: Math.min(parent.height / 2 , 250)

    property string timevalue:"0"

    property var ampmmodel:  ["AM", "PM"]

    Material.elevation: 8
    focus: true
    modal: true
    dim: true

    //background: Rectangle{color: Material.color(Material.Orange); radius: width/2 }

    function formatText(count, modelData) {
        var data = count === 12 ? modelData + 1 : modelData;
        return data.toString().length < 2 ? "0" + data : data;
    }

    FontMetrics {
        id: fontMetrics
    }

    Component {
        id: delegateComponent
        Label {
            text: timePickerPopup.formatText(Tumbler.tumbler.count, modelData)
            opacity: 1.0 - Math.abs(Tumbler.displacement) / (Tumbler.tumbler.visibleItemCount / 2)
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 12 // fontMetrics.font.pixelSize * 1.25
            onTextChanged: {Tumbler.tumbler.val = text}
        }
    }

    ColumnLayout{
        anchors.centerIn: parent
        anchors.margins: 5
        RowLayout {
            id: row
            Layout.alignment: Qt.AlignHCenter
            Tumbler {
                id: hoursTumbler
                property string val:"0"
                model: 12
                delegate: delegateComponent
            }

            Tumbler {
                id: minutesTumbler
                property string val:"0"
                model: 60
                delegate: delegateComponent
            }

            Tumbler {
                id: amPmTumbler
                property string val:"0"
                model:ampmmodel
                delegate: delegateComponent
            }
        }
        ButtonFlat {
            id: okButton
            text: qsTr("OK")
            textColor: "#FFFFFF"
            Layout.alignment: Qt.AlignHCenter
            Layout.fillWidth: true
            onClicked: {
                timevalue = hoursTumbler.val+ "." + minutesTumbler.val+ amPmTumbler.val
                timePickerPopup.close()
            }
        }
    }

    Component.onCompleted: {
        console.log("Timepicker created")
    }
    Component.onDestruction: {
        console.log("Timepicker Destroyed")
    }
}
