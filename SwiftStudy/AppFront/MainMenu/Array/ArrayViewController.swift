//
//  ArrayViewController.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 21/12/22.
//

import UIKit

final class ArrayViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        arrayExerciceII()
    }
    private func arrayExerciceI() {
        var ages = [21, 55, 19, 47, 22, 37, 88, 71, 19, 19]
        print(ages.count)
        print(ages.first as Any)
        print(ages.last as Any)
        print(ages[0])
        ages.append(99)
        ages.insert(32, at: 0)
        print(ages)
        ages.sort()
        print(ages)
        ages.reverse()
        print(ages)
        ages.shuffle()
        print(ages)
    }
    private func arrayExerciceII() {
        let colors = ["red", "green", "green", "black", "blue", "yellow", "red", "green", "yellow", "red", "red", "green", "green", "grey", "purple", "orange", "grey", "blue", "red", "green", "yellow", "orange", "purple", "black", "red", "blue", "green", "orange", "blue", "white", "yellow", "blue", "red", "green", "orange", "purple", "blue", "black"]
        print(getMostCommonColor(colors))
    }
    func arrayToDictionary<T>(_ array: [T]) -> [T: Int] {
        var dictionary: [T: Int] = [:]
        for value in array {
            if let count = dictionary[value] {
                dictionary[value] = count + 1
            } else {
                dictionary[value] = 1
            }
        }
        return dictionary
    }
    func getMostCommonColor(_ values: [String]) -> [String] {
        var topColors: [String] = []
        print(arrayToDictionary(values))
        let colorDictionary: [String: Int] = arrayToDictionary(values)
        let highestValue = colorDictionary.values.max()
        for (color, _) in colorDictionary where colorDictionary[color] == highestValue {
            topColors.append(color)
        }
        return topColors
    }
}

