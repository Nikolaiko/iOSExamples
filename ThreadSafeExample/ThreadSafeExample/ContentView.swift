import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: InitialExampleView()) {
                    Text("Initial Example")
                }
                NavigationLink(destination: LockView()) {
                    Text("Lock Example")
                }
                NavigationLink(destination: SemaphoreView()) {
                    Text("Semaphore Example")
                }
                NavigationLink(destination: PtPhreadView()) {
                    Text("PtThread Example")
                }
                NavigationLink(destination: SpinView()) {
                    Text("Spin Example")
                }
                NavigationLink(destination: SerialView()) {
                    Text("Serial Example")
                }
                NavigationLink(destination: BarrierView()) {
                    Text("Barrier Example")
                }
            }
        }
    }
}
