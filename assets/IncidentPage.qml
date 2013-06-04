import bb.cascades 1.0
import bb.cascades.maps 1.0

Container {                
    horizontalAlignment: HorizontalAlignment.Center
    verticalAlignment: VerticalAlignment.Center
    background: Color.DarkGray;
    layout: StackLayout { }
    leftPadding: 20
    rightPadding: 20
    topPadding: 20
    bottomPadding: 20
    preferredWidth: 1000
    preferredHeight: 1000
    Container {
        horizontalAlignment: HorizontalAlignment.Center
        verticalAlignment: VerticalAlignment.Center                    
        preferredWidth: 1000
        preferredHeight: 500                          

        Label {
            id: incidentTitle
            text: incident.incident
            preferredHeight: 50
            horizontalAlignment: HorizontalAlignment.Center
        }
        MapView {
            id: incidentMap
            latitude: 43.468245
            longitude: -80.519603
            altitude: 100
            visible: false
        }                         
    }
    Container {
        layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
        horizontalAlignment: HorizontalAlignment.Fill
        verticalAlignment: VerticalAlignment.Fill
        topPadding: 20
        bottomPadding: 20
        minHeight: 50
        
        Button {
            id: incidentRecord
            horizontalAlignment: HorizontalAlignment.Fill
            verticalAlignment: VerticalAlignment.Fill
            preferredWidth: 500
            minHeight: 100
            text: "Log"
            imageSource: "images/Create.png"
            
            onClicked: {
                console.log("Record an Incident");
                incidentMap.visible = true
                logIncidentLocation();
            }
        }
        Button {
            id: incidentShare
            horizontalAlignment: HorizontalAlignment.Fill
            verticalAlignment: VerticalAlignment.Fill
            preferredWidth: 500
            minHeight: 100
            imageSource: "images/Share.png"

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
        topPadding: 20
        bottomPadding: 20
        minHeight: 50

        Button {
            id: phoneHome
            horizontalAlignment: HorizontalAlignment.Fill
            verticalAlignment: VerticalAlignment.Fill
            preferredWidth: 500
            preferredHeight: 50
            text: "Home"
            imageSource: "images/Phone.png"

            onClicked: {
                console.log("Phone Home, ET");
            }
        }
        Button {
            id: phoneInsurance
            horizontalAlignment: HorizontalAlignment.Fill
            verticalAlignment: VerticalAlignment.Fill
            preferredWidth: 500
            preferredHeight: 50
            text: "Insurance"
            imageSource: "images/Phone.png"
            
            onClicked: {
                console.log("Call Insurance");
            }
        }
    }  
    Container {
        layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
        horizontalAlignment: HorizontalAlignment.Fill
        verticalAlignment: VerticalAlignment.Fill
        topPadding: 20
        bottomPadding: 20
        minHeight: 50

        Button {
            id: incidentVideo
            horizontalAlignment: HorizontalAlignment.Fill
            verticalAlignment: VerticalAlignment.Fill
            preferredWidth: 500
            preferredHeight: 50
            text: "Video"
            imageSource: "images/Video.png"

            onClicked: {
                console.log("Video an Incident");
            }
        }
        Button {
            id: emergencyServices
            horizontalAlignment: HorizontalAlignment.Fill
            verticalAlignment: VerticalAlignment.Fill
            preferredWidth: 500
            preferredHeight: 50
            text: "Emergency"
            imageSource: "images/Phone.png"
            
            onClicked: {
                console.log("Call Emergency Services");
            }
        }
    }  
}

