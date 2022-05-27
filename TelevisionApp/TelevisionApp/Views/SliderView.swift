import SwiftUI

struct SliderView: View {
    
    let itemNames = Array(1...10).map { "w\($0)" }.shuffled()

    var body: some View {
        ScrollView(.horizontal) {
            HStack() {
                ForEach(itemNames, id: \.self) { itemName in
                    MovieItem(imageName: itemName, itemType: .slider)
                }
            }
            .padding(80)
            .padding(40)
        }
        .padding(-80)
        .edgesIgnoringSafeArea(.horizontal)
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView()
    }
}
