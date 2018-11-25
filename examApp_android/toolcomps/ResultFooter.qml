import QtQuick 2.2
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import QtQuick.Layouts 1.3


TabBar {
        background: Rectangle{
            color: Material.color(Material.Shade200)
        }

        Material.accent: Material.color(Material.DeepOrange)


        TabButton {
            leftPadding: 6
            rightPadding: 6
            contentItem: Text{
                text:qsTr("PAGE 1")
                font.pointSize: 15
                font.bold: true
                //opacity: enabled ? 1.0 : 0.3
                color: "#FFFFFF"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
                font.capitalization: Font.AllUppercase
                font.weight: Font.Medium
            }
            opacity: pressed|checked ? 0.5 : 1.0
        }
        TabButton {
            leftPadding: 6
            rightPadding: 6
            contentItem: Text{
                text:qsTr("PAGE 2")
                font.pointSize: 15
                font.bold: true
                //opacity: enabled ? 1.0 : 0.3
                color: "#FFFFFF"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
                font.capitalization: Font.AllUppercase
                font.weight: Font.Medium
            }
            opacity: pressed|checked ? 0.5 : 1.0
        }
        TabButton {
            leftPadding: 6
            rightPadding: 6
            contentItem: Text{
                text:qsTr("PAGE 3")
                font.pointSize: 15
                font.bold: true
                //opacity: enabled ? 1.0 : 0.3
                color: "#FFFFFF"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
                font.capitalization: Font.AllUppercase
                font.weight: Font.Medium
            }
            opacity: pressed|checked ? 0.5 : 1.0
        }
    }
