import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import QtGraphicalEffects 1.0
import "../toolcomps"


Popup {
    id: sliderpopup
    focus: true
    modal: true
    dim: true
//    width: Math.min(Math.round((Math.max(parent.height,parent.width))/1.5),300)
//    height:Math.min(Math.round((Math.max(parent.height,parent.width))/3),75)
    //width: (Math.max(Math.round((Math.max(parent.height,parent.width))/2),400)) > mainWindow.width ? mainWindow.width-100 : (Math.max(Math.round((Math.max(parent.height,parent.width))/2),400))
    //height: (Math.min(Math.round((Math.max(parent.height,parent.width))/4),75)) > mainWindow.height ? mainWindow.height-50 : (Math.min(Math.round((Math.max(parent.height,parent.width))/4),75))
  //  height: Math.min(Math.max(parent.height,parent.width)/5,75)
   // width : Math.min(Math.max(parent.height,parent.width)/2,parent.width-50)

    x: parent.width/2-width/2
    y:parent.height/2-height/2

    property alias fontsizevalue: slider.value
    property alias fromvalue : slider.from
    property alias tovalue : slider.to
    Material.elevation: 8
    width :Math.min(parent.width / 1.5 , 300)
    height: Math.min(parent.height / 2 , 70)
    Pane{
     anchors.fill: parent
        Slider{
            id:slider
            height: sliderpopup.height-10//Math.min(mainWindow.height/12,50)
            width:  sliderpopup.width-10 //Math.min(mainWindow.width/4,200)
            //Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
            anchors.centerIn: parent
            from: 0
            value:0 //panel.fontsize
            to: 20
            ToolTip.text : Math.round(value)
            ToolTip.delay : 10
            ToolTip.timeout: -1
            ToolTip.visible:false

            onValueChanged: {
                if(sliderpopup.opened)
                slider.ToolTip.visible=true
            }
        }
     }

    onOpened: {
        if(slider.ToolTip.visible === false)
        {
           slider.ToolTip.visible=true
        }
    }



}
