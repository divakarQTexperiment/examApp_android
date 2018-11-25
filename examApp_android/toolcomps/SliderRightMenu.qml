import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import QtGraphicalEffects 1.0
import "../toolcomps"


Popup {
    id: sliderpopup
    height:mainWindow.height/12
    width:mainWindow.width/4
    focus: true
    modal: true
    dim: true
//    leftMargin: (mainWindow.width/2)-(implicitWidth/2)
//    rightMargin: (mainWindow.width/2)-(implicitWidth/2)
//    topMargin: (mainWindow.height/2)-(implicitHeight/2)
//    bottomMargin: (mainWindow.height/2)-(implicitHeight/2)

    x:(mainWindow.width/2)-(width/2)
    y:(mainWindow.height/2)-(height/2)

    property real fontsizevalue: 0
   // implicitHeight: slider.implicitHeight
   // implicitWidth:slider.implicitWidth
    Material.elevation: 8

    Slider{
        id:slider
        anchors.fill: parent
        from: 0
        value:0 //panel.fontsize
        to: 20
        onValueChanged: {
           fontsizevalue = value;
            if(value >= 1)
            homepage.hometextFontsize = Math.round(sliderpopup.fontsizevalue) ;

        }

    }
}
