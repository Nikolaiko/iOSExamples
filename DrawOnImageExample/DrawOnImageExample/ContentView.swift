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
        let textFont = UIFont(name: "Helvetica Bold", size: 60)!

        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(image.size, false, scale)

        let textFontAttributes = [
            NSAttributedString.Key.font: textFont,
            NSAttributedString.Key.foregroundColor: textColor,
        ] as [NSAttributedString.Key : Any]
        image.draw(in: CGRect(origin: CGPoint.zero, size: image.size))

        let rect = CGRect(origin: CGPoint(x: 100, y: 260), size: CGSize(width: image.size.width - 200, height: image.size.height - 500))
        "And I will strike down upon thee With great vengeance and furious anger Those who attempt to poison and destroy my brothers And you will know my name is the Lord When I lay my vengeance upon thee".draw(in: rect, withAttributes: textFontAttributes)

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
