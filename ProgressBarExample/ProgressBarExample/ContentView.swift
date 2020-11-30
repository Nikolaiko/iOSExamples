import SwiftUI

struct ContentView: View {
    var value: Double
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(
                        width: geometry.size.width,
                        height: geometry.size.height
                    )
                    .foregroundColor(Color.gray)
                        
                Rectangle()
                    .frame(
                        width: min(CGFloat(self.value) * geometry.size.width, geometry.size.width),
                        height: geometry.size.height
                    )
                    .foregroundColor(Color.green)
                    .animation(.linear)
            }.cornerRadius(3.0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(value: 0.7)
            .frame(height: 8.0, alignment: .center)
    }
}
