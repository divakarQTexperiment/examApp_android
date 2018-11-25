import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import QtGraphicalEffects 1.0

ListView {
id:listviewdrawer
// anchors.fill: parent
clip: true
highlightFollowsCurrentItem:true

    header: Rectangle {
        id: banner
        width: parent.width;
        height: lyt.height
        color: Material.color(Material.Pink)
        //border {color: Material.color(Material.Pink); width:2;}
        ColumnLayout {
            id:lyt
           // anchors.fill: banner
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top:parent.top
            spacing: 0
                RowLayout {
                    id:apprelated
                    Layout.alignment: Qt.AlignTop | Qt.AlignHCenter
                   // Layout.margins: 10
                    spacing: 3
                    Item {
                        id: appicon
                        implicitHeight: 24
                        implicitWidth: 24
                        Image {
                            anchors.centerIn: parent
                            source: "qrc:/images/black/drawer/exam24.png"
                        }
                    }
                    Label{
                        id:appname
                        text: "EXAM APP"
                        color: "#FFFFFF"
                        font.bold: true
                        font.pixelSize: 18
                    }
                }
            Item{
                id:usericon
                Layout.preferredHeight: 48
                Layout.preferredWidth: 48
                //radius: width/2
                Layout.alignment: Qt.AlignTop | Qt.AlignLeft
               // Layout.margins: 5
               // color: "#FFFFFF"
                Image {
                    anchors.centerIn: parent
                    source: Qt.resolvedUrl("qrc:/images/user48.png")
                }

            }
            Label{
                id:username
                text: "User1"
                Layout.alignment: Qt.AlignTop | Qt.AlignLeft
                Layout.margins: 5
                //anchors.top: usericon.bottom
                //anchors.margins: 10
                color: "#FFFFFF"
                font.bold: true
                font.pixelSize: 15
            }
        }
    }


    model: DrawerModel{ }
    delegate:  DrawerDelegate {
        onClicked: {
            //console.log(dbquery)
            stackView.stackqquery = dbquery;
            console.log("DrawerView : stackView.stackqquery  "+stackView.stackqquery)
            //console.log("DrawerView : delegateItem.width ", width)

        }
    }

//    ScrollBar.vertical:ScrollBar{
////        anchors.top: drawerview.top
////        anchors.right: drawerview.right
////        anchors.bottom: drawerview.bottom
//        //anchors.topMargin: 180
////        stepSize: 0.5
////        size:0.5
//        //width: implicitWidth/2
//        //width: 10
//    }

    ScrollIndicator.vertical: ScrollIndicator { }

}
