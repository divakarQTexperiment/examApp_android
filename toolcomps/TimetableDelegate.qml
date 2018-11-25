import QtQuick 2.2
import QtCharts 2.2
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import QtQuick.Layouts 1.3


RowLayout{
    id:modltimetable
    spacing: 5
    Label{
       text: row0
       Layout.preferredWidth: 50
       Layout.preferredHeight: 50
       font.pointSize: 13
       font.bold: true
       color: Material.color(Material.DeepOrange)
       font.capitalization: Font.AllUppercase
       Layout.alignment: Qt.AlignBottom
       horizontalAlignment:TextInput.AlignLeft
       verticalAlignment: TextInput.AlignVCenter

    }

    Repeater{
        id:textfld
        model: 7
        property color textcolor: Material.color(Material.DeepOrange)
        property bool fontbold: false
        property int caps: Font.MixedCase
        Rectangle{
            id:textframe
            Layout.preferredHeight:30
            Layout.preferredWidth:100
            border.width: 1
            //color: Material.color(Material.Teal)
            //opacity: 0.5
            border.color: Material.color(Material.Grey)
            clip:true
            Flickable{
                id:flick
                anchors.fill: parent
                clip:true
                contentHeight: txt.contentHeight
                contentWidth: txt.contentWidth
                ScrollIndicator.vertical: ScrollIndicator { }
                function ensureVisible(r)
                {
                    if (contentX >= r.x)
                        contentX = r.x;
                    else if (contentX+width <= r.x+r.width)
                        contentX = r.x+r.width-width;
                    if (contentY >= r.y)
                        contentY = r.y;
                    else if (contentY+height <= r.y+r.height)
                        contentY = r.y+r.height-height;
                }

        TextInput{
           id:txt
           text:retTextfield()
           onCursorRectangleChanged: flick.ensureVisible(cursorRectangle)
           width: flick.width;
           horizontalAlignment:TextInput.AlignHCenter
           verticalAlignment: TextInput.AlignBottom
           font.pointSize: 12
           selectByMouse:true
           color: textfld.textcolor
           font.bold: textfld.fontbold
           font.capitalization: Font.MixedCase
           focus: true
           wrapMode: TextEdit.Wrap
           function retTextfield()
           {
               if(index === 0) return row1;
               else if(index === 1) return row2;
               else if(index === 2) return row3;
               else if(index === 3) return row4;
               else if(index === 4) return row5;
               else if(index === 5) return row6;
               else if(index === 6) return row7;
           }
        }
            }
        }
    }

    Component.onCompleted: {
        textfld.textcolor = (index === 0) ? Material.color(Material.DeepOrange):Material.color(Material.DeepPurple)
        textfld.fontbold = (index === 0) ? true : false
        textfld.caps = (index === 0) ? Font.AllUppercase : Font.MixedCase
    }

}
