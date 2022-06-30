import Foundation
import SwiftUI


struct MetalView: UIViewRepresentable {

    let coordinator = MetalCoordinator()

    func makeUIView(context: Context) -> some UIView {
        coordinator.mtkView
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
