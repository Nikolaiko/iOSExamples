import SwiftUI

struct NotificationView: View {
    let title: String
    let subtitle: String
    let imageURL: String

    var body: some View {
        VStack {
            Text(title)
            Text(subtitle)
            AsyncImage(url: URL(string: imageURL))                
        }
    }
}

//struct NotificationView_Previews: PreviewProvider {
//    static var previews: some View {
//        NotificationView()
//    }
//}
