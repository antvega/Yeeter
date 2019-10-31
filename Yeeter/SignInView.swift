import SwiftUI
import Combine

struct SignInView : View {

    @State var email: String = ""
    @State var password: String = ""
    @State var loading : Bool = false
    @State var error : Bool = false

    @EnvironmentObject var session: SessionStore
    
    
    func signIn () {
        loading = true
        error = false
        session.signIn(email: email, password: password) { (result, error) in
            self.loading = false
            if error != nil {
                self.error = true
            } else {
                self.email = ""
                self.password = ""
            }
        }
    }

    var body: some View {
        VStack {
            TextField("user@domain.com", text: $email).textContentType(.emailAddress)
            //TextField($email, placeholder: Text("email address"))
            SecureField("Enter a password", text: $password)
           // SecureField($password, placeholder: Text("Password"))
            if (error) {
                Text("Your username and/or password do not match.")
            }
            Button(action: signIn) {
                Text("Sign in")
            }
        }
    }
}
