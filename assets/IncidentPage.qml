import bb.cascades 1.0
import QtMobility.sensors 1.2
import bb.cascades.maps 1.0
import QtMobilitySubset.location 1.1
import QtQuick 1.0 


Container {                
    horizontalAlignment: HorizontalAlignment.Center
    verticalAlignment: VerticalAlignment.Center
    background: Color.DarkGray;
    layout: DockLayout { }
    leftPadding: 20
    rightPadding: 20
    topPadding: 20
    bottomPadding: 20
    preferredWidth: 1000
    preferredHeight: 1000

    Container {
        horizontalAlignment: HorizontalAlignment.Center
        verticalAlignment: VerticalAlignment.Top                    
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
        Divider {}
        Container {
            id: incidentLocation
            visible: incident.mapVisible
            Container {
                layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight
                }
    
                Label {
                    id: addressLabel
                    text: "Address : "
                }
                Label {
                    id: address
                    text: incident.address
                }
            }
            MapView {
                altitude: incident.altitude //2000
                latitude: incident.latitude
                longitude: incident.longitude
                preferredHeight: 650
                preferredWidth: 720
                //onCreationCompleted: setRenderEngine("RenderEngine3d")
            }
        }
    }
    Container {
        layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
        horizontalAlignment: HorizontalAlignment.Fill
        verticalAlignment: VerticalAlignment.Fill
        topPadding: 870
        minHeight: 50
        
        Button {
            id: incidentRecord
            horizontalAlignment: HorizontalAlignment.Fill
            verticalAlignment: VerticalAlignment.Fill
            preferredWidth: 300
            minHeight: 100
            text: "Log"
            imageSource: "images/Create.png"
            
            onClicked: {
                console.log("Record an Incident");
                logIncidentLocation();
            }
        }
        Button {
            id: zoomOut
            horizontalAlignment: HorizontalAlignment.Fill
            verticalAlignment: VerticalAlignment.Fill
            preferredWidth: 100
            minHeight: 100
            text: "-"
            onClicked: {
                console.log("Zoom Out");
                mapZoomOut();
            }
        }
        Button {
            id: zoomIn
            horizontalAlignment: HorizontalAlignment.Fill
            verticalAlignment: VerticalAlignment.Fill
            preferredWidth: 100
            minHeight: 100
            text: "+"
            onClicked: {
                console.log("Zoom In");
                mapZoomIn();
            }
        }

        Button {
            id: incidentShare
            horizontalAlignment: HorizontalAlignment.Fill
            verticalAlignment: VerticalAlignment.Fill
            preferredWidth: 300
            minHeight: 100
            imageSource: "images/Share.png"

            text: "Fake"
            onClicked: {
                console.log("Fake");
                fakeIncidentLocation();
            }
        }
    }
    function logIncidentLocation() {
        console.log("logIncidentLocation");
        incident.CreateIncidentReport()
    }
    function fakeIncidentLocation() {
        console.log("fakeIncidentLocation");
        incident.fakeIncidentReport()
    }
    function mapZoomIn() {
        console.log("Zoom Map In");
        incident.mapZoomIn()
    }

    function mapZoomOut() {
        console.log("Zoom Map Out");
        incident.mapZoomOut()
    }
}

