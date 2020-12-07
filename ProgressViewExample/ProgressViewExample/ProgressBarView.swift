import SwiftUI

struct ProgressBarView: View {
    let value: Double
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Capsule()
                    .frame(
                        width: geometry.size.width,
                        height: geometry.size.height)
                    .foregroundColor(Color.blue.opacity(0.4))
                
                Capsule()
                    .frame(
                        width: min(geometry.size.width * CGFloat(value),
                                   geometry.size.width),
                        height: geometry.size.height,
                        alignment: .center)
                    .foregroundColor(Color.red)
                    .animation(.linear)
            }            
        }
    }
}

struct ProgressBarView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBarView(value: 0.3)
            .frame(height: 10)
    }
}
