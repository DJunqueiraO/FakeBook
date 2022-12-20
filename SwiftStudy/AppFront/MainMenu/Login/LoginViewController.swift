//
//  LoginViewController.swift
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
