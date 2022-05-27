import SwiftUI

struct MoviesView: View {
    let itemNames = Array(1...13).map { "h\($0)" }.shuffled()

    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(itemNames, id: \.self) { itemName in
                    MovieItem(imageName: itemName, itemType: .card)
                }
            }
            .padding(80)
            .padding(40)
        }
        .padding(-80)
        .edgesIgnoringSafeArea(.horizontal)
    }
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
    }
}
