import QtQuick 2.2
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import QtQuick.Layouts 1.3

Flickable{
          anchors.fill: parent
          clip: true
          contentHeight: mnlyt.height
          ColumnLayout {
              id:mnlyt
          anchors.top:parent.top
          anchors.left: parent.left
          anchors.right: parent.right
          spacing: 5
          Label{
              text: "RESULT SUMMARY"
              font.pointSize: 15
              font.bold: true
              color: Material.color(Material.DeepOrange)
              Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
              Layout.margins: 5
          }

          Rectangle {
            height: result.contentHeight+50
            width: result.contentWidth+50
            color: Material.color(Material.Shade500)
            Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
            //Layout.margins: 20
            Text {
                id: result
                anchors.centerIn: parent
                font.pointSize: 13
                font.bold: true
                color: "#FFFFFF" //Material.color(Material.Cyan)
                text: qsTr("Total questions are "+totalnumanswer+"\nTotal correct answers are "+correct_answer+"\nTotal wrong answers are "+wrong_answer+"\nTotal not attempted question are "+not_attended)
            }

            Component.onCompleted: {
                console.log("created pag1")
            }
            Component.onDestruction: {
                console.log("destroyed page1")
            }
        }
      }
    }
