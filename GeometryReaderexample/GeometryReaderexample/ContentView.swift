import SwiftUI

struct ContentView: View {
    var body: some View {
        //длина экрана в макете 375, отступ 32. 32/375 = 0.0853
        //так же отступ сверху, но считается от высоты
        //GeometryReader - обертка которая позволяет получить размер
        //области который будет выделен для отрисовку тому, что будет внутри GeometryReader
        
        GeometryReader { geometry in
            Image("test_image")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal, geometry.size.width * 0.0853)
                .padding(.top, geometry.size.height * 0.063)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
