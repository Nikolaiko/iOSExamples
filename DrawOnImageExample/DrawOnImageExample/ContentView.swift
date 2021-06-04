import SwiftUI
import CoreData

struct ContentView: View {
    var body: some View {
        VStack {
            Image("Overlay1")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            
            Button(action: draw, label: {
                Text("DRAW")
            })
        }
    }
    
    func draw() {
        let image = UIImage(named: "Overlay1")!
        let textColor = UIColor.white
        let textFont = UIFont(name: "Helvetica Bold", size: 12)!

        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(image.size, false, scale)

        let textFontAttributes = [
            NSAttributedString.Key.font: textFont,
            NSAttributedString.Key.foregroundColor: textColor,
        ] as [NSAttributedString.Key : Any]
        image.draw(in: CGRect(origin: CGPoint.zero, size: image.size))

        let rect = CGRect(origin: CGPoint(x: 700, y: 700), size: image.size)
        "text".draw(in: rect, withAttributes: textFontAttributes)

        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        UIImageWriteToSavedPhotosAlbum(newImage!, self, nil, nil)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
