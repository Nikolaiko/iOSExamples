import SwiftUI

struct GeometryAnimation: View {
    
    @State var orbitalAnimated: Bool = true
    @State var isAnim: Bool = true
    
    var card: some View {
        VStack {
            Text("How to present\na\u{00a0}full screen modal\nwith fullScreenCover()")
                .frame(minHeight: 100)
                .lineLimit(3)
                .multilineTextAlignment(.center)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
        }
    }
    
    var body: some View {
        VStack {
            card
                .modifier(OrbitalEffect(percent: orbitalAnimated ? 1.0 : 0.0, radius: 100 / 2, goOn: isAnim))
                .onTapGesture {
                    withAnimation(
                        Animation.linear(duration: 3).repeatCount(3, autoreverses: false)) {
                        orbitalAnimated.toggle()                    
                    }
                }

        }
        
        
    }
}

 struct OrbitalEffect: GeometryEffect {
     
     let initialAngle: CGFloat = 0
     
     var percent: CGFloat = 0
     let radius: CGFloat
     let goOn: Bool
     
     var animatableData: CGFloat {
         get { percent }
         set { percent = newValue }
     }
     
     func effectValue(size: CGSize) -> ProjectionTransform {
         let angle: CGFloat = 2 * .pi * percent + initialAngle
         let point: CGPoint = .init(x: cos(angle) * radius,
                                    y: sin(angle) * radius)
         return goOn
            ? ProjectionTransform(CGAffineTransform(translationX: point.x, y: point.y))
            : ProjectionTransform()
     }
     
     
 }
 
