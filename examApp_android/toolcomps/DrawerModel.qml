import QtQuick 2.0
import QtQml.Models 2.3

ListModel {
        id: drawermodel
        ListElement { name  : "Home"
                     source : "qrc:/images/home.png"
                     pagetoload : "qrc:/toolcomps/Home.qml"
                     dbquery : "qrc:/toolcomps/Home.qml"
        }
        ListElement { name : "Quantitative"
                    source : "qrc:/images/exam.png"
                    pagetoload :"qrc:/toolcomps/NumTestListView.qml"  // "qrc:/toolcomps/ex1.qml"
                    dbquery : "1"  //used as a query to access db
                  //  respquery :"response1"
        }
        ListElement { name : "Logical Reasoning"
                    source : "qrc:/images/exam.png"
                    pagetoload : "qrc:/toolcomps/NumTestListView.qml"
                    dbquery : "2"  //used as a query to access db
                   // respquery :"response2"

        }
        ListElement { name : "General knowledge"
                    source : "qrc:/images/exam.png"
                    pagetoload : "qrc:/toolcomps/NumTestListView.qml"
                    dbquery : "3"  //used as a query to access db
                  //  respquery :"response3"

        }
        ListElement { name : "English"
                    source : "qrc:/images/exam.png"
                    pagetoload : "qrc:/toolcomps/NumTestListView.qml"
                    dbquery : "4"  //used as a query to access db
                   // respquery :"response4"

        }
//        ListElement { name : "Results"
//                      source : "qrc:/images/results.png"
//                      pagetoload : "qrc:/toolcomps/Results.qml"
//                      dbquery : "result"  //used as a query to access db
//        }
        ListElement { name : "Instructions";
                     source : "qrc:/images/instructions.png"
                     pagetoload : "qrc:/toolcomps/Instructions.qml"
                     dbquery : "Instructions" //invalid testNo
        }
        ListElement { name : "User"
                     source : "qrc:/images/userinfo.png"
                     pagetoload : "qrc:/toolcomps/Settings.qml"
                     dbquery : "Settings"
        }
        ListElement { name : "TimeTable"
                    source : "qrc:/images/timetable.png"
                    pagetoload : "qrc:/toolcomps/TimeTableTab.qml"
                    dbquery : "TimeTable"

        }
        ListElement { name : "Feedback"
                    source : "qrc:/images/feedback.png"
                    pagetoload : "qrc:/toolcomps/Feedback.qml"
                    dbquery : "Feedback"

        }

    }
