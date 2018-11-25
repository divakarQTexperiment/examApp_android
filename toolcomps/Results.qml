import QtQuick 2.2
import QtCharts 2.2
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import QtQuick.Layouts 1.3

Page {
    id : resultspage
    //anchors.fill: parent
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
   // property var temp: [{1,0,0},{1,0,0}]

    header: HeaderResult {
        //height:80
        toolbarcolor: Material.color(Material.Teal)
        labeltext:"SCORE CARD"
       // source1:qsTr("qrc:/images/white/home/back24.png")
    }

//    Flickable{
//    anchors.fill: parent
//    contentHeight: swp.height
//    clip: true

//    PageIndicator {
//        id: indicator
//        count: swp.count
//        currentIndex: swp.currentIndex
//        anchors.bottom: parent.bottom
//        anchors.horizontalCenter: parent.horizontalCenter
//    }

    footer: ResultFooter{
        id: tabBar
        currentIndex: swp.currentIndex

    }

    SwipeView {
        id:swp
        anchors.fill: parent
         currentIndex: tabBar.currentIndex

    Loader  {
        active: SwipeView.isCurrentItem
      sourceComponent:ResultSummary{

      }
    }

        Loader{
            active: SwipeView.isCurrentItem
    sourceComponent :ResPieChart{

    }
  }
        Loader{
            active: SwipeView.isCurrentItem
    sourceComponent : QuestLegend {

                 }
  }

}


    Component.onCompleted: {
    //pieSeries.find("Total Correct Answers").exploded = true;
        console.log("result page created")
    //console.log("Results : category,notattendedquestion,failanswer,passanswer "+category,notattendedquestion,failquestion,passquestion)
    }

}





