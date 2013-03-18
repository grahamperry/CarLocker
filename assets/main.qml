import bb.cascades 1.0

TabbedPane {
    showTabsOnActionBar: true
    Tab {
        title: qsTr("Driver")
        Page {
            id: driverTab
            titleBar: TitleBar {
                title: qsTr("Driver Information");
            }
            actions: [
                // define the actions for first tab here
                ActionItem {
                    title: qsTr("Create")
                    onTriggered: {
                        createDriver.open();
                    }
                },
                ActionItem {
                    title: qsTr("Edit")
                    onTriggered: {
                        console.log("poulateAndOpen");
                        createDriver.populateAndOpen();
                    }
                },
                ActionItem {
                    title: qsTr("Save");
                    onTriggered: {
                        saveDriverInfoToFile();
                    }
                    
                },
                ActionItem {
                    title: qsTr("Share");
                    onTriggered: {
                        console.log("Share: Email Driver Info");
                    }
                    
                }
                
            ]
            Container {
                Container {
                    layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                    Label {
                        id: driverLabel
                        text: "Driver : "
                        preferredWidth: 250
                    }
                    Label {
                        id: driverName
                        text: driver.driverName
                    }
                }
                Container {
                    layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                    Label {
                        id: addressLabel
                        text: "Address : "
                        preferredWidth: 250
                    }
                    Label {
                        id: driverAddress
                        text: driver.driverAddress
                    }
                }                
                Container {
                    layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                    Label {
                        id: addressLabel2
                        text: ""
                        preferredWidth: 250
                    }
                    Label {
                        id: driverAddress2
                        text: driver.driverAddress2
                    }
                }                
                Container {
                    layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                    Label {
                        id: cityLabel
                        text: "City :"
                        preferredWidth: 250
                    }
                    Label {
                        id: driverCity
                        text: driver.driverCity
                    }
                }                                
                Container {
                    layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                    Label {
                        id: stateLabel
                        text: "State :"
                        preferredWidth: 250
                    }
                    Label {
                        id: driverState
                        text: driver.driverState
                    }
                }                                
                Container {
                    layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                    Label {
                        id: countryLabel
                        text: "Country :"
                        preferredWidth: 250
                    }
                    Label {
                        id: driverCountry
                        text: driver.driverCountry
                    }
                }                                
                Container {
                    layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                    Label {
                        id: telephoneLabel
                        text: "Telephone :"
                        preferredWidth: 250
                    }
                    Label {
                        id: driverTelephone
                        text: driver.driverTelephone
                    }
                }                                
                Container {
                    layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                    Label {
                        id: emailLabel
                        text: "Email :"
                        preferredWidth: 250
                    }
                    Label {
                        id: emailTelephone
                        text: driver.driverEmail
                    }
                }                                
            }
        }
    }
    Tab {
        title: qsTr("Vehicle")
        Page {
            id: vehicleTab
            titleBar: TitleBar {
                title: qsTr("Vehicle Information");
            }
            
            actions: [
            // define the actions for tab here
                ActionItem {
                    title: qsTr("Create")
                    onTriggered: {
                        createVehicle.open();
                    }
                }
            ]
            Container {
                // define tab content here
                Container {
                    layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                    Label {
                        id: makeLabel
                        text: "Make :"
                        preferredWidth: 250
                    }
                    Label {
                        id: vehicleMake
                        text: vehicle.vehicleMake
                    }
                }                                
                Container {
                    layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                    Label {
                        id: modelLabel
                        text: "Model :"
                        preferredWidth: 250
                    }
                    Label {
                        id: vehicleModel
                        text: vehicle.vehicleModel
                    }
                }                                
                Container {
                    layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                    Label {
                        id: colourLabel
                        text: "Colour :"
                        preferredWidth: 250
                    }
                    Label {
                        id: vehicleColour
                        text: vehicle.vehicleColour
                    }
                }                                
                Container {
                    layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                    Label {
                        id: yearLabel
                        text: "Make :"
                        preferredWidth: 250
                    }
                    Label {
                        id: vehicleYear
                        text: vehicle.vehicleYear
                    }
                }                                
                Container {
                    layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                    Label {
                        id: vinLabel
                        text: "VIN :"
                        preferredWidth: 250
                    }
                    Label {
                        id: vehicleVIN
                        text: vehicle.vehicleVIN
                    }
                }                                
                Container {
                    layout: StackLayout {}
                    horizontalAlignment: HorizontalAlignment.Fill
                    verticalAlignment: VerticalAlignment.Center
                    preferredWidth: 600
                    Button {
                        id: vehiclePhoto
                        text:""
                        imageSource: "asset:///images/picture1.png"
                        onClicked: {
                            console.log("Go to Photo Page");
                            vehicleCamera.open();
                        }
                    }
                }
            }
        }
    }
    Tab {
        title: qsTr("Incident")
        Page {
            id: tab3
            titleBar: TitleBar {
                title: qsTr("Incident");
            }
            
            Container {
                // define tab content here
                Label {
                    text: qsTr("Incident Information")
                    horizontalAlignment: HorizontalAlignment.Center
                    textStyle {
                        base: SystemDefaults.TextStyles.TitleText
                    }
                }
                Container {
                    layout: DockLayout { }
                    layoutProperties: StackLayoutProperties {
                        spaceQuota: 1.0
                    }
                    verticalAlignment: VerticalAlignment.Fill
                    horizontalAlignment: HorizontalAlignment.Fill
                    Label {
                        text: qsTr ("Create an Incident Report")
                        verticalAlignment: VerticalAlignment.Center
                        horizontalAlignment: HorizontalAlignment.Center
                        textStyle {
                            base: SystemDefaults.TextStyles.BodyText
                        }
                    }
                }
            }
        }
    }
    
    onCreationCompleted: {
        // this slot is called when declarative scene is created
        // write post creation initialization here
        console.log("TabbedPane - onCreationCompleted()")
        //driverLabel.visible = !driver.doesExist;
        // enable layout to adapt to the device rotation
        // don't forget to enable screen rotation in bar-bescriptor.xml (Application->Orientation->Auto-orient)
        OrientationSupport.supportedDisplayOrientation = SupportedDisplayOrientation.All;
    }
    attachedObjects:[
        NewDriver {
            id: createDriver
        },
        NewVehicle {
            id: createVehicle
        },
        VehicleCamera {
            id: vehicleCamera
        }
    ]
    function saveDriverInfoToFile () {
        driver.saveDriverInfoToFile ()   
    }
    
}
