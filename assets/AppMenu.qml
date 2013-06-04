import bb.cascades 1.0

MenuDefinition {
    attachedObjects: [
        ComponentDefinition {
            id: aboutComponent
            source: "About.qml"
        },
        ComponentDefinition {
            id: settingsComponent
            source: "Settings.qml"
        }
    ]
    settingsAction: SettingsActionItem {
        onTriggered: {
            var page = settingsComponent.createObject();
            page.open();
        }
    }
    actions: [
        ActionItem {
            title: qsTr("About") + Retranslate.onLanguageChanged
            onTriggered: {
                var page = aboutComponent.createObject();
                page.open();
            }
            imageSource: "asset:///images/Info.png"
        }
    ]
}
