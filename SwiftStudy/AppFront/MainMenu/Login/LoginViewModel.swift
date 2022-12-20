//
//  LoginViewModel.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 20/12/22.
//

import SwiftUI

final class LoginViewModel: ObservableObject {
    @Published var emailText = ""
    @Published var passwordText = ""
}
