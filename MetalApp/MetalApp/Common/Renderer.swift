import Metal
import MetalKit
import ModelIO

final class Renderer: NSObject {

    private unowned let mtkView: MTKView
    private let device: MTLDevice

    // Pipeline
    private var commandQueue: MTLCommandQueue!
    private var pipelineState: MTLRenderPipelineState!
    private var depthStencilState: MTLDepthStencilState!

    // Resources
    private var vertexDescriptor: MTLVertexDescriptor!
    private var texture: MTLTexture!
    private var meshes: [MTKMesh] = .init()

    // Render process

    private var time: Float = 0
    private var uniforms: Uniforms!


    init(device: MTLDevice, mtkView: MTKView) {
        self.device = device
        self.mtkView = mtkView
        commandQueue = device.makeCommandQueue()
        super.init()

        loadResources()
        buildPipeline()
    }

    func loadResources() {
        let modelURL = Bundle.main.url(forResource: "teapot", withExtension: "obj")

        let vertexDesc: MDLVertexDescriptor = .init()
        vertexDesc.attributes[0] = MDLVertexAttribute(name: MDLVertexAttributePosition, format: .float3, offset: 0, bufferIndex: 0)
        vertexDesc.attributes[1] = MDLVertexAttribute(name: MDLVertexAttributeTextureCoordinate, format: .float2, offset: MemoryLayout<Float>.size*3, bufferIndex: 0)
        vertexDesc.layouts[0] = MDLVertexBufferLayout(stride: MemoryLayout<Float>.size * 5)
        vertexDescriptor = MTKMetalVertexDescriptorFromModelIO(vertexDesc)

        let bufferAllocator = MTKMeshBufferAllocator(device: device)
        let asset = MDLAsset(url: modelURL, vertexDescriptor: vertexDesc, bufferAllocator: bufferAllocator)
        var modelMeshes = [MDLMesh]()

        do {
            (modelMeshes, meshes) = try MTKMesh.newMeshes(asset: asset, device: device)
        } catch {
            print("loadResources texture ERROR")
            return
        }

        // Flip
        modelMeshes.first!.flipTextureCoordinates(inAttributeNamed: MDLVertexAttributeTextureCoordinate)

        let modelTexture = MDLTexture(named: "9935-v1.jpg")
        let textureLoader = MTKTextureLoader(device: device)

        do {
            texture = try textureLoader.newTexture(texture: modelTexture!, options: nil)
        } catch {
            print("loadResources texture ERROR")
            return
        }
    }

    func buildPipeline() {
        // Depth Stencil
        let depthStencilDesc: MTLDepthStencilDescriptor = .init()
        depthStencilDesc.depthCompareFunction = .less
        depthStencilDesc.isDepthWriteEnabled = true
        depthStencilState = device.makeDepthStencilState(descriptor: depthStencilDesc)

        guard let library = device.makeDefaultLibrary() else {
            print("library error")
            return
        }

        // Pipeline
        let pipelineDesc: MTLRenderPipelineDescriptor = .init()
        // shaders
        pipelineDesc.vertexDescriptor = vertexDescriptor
        pipelineDesc.vertexFunction = library.makeFunction(name: "vertex_main")
        pipelineDesc.fragmentFunction = library.makeFunction(name: "fragment_main")
        pipelineDesc.colorAttachments[0].pixelFormat = .bgra8Unorm
        pipelineDesc.depthAttachmentPixelFormat = .depth32Float

        do {
            pipelineState = try device.makeRenderPipelineState(descriptor: pipelineDesc)
        } catch(let error) {
            print("pipeline error \(error)")
        }
    }

    // Update

    func updateMeshes(encoder: MTLRenderCommandEncoder, fps: Float) {

        // Move Mesh in Space
        time += 1 / fps
        let angle = -time/2

        let modelMatrix = float4x4(rotationAbout: SIMD3<Float>(0, 1, 0), by: angle) * float4x4(scaleBy: 0.3)

        // Update Camera
        var viewMatrix = float4x4(translationBy: SIMD3<Float>(0,-0.5,-1.5)) // View Point

        let modelViewMatrix = viewMatrix * modelMatrix
        let aspectRatio = Float(mtkView.frame.size.width / mtkView.frame.size.height)
        let projectionMatrix = float4x4(perspectiveProjectionFov: (Float.pi/18)*8, aspectRatio: aspectRatio, nearZ: 0.01, farZ: 200)

        let normalMatrix = modelViewMatrix.normalMatrix()

        uniforms = Uniforms(modelViewMatrix: modelViewMatrix, projectionMatrix: projectionMatrix, normalMatrix: normalMatrix)

        // Add to Encoder
        encoder.setFragmentTexture(texture, index: 0)
        encoder.setVertexBytes(&uniforms, length: MemoryLayout<Uniforms>.size, index: 1)

        for mesh in meshes {
            let vertexBuffer = mesh.vertexBuffers.first!
            encoder.setVertexBuffer(vertexBuffer.buffer, offset: vertexBuffer.offset, index: 0)

            for sm in mesh.submeshes {
                let indexBuffer = sm.indexBuffer
                encoder.drawIndexedPrimitives(type: sm.primitiveType,
                                              indexCount: sm.indexCount,
                                              indexType: sm.indexType,
                                              indexBuffer: indexBuffer.buffer,
                                              indexBufferOffset: indexBuffer.offset)
            }
        }
    }

}

// MARK: - Delegates

extension Renderer: MTKViewDelegate {

    func draw(in view: MTKView) {
        // Buffer
        let commandBuffer = commandQueue.makeCommandBuffer()!
        // Render Pass Descriptor
        guard let renderPassDesc = view.currentRenderPassDescriptor, let drawable = view.currentDrawable else {
            print("buffer error")
            return
        }
        renderPassDesc.colorAttachments[0].clearColor = MTLClearColor(red: 0, green: 0, blue: 0, alpha: 1)
        let encoder = commandBuffer.makeRenderCommandEncoder(descriptor: renderPassDesc)!
        encoder.setRenderPipelineState(pipelineState)
        encoder.setDepthStencilState(depthStencilState)
        encoder.setFrontFacing(.counterClockwise)
        encoder.setCullMode(.back)

        updateMeshes(encoder: encoder, fps: Float(view.preferredFramesPerSecond))

        encoder.endEncoding()
        commandBuffer.present(drawable)
        commandBuffer.commit()

    }

    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {}

}
