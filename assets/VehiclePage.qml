import bb.cascades 1.0

Container {
    // define tab content here
    id: vehicleContent
    Container {
        layout: StackLayout {
            orientation: LayoutOrientation.LeftToRight
        }
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
        layout: StackLayout {
            orientation: LayoutOrientation.LeftToRight
        }
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
        layout: StackLayout {
            orientation: LayoutOrientation.LeftToRight
        }
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
        layout: StackLayout {
            orientation: LayoutOrientation.LeftToRight
        }
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
        layout: StackLayout {
            orientation: LayoutOrientation.LeftToRight
        }
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
        layout: DockLayout {
        }
        horizontalAlignment: HorizontalAlignment.Center
        verticalAlignment: VerticalAlignment.Bottom
        topPadding: 40

        preferredWidth: 1000
        preferredHeight: 1000
        Container {
            ImageButton {
                id: vehiclePhoto
                horizontalAlignment: HorizontalAlignment.Center
                verticalAlignment: VerticalAlignment.Top
                preferredWidth: 900
                preferredHeight: 900
                defaultImageSource: vehicle.vehiclePhoto
                onClicked: {
                    vehicleCamera.open();
                }
            }
        }
    }
}