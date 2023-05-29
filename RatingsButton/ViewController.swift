//
//  ViewController.swift
//  RatingsButton
//
//  Created by Obinna Aguwa on 29/05/2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
    @IBOutlet weak var buttonFour: UIButton!
    @IBOutlet weak var buttonFive: UIButton!

    var buttonStates: [UIButton: Bool] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Initialize button states
        buttonStates = [
            buttonOne: false,
            buttonTwo: false,
            buttonThree: false,
            buttonFour: false,
            buttonFive: false
        ]

        // Set up tap actions for buttons
        buttonOne.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        buttonTwo.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        buttonThree.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        buttonFour.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        buttonFive.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }

    @objc func buttonTapped(_ sender: UIButton) {
        guard let index = getIndex(for: sender) else {
            return
        }

        _ = buttonStates[sender] ?? false

        // Unselect all buttons
        for (button, _) in buttonStates {
            buttonStates[button] = false
            updateButtonAppearance(for: button, isSelected: false)
        }

        // Select buttons up to the tapped button's index
        for i in 0...index {
            let button = getButton(for: i)
            buttonStates[button] = true
            updateButtonAppearance(for: button, isSelected: true)
        }
    }

    func updateButtonAppearance(for button: UIButton, isSelected: Bool) {
        if isSelected {
            button.setImage(UIImage(systemName: "star.fill"), for: .normal)
            button.tintColor = .systemYellow
        } else {
            button.setImage(UIImage(systemName: "star.fill"), for: .normal)
            button.tintColor = .gray
        }
    }

    func getIndex(for button: UIButton) -> Int? {
        if button == buttonOne {
            return 0
        } else if button == buttonTwo {
            return 1
        } else if button == buttonThree {
            return 2
        } else if button == buttonFour {
            return 3
        } else if button == buttonFive {
            return 4
        } else {
            return nil
        }
    }

    func getButton(for index: Int) -> UIButton {
        switch index {
        case 0:
            return buttonOne
        case 1:
            return buttonTwo
        case 2:
            return buttonThree
        case 3:
            return buttonFour
        case 4:
            return buttonFive
        default:
            fatalError("Invalid index")
        }
    }

}

