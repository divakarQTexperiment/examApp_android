import QtQuick 2.2
import QtCharts 2.2
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import QtQuick.Layouts 1.3

ChartView {
        id: chart1
        anchors.fill: parent
        property int correct_answer: 10
        property int wrong_answer: 25
        property int not_attended: 25
        property int titlefontsize: 15
        property int legendfontsize: 15
        property int pieslicelabelfontsize: 12

        property var repmodel: [{color:Material.color(Material.Green),text:"Correct Answer"},
                                {color:Material.color(Material.red),text:"Wrong Answer"},
                                {color:Material.color(Material.Grey),text:"Not Attended"}]

        title: "RESULT SHEET OF TEST"
        titleColor:Material.color(Material.Orange)
        titleFont.bold: true
        titleFont.pointSize: titlefontsize
        legend.alignment: Qt.AlignTop
        //legend.markerShape:Legend.MarkerShapeCircle
        legend.showToolTips:true
        legend.backgroundVisible:false
        legend.font.bold:true
        legend.font.pointSize:legendfontsize
        legend.color : Material.color(Material.Blue)
        antialiasing: true
        legend.visible:true
        theme:  ChartView.ChartThemeBlueCerulean

        PieSeries {
            id: pieSeries
            startAngle:0
            endAngle:360
           // holeSize:0.5
            //size:0.75
            PieSlice {
                label: value;
                value: correct_answer;
                color: Material.color(Material.Green);
                labelVisible:true;
                //borderColor:Material.color(Material.Yellow);
               // borderWidth:2;
//              labelArmLengthFactor:0.3;
                labelColor:"#FFFFFF"  //Material.color(Material.Cyan)
                labelFont.bold: true
                labelFont.pointSize: pieslicelabelfontsize
                labelPosition: PieSlice.LabelInsideHorizontal
            }
            PieSlice { label: value;
                value: wrong_answer;
                color: Material.color(Material.Red);
                labelVisible:true
                //borderColor:Material.color(Material.Yellow);
               // borderWidth:2;
//              labelArmLengthFactor:0.3;
                labelColor:"#FFFFFF" //Material.color(Material.Cyan)
                labelFont.bold: true
                labelFont.pointSize: pieslicelabelfontsize
                labelPosition:PieSlice.LabelInsideHorizontal //PieSlice.LabelOutside

            }
            PieSlice {
                label: value;
                value: not_attended;
                color: Material.color(Material.Grey);
                labelVisible:true
               // borderColor:Material.color(Material.Yellow);
               // borderWidth:2;
//              labelArmLengthFactor:0.3;
                labelColor:"#FFFFFF"//Material.color(Material.Cyan)
                labelFont.bold: true
                labelArmLengthFactor: 10
                labelFont.pointSize: pieslicelabelfontsize
                labelPosition: PieSlice.LabelInsideHorizontal
            }
        }

        ColumnLayout {
            spacing: 5
            //Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
            //Layout.margins: 5
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
//            implicitHeight: 50
//            implicitWidth: 100
            anchors.margins: 50
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
                        color: "#FFFFFF"
                        Layout.alignment: Qt.AlignHCenter
                    }
                }
            }
        }


        Component.onCompleted: /*{
            console.log("created pag2")*/

            PropertyAnimation { target: pieSeries; property: "endAngle";from:0; to: 360 ;duration: 1000 }
       // }
        Component.onDestruction: {
            console.log("destroyed page2")
        }
    }
