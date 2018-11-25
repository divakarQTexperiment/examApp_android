
import QtQuick 2.2
import QtCharts 2.2
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import QtQuick.Layouts 1.3


ChartView  {
            id:chart2
    property int correct_answer: 10
    property int wrong_answer: 25
    property int not_attended: 25
    property int totalnumanswer: 100
    property int titlefontsize: 15
    property int legendfontsize: 12
    property int pieslicelabelfontsize: 10
    property var passquestion: [0,0,1,1,0.5,1,1,1]
    property var failquestion: [1,1,1,1,1,0.3,0.6]
    property var notattendedquestion: [0.5,0.5,1,1,1,0.3]
    property var category:[1,2,3,4,5,6,7,8,9]

            title: "ANSWER LEGEND"
            //anchors.top:chart1.bottom
           // height: 0.25*mainWindow.height
           // width: mainWindow.width
            Layout.alignment: Qt.AlignTop
            legend.alignment: Qt.AlignTop
            titleColor:Material.color(Material.Orange)
            titleFont.bold: true
            titleFont.pointSize: titlefontsize
            legend.font.bold:true
            legend.font.pointSize:legendfontsize
            legend.color : Material.color(Material.Blue)
            antialiasing: true
            theme: ChartView.ChartThemeQt


            HorizontalBarSeries  {
                id: mySeries
                axisXTop :  BarCategoryAxis { categories: [1]}
                axisY : BarCategoryAxis { categories: category}
                barWidth:0.75
               // labelsVisible: true

                BarSet {
                    label: "ANSWER IS RIGHT";
                    values: passquestion ;
                    color:Material.color(Material.Green);
                    borderColor:Material.color(Material.Yellow);
                }
                BarSet {
                    label: "ANSWER IS WRONG";
                    values: failquestion;
                    color:Material.color(Material.red);
                    borderColor:Material.color(Material.Yellow);
                }
                BarSet {
                    label: "QUESTION NOT ATTENDED";
                    values: notattendedquestion;
                    color:Material.color(Material.Grey);
                    borderColor:Material.color(Material.Yellow);
                }
            }
        }





