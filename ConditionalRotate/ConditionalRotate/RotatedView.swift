import SwiftUI

struct RotatedView: View {
    @State private var rotationEnabled = false
    
    var body: some View {
        VStack {
            Text((rotationEnabled) ? "Rotation Enabled" : "Rotation Disabled")
            Button(action: toggleRotation, label: {
                Text("Toggle Rotation")
            })
        }
        .onDisappear {
            AppDelegate.preferredOrientation = [.portrait, .portraitUpsideDown]
            if !UIDevice.current.orientation.isPortrait {
                UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
                
            }
        }
    }
    
    private func toggleRotation() {
        rotationEnabled.toggle()
        
        if rotationEnabled {
            AppDelegate.preferredOrientation = [.portrait, .portraitUpsideDown, .landscape]
            UIViewController.attemptRotationToDeviceOrientation()
        } else {
            AppDelegate.preferredOrientation = [.portrait, .portraitUpsideDown]
            if !UIDevice.current.orientation.isPortrait {
                UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
                UIViewController.attemptRotationToDeviceOrientation()
            }
        }
    }
}

struct RotatedView_Previews: PreviewProvider {
    static var previews: some View {
        RotatedView()
    }
}
