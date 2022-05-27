import SwiftUI

struct FocusTracker: View {
    @Environment(\.isFocused) var isFocused
    let action: FocusChangeCallback

    var body: some View {
        Rectangle()
            .fill(Color.clear)
            .onChange(of: isFocused) { value in               
                action(value)
            }
    }
}

struct FocusTracker_Previews: PreviewProvider {
    static var previews: some View {
        FocusTracker(action: { b in })
    }
}
