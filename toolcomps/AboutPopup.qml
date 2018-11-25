import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import QtGraphicalEffects 1.0
import "../toolcomps"

Popup {
    id:aboutpopup
    focus: true
    modal: true
    dim: true
//    implicitHeight: abouttext.implicitHeight
//    implicitWidth: abouttext.implicitWidth
//    height: Math.max(abouttext.implicitHeight,mainWindow.height/3)
//    width: Math.max( abouttext.implicitWidth,mainWindow.width/1.5)

   // width: (Math.max(Math.round((Math.max(parent.height,parent.width))/2),400)) > mainWindow.width ? mainWindow.width-100 : (Math.max(Math.round((Math.max(parent.height,parent.width))/2),400))
   // height:(Math.max(Math.round((Math.max(parent.height,parent.width))/4),200)) > mainWindow.height ? mainWindow.height-100 : Math.max(Math.round((Math.max(parent.height,parent.width))/4),200)
    x: parent.width/2-width/2
    y:parent.height/2-height/2
    Material.elevation: 8
    width :Math.min(parent.width / 1.25 , 400)
    height: Math.min(parent.height / 2 , layout.implicitHeight+50)
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
                //implicitWidth:Math.max(headlabel.contentWidth , divider.width ,abttext.contentWidth)
           // anchors.horizontalCenter: parent.horizontalCenter
            spacing:3
              Label {
                  id:headlabel
                  text:"ABOUT"
                  font.pointSize: mainWindow.fontsize1//flickarea.height/12
                  Layout.alignment: Qt.AlignCenter
                  font.bold: true
                  color: Material.color(Material.Orange)
              }
              HorizontalDivider {
                  id:divider
                 // width: 2*headlabel.contentWidth
                  Layout.preferredWidth:aboutpopup.width
                  Layout.fillWidth: true
                 // Layout.alignment: Qt.AlignCenter
              }

              Text {
                  id:abttext
    //              anchors.top: layout.bottom
    //              anchors.horizontalCenter: layout.horizontalCenter
    //              anchors.margins: 10
                  Layout.alignment: Qt.AlignCenter
                  Layout.margins: 5
                  Layout.preferredWidth:aboutpopup.width
                  Layout.fillWidth: true
                  //width:parent.width
                  //height: parent.height
                  color: themeColor ?  "#FFFFFF" : "#000000"
                  wrapMode: Text.WordWrap
                  text:qsTr("APP 1.O developed by companyX only for educational purpose.for more INFO contact info@companyX.com");
                  font.pointSize: mainWindow.fontsize1
                  //color: Material.color(Material.LightBlue)
              }

              ButtonFlat {
                  id: okButton
                  text: qsTr("Close")
                  Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                  textColor: "#FFFFFF"  //Material.color(Material.Blue)
                  onClicked: {
                      aboutpopup.close()
                  }
              }
            }

        ScrollIndicator.vertical: ScrollIndicator { }
    }
}

}


