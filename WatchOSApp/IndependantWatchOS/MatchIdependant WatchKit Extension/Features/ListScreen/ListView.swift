import SwiftUI

struct ListView: View {
    @State var ourFlags = allFlags

    var body: some View {
        List {
            ForEach(ourFlags) { flag in
                Text(flag.name)
                    .font(.headline)
            }
            .onMove { ourFlags.move(fromOffsets: $0, toOffset:$1) }
            .onDelete { ourFlags.remove(atOffsets: $0) }
        }
        //.listStyle(CarouselListStyle())
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
