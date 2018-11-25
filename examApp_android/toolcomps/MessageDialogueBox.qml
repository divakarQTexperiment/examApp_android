import QtQuick 2.0
import QtQuick.Dialogs 1.3

MessageDialog {
    id: messageDialog
    title: "enter the test"
    text: "do you want to enter?"
    visible: false
//    x : ((parent.width/2)-(width/2))
//    y : ((parent.height/2)-(height/2))
    //icon: StandardIcon.Question
    standardButtons: StandardButton.Yes | StandardButton.No
       onYes:
       {
           //stackView.push(pagetoload)
           //drawerhome.close()
           console.log("MessageDialogueBox : pressed yes")
           //console.log("loaded a page ",pagetoload)
       }
       onNo:{
           console.log("MessageDialogueBox : pressed no")
          // drawerhome.close()
         //  console.log("not loaded any page")
       }
}
