import SwiftUI

struct ContentView: View {
    @State var value = 0.0
    
    var body: some View {
        VStack {
            ProgressBarView(value: value)
                .frame(height: 10.0)
            Button(action: { value += 0.1  }, label: {
                Text("Add Value")
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
