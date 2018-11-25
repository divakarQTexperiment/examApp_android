import QtQuick 2.2
import QtCharts 2.2
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0
import TimeTableModel.custom 1.0



Page {
    id:timetablepage
    header: TimeTableHeader {
        id:hdr
    }

//    property var tabbarmodel: [{name:"mon"},{name:"tue"},{name:"wed"},{name:"thu"},
//                              {name:"fri"},{name:"sat"},{name:"sun"}]

 /*   footer: TabBar {
        id:tbbar
        background: Rectangle{
            color: Material.color(Material.Indigo)
        }

        Material.accent: Material.color(Material.DeepOrange)
        Material.elevation: 10
        currentIndex: swpview.currentIndex
        Repeater{
            model: tabbarmodel
            TabButton{
                leftPadding: 6
                rightPadding: 6
               // implicitWidth:150
                // width: timetablepage.width < implicitWidth*7
                 width: Math.max(150, tbbar.width / 7)
                contentItem:
                    ColumnLayout{
                        Text{
                        text:qsTr(modelData.name)
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
                        font.pointSize: 12
                        font.bold: true
                        color: "#FFFFFF"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        elide: Text.ElideRight
                        font.capitalization: Font.AllUppercase
                        font.weight: Font.Medium
                    }
                }
               opacity: pressed|checked ? 0.5 : 1.0
            }
        }
    }*/


//QLSqlTimeTableModel{
//    id:ppp
//                    //dayTableName:homeTab.tableName
//                    Component.onCompleted: {
//                        console.log(ppp.teststr)
//                    }
//                    }

    ListModel{
        id:timetablemodel
        ListElement{
            fromTime:"9am"
            toTime:"10am"
            subj:"english"
            note:"revision hours"
        }
        ListElement{
            fromTime:"12pm"
            toTime:"1pm"
            subj:"english"
            note:"revision hours"
        }
        ListElement{
            fromTime:"1pm"
            toTime:"2pm"
            subj:"lunch"
            note:"lunch hours"
        }
    }

    SwipeView{
        id:swpview
        //anchors.fill: parent
        anchors.top:parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
      //  currentIndex: tbbar.currentIndex
        currentIndex: hdr.dayTabCurrentindex

        property var tabbarmodel: [{name:"MONDAY"},{name:"TUESDAY"},{name:"WEDNESDAY"},{name:"THURSDAY"},
                                  {name:"FRIDAY"},{name:"SATURDAY"},{name:"SUNDAY"}]
        Repeater{
            id:rptr
            model: swpview.tabbarmodel
            anchors.fill: parent
           delegate:  ListView {
                id: homeTab
           // anchors.fill: parent

                spacing: 5
                property string tableName: modelData.name
                model:proxyModel/*QLSqlTimeTableModel{
                    id:lll
                    dayTableName_m:homeTab.tableName

                    Component.onCompleted: {
                        lll.setsqlquery(dayTableName_m)
                    }

                    }*/
               // flickableDirection: Flickable.AutoFlickIfNeeded
                snapMode:ListView.SnapToItem

                //orientation :Qt.Horizontal
                displaced: Transition {
                      NumberAnimation { properties: "x,y"; duration: 1000 }
                  }
                moveDisplaced :Transition {
                    NumberAnimation { properties: "x,y"; duration: 1000 }
                }
                move:Transition {
                    NumberAnimation { properties: "x,y"; duration: 1000 }
                }
                add:Transition {
                    NumberAnimation { properties: "opacity";from: 0;to:0.3; duration: 1000 }
                }
                remove: Transition {
                    NumberAnimation { properties: "x,y"; duration: 1000 }
                }
     //timeTableModel  //timetablemodel
                delegate:
                    TimeTableDelegate{
                   opacity: 1
                  implicitWidth: timetablepage.width
                  implicitHeight: 120
                }

                FloatingButton {
                    id:plusfloatbutton
                    backgroundColor:Material.color(Material.Green)
                    shadowcolor:"black"
                    showShadow:true
                    imageSource: Qt.resolvedUrl("qrc:/images/add.png")
                    z: 1
                    anchors.margins: 20
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    scale: 1
                    ToolTip.text: "add activity"
                    ToolTip.visible: pressed
                    ToolTip.delay:500
                    ToolTip.timeout: 1000
                    onClicked: {
                        //model.append(homeTab.tableName)
                        //model.setsqlquery(homeTab.tableName)

                       model.sourceModel_m.append(homeTab.tableName);
                    }
                }
            }
        }
    }


}
