import QtQuick 2.9
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.2

TabBar {
        id:tbbar
        background: Rectangle{
            color: Material.color(Material.Indigo)
        }

        Material.accent: Material.color(Material.DeepOrange)
        Material.elevation: 10


        TabButton {
            leftPadding: 6
            rightPadding: 6

            contentItem:
                ColumnLayout{
                    Image {
                        source: "qrc:/images/homehome.png"
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
                    }
                    Text{
                    text:qsTr("HOME")
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
                    font.pointSize: 12
                    font.bold: true
                    //opacity: checked ? 1.0 : 0.3
                    color: "#FFFFFF"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight
                    font.capitalization: Font.AllUppercase
                    font.weight: Font.Medium
                }
            }

           opacity: pressed|checked ? 0.5 : 1.0

        }
        TabButton {
            leftPadding: 6
            rightPadding: 6
            contentItem:
                ColumnLayout{
                    Image {
                        source: "qrc:/images/book.png"
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
                    }
                    Text{
                    text:qsTr("C")
                    font.pointSize: 12
                   // opacity: enabled ? 1.0 : 0.3
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
                    color: "#FFFFFF"
                    font.bold: true
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight
                    font.capitalization: Font.AllUppercase
                    font.weight: Font.Medium
                }
            }
            opacity: pressed|checked ? 0.5 : 1.0
        }
        TabButton {
            leftPadding: 6
            rightPadding: 6
            contentItem:
                ColumnLayout{
                    Image {
                        source: "qrc:/images/book.png"
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
                    }
                    Text{
                    text:qsTr("C++")
                    font.pointSize: 12
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
                   // opacity: enabled ? 1.0 : 0.3
                    color: "#FFFFFF"
                    font.bold: true
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight
                    font.capitalization: Font.AllUppercase
                    font.weight: Font.Medium
                }
            }
            opacity: pressed|checked ? 0.5 : 1.0
        }

        TabButton {
            leftPadding: 6
            rightPadding: 6
            contentItem:
                ColumnLayout{
                    Image {
                        source: "qrc:/images/book.png"
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
                    }
                    Text{
                    text:qsTr("JAVA")
                    font.pointSize: 12
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
                   // opacity: enabled ? 1.0 : 0.3
                    color: "#FFFFFF"
                    font.bold: true
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight
                    font.capitalization: Font.AllUppercase
                    font.weight: Font.Medium
                }
            }
            opacity: pressed|checked ? 0.5 : 1.0
        }
    }
