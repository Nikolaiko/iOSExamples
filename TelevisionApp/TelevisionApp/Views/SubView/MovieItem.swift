import SwiftUI

struct MovieItem: View {
    let imageName: String
    let itemType: MovieItemType

    @State var isFocused = false

    private var itemSize: CGSize {
        switch itemType {
        case .slider:
            return .init(width: 1700, height: 600)
        case .card:
            return .init(width: 300, height: 400)
        }
    }

    private var shouldHideText: Bool {
        itemType == .slider || !isFocused
    }

    var body: some View {
        VStack(spacing: 40) {
            NavigationLink(destination: MovieDetails()) {
                Image(imageName)
                    .resizable()
                    .frame(width: itemSize.width, height: itemSize.height)
                    .onFocusChange { value in
                        withAnimation {
                            isFocused = value
                        }
                    }
            }
            .buttonStyle(.card)

            VStack {
                Text("Blade runner")
                Text("Cyberpunk")
            }
            .hidden(shouldHideText)
        }
    }
}

struct MovieItem_Previews: PreviewProvider {
    static var previews: some View {
        MovieItem(imageName: "h1", itemType: .slider)
    }
}
