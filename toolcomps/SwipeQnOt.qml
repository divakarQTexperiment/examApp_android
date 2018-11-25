import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
//import QtQuick.Controls 1.4
import QtQuick.Controls.Material 2.2
import QtGraphicalEffects 1.0
import "../toolcomps"
import "../jsfiles/handle.js" as Jsexec

SwipeView {
    id : swipeview
    //anchors.fill: parent
    property string radioButtonClicked: "n"
    property string temp: ""
    property int fontsize: 15
    onCurrentIndexChanged: {
        pagetoolbar.tabcurrentindex = currentIndex;
    }

    ListView{
    id :descriptionview
    model:queryModel
    delegate: Item {
        id:delofdescriptionview
        ColumnLayout {
            anchors.fill: parent
        Image {
            id: img
//                    anchors.top: parent.top
//                    height: 50
//                    width: 50
            property string src : "qrc:/images/test_img/image1.jpeg" //imagepath
            Layout.alignment: Qt.AlignTop
            Layout.margins: 10
            fillMode: Image.PreserveAspectFit
            clip : true
            asynchronous : true
            cache: false
            source:((src == "NULL") || (src == null) || (src == "")) ? "" :src;  //"qrc:/images/test_img/image1.jpeg" //(imagepath=="NULL" ? NULL:imagepath)
            //visible: (source === null) ? false : true
            onStatusChanged: {
                /*if (img.status == Image.Ready)
                console.log('SwipeQnOt : Loaded')
                else*/ if(img.status == Image.Null) {
                 console.log('SwipeQnOt : image Null--setting null to source')
                 img.source = ""
                 }
                else if(img.status == Image.Error) {
                 console.log('SwipeQnOt : image Error--setting null to source')
                 img.source = ""
                }
           }
        }
        Text {
          //  anchors.top : img.bottom
            Layout.margins: 10
            font.pointSize: fontsize
            text: model.description
        }
      }
    }
  }

    ListView {
    id:questionview
    model:queryModel
    delegate: Item {
        id:delofquestionview
        Text {
            property int columNo: 2
            anchors.margins: 10
            font.pointSize: fontsize
            text: model.question
        }
      }
    }

    ListView{
    id:optionview
   // anchors.fill: parent
    FloatingButton {
        id:plusfloatbutton
        backgroundColor:Material.color(Material.Orange)
//      shadowcolor:"black"
        imageSource: Qt.resolvedUrl("qrc:/images/white/add24.png")
        z: 1
        anchors.margins: 20
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        scale: 1
        ToolTip.text: "floating button"
        ToolTip.visible: pressed
        ToolTip.delay:1000
        ToolTip.timeout: 1000
        onClicked: {
            popup.open()
           if(imageSource == Qt.resolvedUrl("qrc:/images/white/add24.png"))
            imageSource= Qt.resolvedUrl("qrc:/images/white/multiply24.png")
     }
    }
    PopupFloatbtn {
        id:popup
        parent: page1
        x:plusfloatbutton.x-(width)-5//+(plusfloatbutton.implicitWidth)-(width)-plusfloatbutton.anchors.leftMargin
        y:mainWindow.height -20-plusfloatbutton.height   //plusfloatbutton.y+plusfloatbutton.implicitHeight+140//-plusfloatbutton.implicitHeight-(implicitHeight)
          //plusfloatbutton.y+plusfloatbutton.height+20-100//-implicitHeight-20
        onClosed: {
            plusfloatbutton.imageSource="qrc:/images/white/add24.png"
           // console.log("SwipeQnOt : "+plusfloatbutton.y,plusfloatbutton.x,y,x,plusfloatbutton.height,plusfloatbutton.implicitHeight)
        }
    }


    model:queryModel
    delegate:  Item {
        id :delofoptionview
        //anchors.fill: parent
        property int numofoption: 5
        property var optionlist: ['a. ','b. ','c. ','d. ','e. ']

        GridLayout {
            rows:5
            columns: 0
            //rowSpacing: 5
            flow: GridLayout.TopToBottom
             // ExclusiveGroup { id: tabPositionGroup }
            //spacing: 10
            Repeater {
            id :rp
            model: numofoption
            RadioButton {
                id : rd
                function setoptionmenu (index)
                {
                    if(index === 1) return option1;
                    if(index === 2) return option2;
                    if(index === 3) return option3;
                    if(index === 4) return option4;
                    if(index === 5) return option5;
                }
                height: 10
                width: 10
                font.pointSize: fontsize
                text: optionlist[index]+setoptionmenu(index+1)   //(index == 0) ? option1 : ((index == 1) ? option2 :((index == 2) ? option3 :((index == 3) ? option4 :option5)))
                visible: ((setoptionmenu(index+1)  === "NULL") || (setoptionmenu(index+1) === "")) ? false : true
                checkable: true
                checked: (whichradiobuttonchecked() === index) ? true:false

                function whichradiobuttonchecked() {
                   // console.log("response----> "+response+"------"+(response))
                    if((response == "n")    || (response=="rn")) {radioButtonClicked = "n";return -1;}
                    else if((response=="a") || (response=="ra")) {radioButtonClicked = "a";return 0;}
                    else if((response=="b") || (response=="rb")) {radioButtonClicked = "b";return 1;}
                    else if((response=="c") || (response=="rc")) {radioButtonClicked = "c";return 2;}
                    else if((response=="d") || (response=="rd")) {radioButtonClicked = "d";return 3;}
                    else if((response=="e") || (response=="re")) {radioButtonClicked = "e";return 4;}
                    else return -1;
                }

                onClicked: {
                   //console.log("SwipeQnOt :  radio button clicked "+text+index);
                    whichRbChecked(index);
                   // console.log("SwipeQnOt : radioButtonClicked ----->",radioButtonClicked)

                }
                function whichRbChecked(indexclicked) {
                    if(indexclicked === 0)
                        radioButtonClicked = "a"
                   else if(indexclicked === 1)
                        radioButtonClicked = "b"
                   else if(indexclicked === 2)
                        radioButtonClicked = "c"
                   else if(indexclicked === 3)
                        radioButtonClicked = "d"
                   else if(indexclicked === 4)
                        radioButtonClicked = "e"
                   else if(indexclicked === -1)
                        radioButtonClicked = "n"
                }
            }
         }
      }

    }
 }

}
