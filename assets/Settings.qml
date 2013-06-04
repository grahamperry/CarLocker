import bb.cascades 1.0

Sheet {
    id: sheetSettings
    peekEnabled: false
    
     onOpenedChanged: {
        if (opened) {
            navPane.push(settings);
        }
    }

    NavigationPane {
            id: navPane
            peekEnabled: false
            Page {
                id: dummyPage
                Container {
                    background: Color.Black
                }
            }
        
        attachedObjects: [
            Page {
                id: settings
                titleBar: TitleBar {
                    title: qsTr("App Settings") + Retranslate.onLanguageChanged
                }
                Container {
                    Container {
                        id: email
                        Button {
                            text: "Email"
                            preferredWidth: Infinity
                            horizontalAlignment: HorizontalAlignment.Fill
                            onClicked: {
                                emailAddress.visible = !emailAddress.visible;
                            }
                        }
                        Container {
                            id: emailAddress
                            visible: false
                            TextField {
                                id: emailField
                                inputMode: TextFieldInputMode.EmailAddress                                
                                text: settingsDatasource.emailAccount
                                input {
                                    onSubmitted: {
                                        console.log ("Email Address");
                                        settingsDatasource.emailAccount = text;
                                    }
                                }
                            }
                        
                        }
                    }
                    Container {
                        id: emergency
                        Button {
                            text: "Emergency Contact"
                            preferredWidth: Infinity
                            horizontalAlignment: HorizontalAlignment.Fill
                            onClicked: {
                                emergencyContact.visible = !emergencyContact.visible;
                            }
                        }
                        Container {
                            id: emergencyContact
                            visible: false
                            TextField {
                                id: emergencyField
                                inputMode: TextFieldInputMode.PhoneNumber
                                text: settingsDatasource.emergencyContact
                                input {
                                    onSubmitted: {
                                        console.log("Emergency Contact");
                                        settingsDatasource.emergencyContact = text;
                                    }
                                }
                            }

                        }
                    }
                }
            
                paneProperties: NavigationPaneProperties {
                    backButton: ActionItem {
                        title: qsTr("Back")
                        onTriggered: {
                            settings.actionBarVisibility = ChromeVisibility.Hidden
                            sheetSettings.close();
                        }
                    }
                }
            }
        ]
        onPopTransitionEnded: {
            page.destroy();
        }
    } // End of NavPane

}

