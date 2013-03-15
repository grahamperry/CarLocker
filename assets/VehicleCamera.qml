import bb.cascades 1.0

Sheet {
    id: vehicleCamera
    Page {
        titleBar: TitleBar {
            title: qsTr("Vehicle Photo");
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
                            text: qsTr("Insert Photo Window Here")
                            preferredWidth: 200
                        }
                    }
                    
                }
            }
        }
        actions: [
            ActionItem {
                title: "Accept"
                onTriggered: {
                    console.log("Accept");
                    vehicleCamera.close();
                }
                ActionBar.placement: ActionBarPlacement.OnBar
            },
            ActionItem {
                title: "Retake"
                onTriggered: {
                    console.log("Quit");
                }
                ActionBar.placement: ActionBarPlacement.OnBar
            }
        ]
    }  

} // End Sheet

