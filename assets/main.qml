import bb.cascades 1.0

TabbedPane {
    showTabsOnActionBar: true
    Tab {
        title: qsTr("Driver")
        imageSource: "images/Driver.png"
        Page {
            id: driverTab
            titleBar: TitleBar {
                title: qsTr("Driver Information");
            }
            signal populateDriver();
            actions: [
                // define the actions for first tab here
                ActionItem {
                    title: qsTr("Create")
                    onTriggered: {
                        createDriver.open("");
                    }
                },
                ActionItem {
                    title: qsTr("Edit")
                    onTriggered: {     
                        driverEdit() 
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
                    imageSource: "images/Share.png"
                    
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
        imageSource: "images/Car.png"
        
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
                },
                ActionItem {
                    title: qsTr("Edit")
                    onTriggered: {     
                        vehicleEdit() 
                    }
                },                
                ActionItem {
                    title: qsTr("Save");
                    onTriggered: {
                        saveVehicleInfoToFile();
                    }
                }
            ]
            Container {
                // define tab content here
                id: vehicleContent
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
                    layout: DockLayout {}
                    horizontalAlignment: HorizontalAlignment.Center
                    verticalAlignment: VerticalAlignment.Bottom
                    //background: Color.Blue;
                    
                    preferredWidth: 1000
                    preferredHeight: 1000
                    Container {
                        ImageView {
                            id: vehiclePhoto
                            horizontalAlignment: HorizontalAlignment.Center
                            verticalAlignment: VerticalAlignment.Top 
                            preferredWidth: 900
                            preferredHeight: 900                   
                            imageSource: vehicle.vehiclePhoto
                        }
                        Button {
                            id: photo
                            text: "Photo"
                            horizontalAlignment: HorizontalAlignment.Center
                            verticalAlignment: VerticalAlignment.Bottom
                            onClicked: {
                                console.log("Go to Photo Page");
                                vehicleCamera.open();
                            }
                        }
                    }
                }
            }
        }
    }
    Tab {
        title: qsTr("Incident")
        imageSource: "images/Driver.png"
        
        Page {
            id: tab3
            titleBar: TitleBar {
                title: qsTr("Incident Information");
                visibility: ChromeVisibility.Visible
            }
            
            Container {
                horizontalAlignment: HorizontalAlignment.Center
                verticalAlignment: VerticalAlignment.Center
                background: Color.Blue;
                layout: StackLayout { }
                leftPadding: 20
                rightPadding: 20
                topPadding: 20
                bottomPadding: 20
                preferredWidth: 1000
                preferredHeight: 1000
                Container {
                    layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                    horizontalAlignment: HorizontalAlignment.Fill
                    verticalAlignment: VerticalAlignment.Fill
                    topPadding: 20
                    bottomPadding: 20
                    minHeight: 500
                    background: Color.Red;
                    
                    Button {
                        id: incidentRecord
                        horizontalAlignment: HorizontalAlignment.Fill
                        verticalAlignment: VerticalAlignment.Fill
                        preferredWidth: 500
                        minHeight: 100
                        text: "Log"
                        onClicked: {
                            console.log("Record an Incident");
                        }
                    }
                    Button {
                        id: incidentShare
                        horizontalAlignment: HorizontalAlignment.Fill
                        verticalAlignment: VerticalAlignment.Fill
                        preferredWidth: 500
                        minHeight: 100

                        text: "Share"
                        onClicked: {
                            console.log("Share an Incident");                                
                        }
                    }
                }
                Container {
                    layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                    horizontalAlignment: HorizontalAlignment.Fill
                    verticalAlignment: VerticalAlignment.Fill
                    topPadding: 200
                    bottomPadding: 20
                    background: Color.Green;
                    minHeight: 500

                    Button {
                        id: incidentVideo
                        horizontalAlignment: HorizontalAlignment.Fill
                        verticalAlignment: VerticalAlignment.Fill
                        preferredWidth: 500
                        preferredHeight: 500
                        text: "Video"
                        onClicked: {
                            console.log("Video an Incident");
                        }
                    }
                    Button {
                        id: emergencyServices
                        horizontalAlignment: HorizontalAlignment.Fill
                        verticalAlignment: VerticalAlignment.Fill
                        preferredWidth: 500
                        preferredHeight: 500
                        text: "Emergency"
                        onClicked: {
                            console.log("Call Emergency Services");
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
    function saveDriverInfoToFile() {
        driver.saveDriverInfoToFile ()   
    }
    function saveVehicleInfoToFile() {
        vehicle.saveVehicleInfoToFile()   
    }
    function driverEdit() {
        driver.setEditMode(true);
        createDriver.open();
    }
    function vehicleEdit() {
        vehicle.setEditMode(true);
        createVehicle.open();
    }
    
}
