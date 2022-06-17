import SwiftUI

struct MatchView: View {
    @State var match = Match()
    @State var prize: Double = 0.0

    var body: some View {
        VStack {
            HStack {
                VStack {
                    Text("Me")
                        .font(.title)
                    Image(systemName: "circle.fill")
                        .foregroundColor(
                            match.who == .one ? Color.red : Color.clear
                        )
                    Button {
                        match.addScore(team: .one)
                    } label: {
                        Image(systemName: "\(match.teamScore[0]).circle.fill")
                            .font(.largeTitle)
                    }

                }
                VStack {
                    Text("Comp")
                        .font(.title)
                    Image(systemName: "circle.fill")
                        .foregroundColor(
                            match.who == .two ? Color.red : Color.clear
                        )
                    Button {
                        match.addScore(team: .two)
                    } label: {
                        Image(systemName: "\(match.teamScore[1]).circle.fill")
                            .font(.largeTitle)
                    }

                }
            }
            Spacer()
            Text("Prize: \(prize.roundedString(3))")
                .focusable()
                .digitalCrownRotation($prize, from: 0, through: 200, by: 0.10)
        }
        .alert(isPresented: $match.isOver) {
            Alert(
                title: Text("Ha-ha"),
                message: Text("Winner"),
                dismissButton: .default(Text("Restart")){ match = Match()  }
            )
        }
    }
}

private extension Double {
    func roundedString(_ places: Int) -> String {
        String(format: "%.\(places)f", self)
    }

}

struct MatchView_Previews: PreviewProvider {
    static var previews: some View {
        MatchView()
    }
}
