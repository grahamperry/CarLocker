import bb.cascades 1.0

Sheet {
    id: newDriver
    Page {
        titleBar: TitleBar {
            title: qsTr("Create New Driver");
        }

        Container {
            layout: DockLayout {}
            ScrollView {
                Container {
                    layout: StackLayout {}
                    
                    horizontalAlignment: HorizontalAlignment.Center
                    verticalAlignment: VerticalAlignment.Center
                    Container {
                        layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                        Label {
                            text: qsTr("Name")
                            preferredWidth: 200
                        }
                        TextField {
                            id: name
                        }
                    }
                	Container {
                        layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                        Label {
                            text: qsTr("Address")
                            preferredWidth: 200
                        }
                        TextField {
                            id: address
                        }
                    }
                    Container {
                        layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                        Label {
                            text: qsTr("")
                            preferredWidth: 200
                        }
                        TextField {
                            id: address2
                        }
                    }
                    Container {
                        layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                        Label {
                            text: qsTr("City")
                            preferredWidth: 200
                        }
                        TextField {
                            id: city
                        }
                    }
                    Container {
                        layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                        Label {
                            text: qsTr("State")
                            preferredWidth: 200
                        }
                        TextField {
                            id: state
                        }
                    }
                    Container {
                        layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                        Label {
                            text: qsTr("Postcode")
                            preferredWidth: 200
                        }
                        TextField {
                            id: postcode
                        }
                    }
                    Container {
                        layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                        Label {
                            text: qsTr("Country")
                            preferredWidth: 200
                        }
                        TextField {
                            id: country
                        }
                    }
                    Container {
                        layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                        Label {
                            text: qsTr("Tel")
                            preferredWidth: 200
                        }
                        TextField {
                            id: telephone
                            inputMode: TextFieldInputMode.PhoneNumber                        
                        }
                    }
                    Container {
                        layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                        Label {
                            text: qsTr("Email")
                            preferredWidth: 200
                        }
                        TextField {
                            id: email
                            inputMode: TextFieldInputMode.EmailAddress
                        }
                    }            

                }
            }
        }
                     
        actions: [
            ActionItem {
                title: "Create"
                onTriggered: {
                    newDriver.saveDriverInfo();
                    newDriver.clearDriverInfo();
                    newDriver.close();
                }
                ActionBar.placement: ActionBarPlacement.OnBar
            },
            ActionItem {
                title: "Quit"
                onTriggered: {
                    newDriver.clearDriverInfo();
                    newDriver.close();
                }
                ActionBar.placement: ActionBarPlacement.OnBar
            },
            ActionItem {
                title: "Clear"
                onTriggered: {
                    newDriver.clearDriverInfo();                    
                }
                ActionBar.placement: ActionBarPlacement.OnBar                
            }
        ]
    }  
    
    // 
    onOpened: {
        if (driver.driverEdit()) {
            name.text      = driver.getDriverName 
            address.text   = driver.getDriverAddress
            address2.text  = driver.getDriverAddress2
            city.text      = driver.getDriverCity
            state.text     = driver.getDriverState
            postcode.text  = driver.getDriverPostcode
            country.text   = driver.getDriverCountry
            telephone.text = driver.getDriverTelephone
            email.text     = driver.getDriverEmail
        }
    }

    function saveDriverInfo () {
        driver.saveDriverInfo(name.text, 
                      address.text, address2.text, 
                      city.text, state.text, country.text, postcode.text, 
                      telephone.text, email.text)
        driver.setEditMode(false);
    }
    
    function clearDriverInfo () {
        name.text      = ""
        address.text   = ""
        address2.text  = ""
        city.text      = ""   
        state.text     = ""
        postcode.text  = "" 
        country.text   = ""
        telephone.text = ""
        email.text     = "" 
    }
    
} // End Sheet

