//
//  LoginView.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 20/12/22.
//

import SwiftUI

final class LoginViewController: UIHostingController<LoginView> {
    init() {
        super.init(rootView: LoginView())
    }
    @MainActor required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

struct LoginView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
