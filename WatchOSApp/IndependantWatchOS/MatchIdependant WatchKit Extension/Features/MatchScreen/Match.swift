import Foundation


struct Match {
    var teamScore: [Int] = [0, 0]
    var who: Team?
    var isOver: Bool = false

    mutating func addScore(team: Team) {
        switch team {
        case .one:
            teamScore[0] += 1
        case .two:
            teamScore[1] += 1
        }

        who = teamScore[0] == teamScore[1] ? nil : (teamScore[0] > teamScore[1] ? .one : .two)
        isOver = teamScore.contains(10)
    }
}
