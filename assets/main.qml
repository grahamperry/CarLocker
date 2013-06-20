import bb.cascades 1.0
import bb.cascades.maps 1.0

TabbedPane {
    showTabsOnActionBar: true
    Menu.definition: AppMenu {
    }
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
                    imageSource: "images/Create.png"                    
                    onTriggered: {
                        createDriver.open("");
                    }
                },
                ActionItem {
                    title: qsTr("Edit")
                    imageSource: "images/Open.png"
                    onTriggered: {     
                        driverEdit() 
                    }
                },
                ActionItem {
                    title: qsTr("Save");
                    imageSource: "images/Save.png"
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
            DriverPage {}
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
                    imageSource: "images/Create.png"
                    onTriggered: {
                        createVehicle.open();
                    }
                },
                ActionItem {
                    title: qsTr("Edit")
                    imageSource: "images/Open.png"
                    onTriggered: {
                        vehicleEdit()
                    }
                },
                ActionItem {
                    title: qsTr("Save")
                    imageSource: "images/Save.png"
                    onTriggered: {
                        saveVehicleInfoToFile();
                    }
                }
            ]

            VehiclePage {}
        }
    }
    Tab {
        title: qsTr("Incident")
        imageSource: "images/Incident.png"
        Page {
            id: tab3
            titleBar: TitleBar {
                title: qsTr("Incident Information")
                visibility: ChromeVisibility.Visible
            }
            IncidentPage {}
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
