import bb.cascades 1.0
import bb.cascades.multimedia 1.0

Sheet {
    id: vehicleCamera
    Page {
        content: Container {
            layout: DockLayout {}
            onCreationCompleted: {
                if (camera1.allCamerasAccessible) {
                    camera1.open(CameraUnit.Rear);
                }
            }
            Camera {
                id: camera1
                horizontalAlignment: HorizontalAlignment.Fill
                verticalAlignment: VerticalAlignment.Fill
                property bool photoBeingTaken
        
                layoutProperties : AbsoluteLayoutProperties {
                    id: vfLayout
                    positionX: 0
                    positionY: 0
                }
                
                onTouch: {
                    if (photoBeingTaken == false) {
                        console.log("Camera: onTouch");
                        photoBeingTaken = true;
                        camera1.capturePhoto()
                    }
                }
                onCameraOpened: {
                    camera1.startViewfinder();
                }
                onCameraOpenFailed: {
                    console.log("Camera cannot open " + error);
                }
                onViewfinderStarted: {
                    photoBeingTaken = false;
                }
                onPhotoCaptureFailed: {
                    console.log("Photo could not be taken " + error);
                }
                onPhotoSaved: {
                    console.log("Photo has been successfully Saved : " + fileName);
                    photoBeingTaken = false;
                    setting.lastFileName = fileName;
                    setting.visible = true;
                }
                onPhotoSaveFailed: {
                    console.log("Photo could not be saved: Error " + error);
                    photoBeingTaken = false
                }
                onShutterFired: {
                    vehicle.playShutter()
                }
            }
            Container {
                horizontalAlignment: HorizontalAlignment.Fill
                verticalAlignment: VerticalAlignment.Bottom
                layout: DockLayout {}
                ImageButton {
                    id: setting
                    property string lastFileName
                    visible: false
                    defaultImageSource: "asset:///images/settings_unpressed.png"
                    pressedImageSource: "asset:///images/settings_pressed.png"
                    horizontalAlignment: HorizontalAlignment.Right
                    verticalAlignment: VerticalAlignment.Bottom
                    
                    onClicked: {
                        console.log("ShowPhotoInCard");
                        vehicle.showPhotoInCard(lastFileName);
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
                    console.log("Retake");
                }
                ActionBar.placement: ActionBarPlacement.OnBar
            }
        ]
    }  

} // End Sheet

