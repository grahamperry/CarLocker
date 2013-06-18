import bb.cascades 1.0
import QtMobility.sensors 1.2
import bb.cascades.maps 1.0
import QtMobilitySubset.location 1.1

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
            textStyle {
                fontSize: FontSize.Medium
                color: Color.Black
            }
        }
        Container {
            layout: StackLayout {
                orientation: LayoutOrientation.LeftToRight
            }
            Label {
                id: position
                text: "POS:"
                visible: false
            }
            Label {
                id: latitude
                text: incident.latitude
                visible: false
            }
            Label {
                id: longitude
                text: incident.longitude
                visible: false
            }
        }
        MapView {
            id: incidentLocation
            latitude: incident.latitude
            longitude: incident.longitude
            visible: false
            onCreationCompleted: setRenderEngine("RenderEngine3d")
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
                incidentLocation.visible = true
                position.visible = true
                longitude.visible = true
                latitude.visible = true
                incidentTitle.textStyle.color = Color.Red 
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

