// About page
import bb.cascades 1.0

Sheet {
    id: sheetSettings
    peekEnabled: true

    content: NavigationPane {
        Page {
            titleBar: TitleBar {
                dismissAction: ActionItem {
                    title: qsTr("Back") + Retranslate.onLanguageChanged
                    onTriggered: {
                        sheetSettings.close();
                    }
                }
                title: qsTr("About Car Locker") + Retranslate.onLanguageChanged
            }
            Container {
                topPadding: 20
                leftPadding: 20
                rightPadding: 20
                bottomPadding: 20
                layout: DockLayout {
                }
                Container {
                    Container {
                        id: aboutDetails
                        visible: true
                        verticalAlignment: VerticalAlignment.Top
                        Label {
                            text: qsTr("Version 0.1")
                        }
                        Label {
                            text: qsTr("Published: 23/5/13") 
                        }
                        Label {
                            text: qsTr("Author: Graham Perry")
                        }
                    }
                    Container {
                        id: supportWebview 
                        visible: false
                        ScrollView {
                            WebView {
                                id: support
                                url: "http://www.rangers.co.uk"
                            }
                        }
                        Button {
                            id: supportBack
                            text: qsTr("Close")
                            verticalAlignment: VerticalAlignment.Bottom
                            horizontalAlignment: HorizontalAlignment.Center
                            onClicked: {
                                console.log("Close Support Information");
                                supportWebview.visible = ! supportWebview.visible
                                supportButton.visible = true
                                aboutDetails.visible = true
                            }
                        }
                    }
                }
                Button {
                    id: supportButton
                    text: qsTr("Support")
                    verticalAlignment: VerticalAlignment.Bottom
                    horizontalAlignment: HorizontalAlignment.Center
                    visible: true
                    onClicked: {
                        console.log("Open Support Information");
                        supportWebview.visible = true
                        supportButton.visible = false
                        aboutDetails.visible = false
                    }
                }
            }
        }
    }
}
