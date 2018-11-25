import QtQuick 2.2
import QtCharts 2.2
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import QtQuick.Layouts 1.3

Page {
    id : resultspage
    header: HeaderResult {
        height:80
        toolbarcolor: Material.color(Material.Teal)
        labeltext:"ABOUT"
        source1:qsTr("qrc:/images/white/home/back24.png")
    }

    Text{
        anchors.centerIn: parent
        text:"ABOUT"
    }

}
