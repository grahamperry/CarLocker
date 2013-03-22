import bb.cascades 1.0

Sheet {
    id: newVehicle
    Page {
        titleBar: TitleBar {
            title: qsTr("Create New Vehicle");
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
                            text: qsTr("Make")
                            preferredWidth: 200
                        }
                        TextField {
                            id: makeField
                        }
                    }
                    Container {
                        layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                        Label {
                            text: qsTr("Model")
                            preferredWidth: 200
                        }
                        TextField {
                            id: modelField
                        }
                    }
                    Container {
                        layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                        Label {
                            text: qsTr("Colour")
                            preferredWidth: 200
                        }
                        TextField {
                            id: colourField
                        }
                    }
                    Container {
                        layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                        Label {
                            text: qsTr("Year")
                            preferredWidth: 200
                        }
                        TextField {
                            id: yearField
                        }
                    }
                    Container {
                        layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                        Label {
                            text: qsTr("VIN")
                            preferredWidth: 200
                        }
                        TextField {
                            id: vinField
                        }
                    }
                    
                }
            }
        }
        actions: [
            ActionItem {
                title: "Create"
                onTriggered: {
                    console.log("Create");
                    newVehicle.saveVehicleInfo();
                    newVehicle.clearVehicleInfo();
                    newVehicle.close();
                }
                ActionBar.placement: ActionBarPlacement.OnBar
            },
            ActionItem {
                title: "Quit"
                onTriggered: {
                    console.log("Quit");
                    newVehicle.clearVehicleInfo();
                    newVehicle.close();
                }
                ActionBar.placement: ActionBarPlacement.OnBar
            },
            ActionItem {
                title: "Clear"
                onTriggered: {
                    console.log("Clear");
                    newVehicle.clearVehicleInfo();                    
                }
                ActionBar.placement: ActionBarPlacement.OnBar                
            }
        ]
    }  
    
    onOpened: {
        if (vehicle.vehicleEdit()) {
            makeField.text   = vehicle.getVehicleMake
            modelField.text  = vehicle.getVehicleModel
            colourField.text = vehicle.getVehicleColour
            yearField.text   = vehicle.getVehicleYear
            vinField.text    = vehicle.getVehicleVIN
        }
    }

    function saveVehicleInfo () {
        vehicle.saveVehicleInfo(makeField.text, modelField.text, colourField.text, yearField.text, vinField.text )
    }
    
    function clearVehicleInfo () {
        makeField.text   = ""
        modelField.text  = "" 
        colourField.text = "" 
        yearField.text   = ""
        vinField.text    = ""
    }
    function populate (name) {
        console.log("NewDriver.populate");
        nameField.text = name;
    }
} // End Sheet

