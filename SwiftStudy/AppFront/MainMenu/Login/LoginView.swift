//
//  LoginView.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 20/12/22.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var loginViewModel = LoginViewModel()
    var body: some View {
        ZStack {
            Color(.label).ignoresSafeArea()
            VStack(spacing: UIScreen.main.bounds.height*0.01) {
                Text("Welcome")
                    .foregroundColor(Color(.reverseDark))
                    .font(Font.system(size: 30, weight: .bold))
                Text("Login With Your Email")
                    .foregroundColor(Color(.reverseDark))
                TextField("Email", text: $loginViewModel.emailText)
                    .border(.white, width: 0.5)
                    .frame(height: UIScreen.main.bounds.height*0.05)
                TextField("Password", text: $loginViewModel.passwordText)
                    .border(.white, width: 0.5)
                    .frame(height: UIScreen.main.bounds.height*0.05)
                Button("Tap Me") {
                    print("Lero")
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
