import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import QtGraphicalEffects 1.0
import "../toolcomps"
import "../jsfiles/handle.js" as Jsexec


 Flickable {
        id: popquestgrid
        anchors.fill: parent
        property int totalNoOfquestion: 100
        property int questclicked: 1
        signal fakemouseclick(int mousevent,int questionclicked)
        property int minquestionnum: 1
        property int maxquestnum: 60
        //property real totalGrid: 10
        property var repmodel: [{color:Material.color(Material.Green),text:"Correct Answer"},
                                {color:Material.color(Material.red),text:"Wrong Answer"},
                                {color:Material.color(Material.Grey),text:"Not Attended"}]



//        Flickable {
//        anchors.fill: parent
        clip: true
        contentHeight:lyt.height+ content.height
        //contentWidth:content.width

//        ScrollIndicator.vertical: ScrollIndicator { }
//        ScrollIndicator.horizontal: ScrollIndicator { }
       // Item{
            //anchors.bottom: parent.bottom
            //anchors.horizontalCenter: parent.horizontalCenter
        ColumnLayout {
            id:lyt
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.left: parent.left
            spacing: 10
            Label{
                id:headding
                text:"ANSWER LEGEND"
                color:Material.color(Material.DeepOrange)
                font.bold: true
                font.pointSize: 15
                Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
                //anchors.margins: 5
            }
            RowLayout {
                spacing: 5
                Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
                //Layout.margins: 5
                Repeater{
                    model : repmodel
                   delegate: RowLayout{
                        spacing: 2
                        Rectangle{
                            height: 10
                            width: 10
                            color: modelData.color
                            Layout.alignment: Qt.AlignHCenter
                        }
                        Label{
                            text:qsTr(modelData.text)
                            font.bold: true
                            font.pointSize: 12
                            Layout.alignment: Qt.AlignHCenter
                        }
                    }
                }
            }
      // }

        GridLayout {
         id:content
//         anchors.right: parent.right
//         anchors.left: parent.left
//         anchors.top: parent.top
         //anchors.centerIn: parent
         Layout.alignment: Qt.AlignCenter
         Layout.margins: 10
         columns:5
         rows:totalNoOfquestion / columns
         flow: GridLayout.TopToBottom
         Repeater {
             id:questgrid
             model: 100// totalNoOfquestion
             property int clickedQuestion: 0
             delegate: Rectangle {
                 id:questpallet
                 Layout.preferredHeight: 35
                 Layout.preferredWidth: 35
                 Text{
                     anchors.centerIn: parent
                    text:index+1
                    color:"#FFFFFF"
                    font.bold: true
                    font.pointSize:8
                 }
                 color: Material.color(Material.Green)
            }
        }
    }
 }
  //}
}
