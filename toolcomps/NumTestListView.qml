import QtQuick 2.9
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.2
import "../toolcomps"

Page{
    header: HeaderResult{
                   height:80
                   toolbarcolor: Material.color(Material.Teal)
                   labeltext:"TEST LISTS"
                   source1:qsTr("qrc:/images/white/home/back24.png")
               }
ListView {
    anchors.fill: parent
    property string pagetoload:qsTr("qrc:/toolcomps/ex1.qml")
    //anchors.fill: parent
    anchors.margins: 20
    property int numtestmodel: 5
    model: 5
    delegate:NumtestDelegate{
        id :delll

    }

//    highlight: Rectangle{
//        width: parent.width
//        color: "lightgrey"
//    }

}

}
