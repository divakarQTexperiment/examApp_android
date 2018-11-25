import QtQuick 2.9
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.2
import QtQuick.Window 2.3
import QtQuick.Dialogs 1.3
import "../toolcomps"


Drawer {
    id: drawer

    width: mainWindow.width * 0.80
    height: mainWindow.height-hometoolbar.height
    dragMargin:0
    //y:0
    //dragMargin:10
    edge:Qt.LeftEdge
    interactive:false
    //position:1
   // property string qquery: null

    DrawerView {
        id : drawerview
        anchors.fill: parent
    }
}
