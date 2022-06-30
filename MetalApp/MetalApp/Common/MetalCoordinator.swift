import Foundation
import Metal
import MetalKit

final class MetalCoordinator {

    var mtkView = MTKView()
    var renderer: Renderer?

    init() {
        if let device = MTLCreateSystemDefaultDevice() {
            let r = Renderer(device: device, mtkView: mtkView)

            renderer = r
            mtkView.device = device
            mtkView.delegate = r
            mtkView.colorPixelFormat = .bgra8Unorm
            mtkView.depthStencilPixelFormat = .depth32Float
            mtkView.framebufferOnly = false
        }
    }
}
