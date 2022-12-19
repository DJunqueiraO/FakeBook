//
//  resizeImageView.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 19/12/22.
//

import UIKit

extension UIButton {
    func resizeImageView() {
        imageView?.contentMode = .scaleAspectFit
        imageView?.enableAutoLayout
            .constraint(attributes: [.top, .leading, .trailing, .bottom])
    }
}
