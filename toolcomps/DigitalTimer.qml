import QtQuick 2.9
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.2
import QtQuick.Window 2.3
import QtQuick.Dialogs 1.3


Rectangle {
    id: clock
    visible: true
    property int minute: 4-1
    property int second: 60
    property real pointSize: 10
    property color textcolor: Material.color(Material.Yellow)
    property real countmin:0
    height: 50
    width: 50
    color:Material.color(Material.LightBlue)
    radius: 40
    signal stopTimerInterrup()
    signal startTimerInterrup()

    MouseArea{
        anchors.fill: parent
        ToolTip.text: "clock"
        ToolTip.visible: pressed
        ToolTip.delay:500
        ToolTip.timeout: 5000
    }

    //border.width: 2
    //border.color: Material.color(Material.Green)

    //anchors.right:parent.right

//    Image {
//        id: imgclock
//        anchors.fill: parent
//        source: "qrc:/images/white/circle3d.png"
//    }

//    BorderImage {
//        id: borderimg
//        source: "qrc:/images/white/circle_border.png"
//        width: parent.width; height: parent.height
//        border.left: -5; border.top: -5
//        border.right: -5; border.bottom: -5
//    }



//    Frame{
//        id:clockframe

//        background: Rectangle{
//            //color: Material.color(Material.Teal)
//            border.width: 1
//            border.color: Material.color(Material.Grey)

//        }

    ColumnLayout{
        spacing: 1
        anchors.centerIn: parent
        //anchors.centerIn: parent

           Image{
                 id: icon
                 Layout.alignment:Qt.AlignTop | Qt.AlignHCenter
                 source: "qrc:/images/black/alarm16"
             }
            Label{
                id:labltime
                height: 10
                width: 10
                clip: true
                font.pointSize: pointSize
                font.bold: true
                Layout.alignment:Qt.AlignHCenter | Qt.AlignVCenter
                //Layout.alignment: Qt.AlignHCenter
//                anchors.horizontalCenter: parent.horizontalCenter
//                anchors.bottom: parent.verticalCenter
                color: textcolor
                text: "Min : Sec"
            }

            Label{
                id:dispminsec
                font.pointSize: pointSize
                font.bold: true
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                //anchors.horizontalCenter: parent.horizontalCenter
                //anchors.bottom: parent.verticalCenter
                color: textcolor
                text: (minute>=10 ? minute:"0"+minute)+" : "+
                      (second>=10 ? second:"0"+second)
            }

//            RowLayout{
//            anchors.top: parent.verticalCenter
//            anchors.horizontalCenter: parent.horizontalCenter
                //spacing:5
//                Text {
//                    id:dispminute
//                    font.pointSize: pointSize
//                    font.bold: true
//                    color: textcolor
//                    text: minute>=10 ? minute:"0"+minute
//                }

//                Text{
//                    id:labeldot
//                    font.pointSize: pointSize
//                    font.bold: true
//                    color: textcolor
//                    text: ":"
//                }

//                Text{
//                    id:dispsecond
//                    font.pointSize: pointSize
//                    font.bold: true
//                    color: textcolor
//                    text: second>=10 ? second:"0"+second
//                }

          //  }
        }


//    Timer {
//        id:timerminute
//        interval: 60*1000
//        running: true
//        repeat: true
//        onTriggered:updateminute()
//    }

    onStopTimerInterrup: {
        timersecond.stop()
    }

    onStartTimerInterrup: {
        timersecond.start()
    }

    Timer{
        id:timersecond
        interval: 1000
        running: true
        repeat: true
        onTriggered:updatesecond()
    }

    function updatesecond()
    {
        countmin++
        if(second==0)
        second=second+59
        else
        second=second-1

        if(countmin==60)
        {
           countmin=0;
           if((minute-1)>0) {
               minute=minute-1
           }
           else {
                console.log("DigitalTimer : exausted time limit popup message")
                timersecond.stop()
               minute=0;
               second=0;
           }

        }

        dispminsec.text = (minute>=10 ? minute:"0"+minute)+" : "+
                          (second>=10 ? second:"0"+second)

       // console.log(count=count+1)
    }

//    function updateminute()
//    {
//        if(minute>0)
//        minute=minute-1
//        else;
//        dispminute.text = minute>=10 ? minute:"0"+minute
//    }
}
