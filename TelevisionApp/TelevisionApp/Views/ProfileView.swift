import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationLink(destination: LoginView()) {
            Text("login")
        }
    }
}

struct LoginView: View {

    @Namespace var namespace
    @Environment(\.resetFocus) var resetFocus

    @State var login = ""
    @State var password = ""

    var body: some View {
        VStack {
            TextField("login", text: $login)

            SecureField("password", text: $password)
                .prefersDefaultFocus(in: namespace)

            Button("login") {}

            Button {
                resetFocus(in: namespace)
            } label: {
                Text("reset creds")
            }
        }
        .focusScope(namespace)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
