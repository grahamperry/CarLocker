import bb.cascades 1.0

Container {
    Container {
        layout: StackLayout {
            orientation: LayoutOrientation.LeftToRight
        }
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
        layout: StackLayout {
            orientation: LayoutOrientation.LeftToRight
        }
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
        layout: StackLayout {
            orientation: LayoutOrientation.LeftToRight
        }
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
        layout: StackLayout {
            orientation: LayoutOrientation.LeftToRight
        }
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
        layout: StackLayout {
            orientation: LayoutOrientation.LeftToRight
        }
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
        layout: StackLayout {
            orientation: LayoutOrientation.LeftToRight
        }
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
        layout: StackLayout {
            orientation: LayoutOrientation.LeftToRight
        }
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
        layout: StackLayout {
            orientation: LayoutOrientation.LeftToRight
        }
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