import QtQuick 2.9
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.2

ItemDelegate{
    id:expandicon
    anchors.top: parent.bottom
    visible: false
    ColumnLayout{
      anchors.fill: parent
      spacing: 6
      Rectangle{
          id: entertest
          //text:"Enter test"
          //implicitHeight: 60
          //implicitWidth: 70
          height:50
          width: 150
          RowLayout{
              anchors.fill: parent
              Text {
                  Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                  text: qsTr("Take test")
              }
              Image {
                  Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                  source: "qrc:/images/black/numoftestsicon/taketest24.png"
              }
          }
      }
      Button{
          id: resumetest
          //text:"Resume"
          implicitHeight: 40
          implicitWidth: 40
          Image {
              anchors.centerIn: parent
              source: "qrc:/images/black/numoftestsicon/resumetest.png"
          }
      }
      Button{
          id: checkresult
          //text: "check result"
          implicitHeight: 40
          implicitWidth: 40
          Image {
              anchors.centerIn: parent
              source: "qrc:/images/black/numoftestsicon/checkres24.png"
          }
      }
    }

//    states: State {
//                   name: "expand"
//                   PropertyChanges {
//                       target: expandicon;visible:true;
//           }
//     }

//   transitions: Transition {

//                    PropertyAnimation{ properties: "visible";duration: 300; easing.type: Easing.InOutQuad  }

//   }
}

