//
//  CreateImageView.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 16/12/22.
//

import UIKit

extension Create {
    func imageView(_ image: UIImage? = nil) -> UIImageView {
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }
}
