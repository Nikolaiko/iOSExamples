import SwiftUI


extension View {
    @ViewBuilder
    func onFocusChange(perform callback: @escaping FocusChangeCallback) -> some View {
        background(FocusTracker(action: callback))
    }

    @ViewBuilder
    func hidden(_ value: Bool) -> some View {
        if value {
            hidden()
        } else {
            self
        }
    }
}
