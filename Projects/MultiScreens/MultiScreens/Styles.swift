//
//  Styles.swift
//  MultiScreens
//
//  Created by Ludovic Ollagnier on 06/11/2020.
//

import UIKit

extension UIButton {

    static func styledButton() -> UIButton {
        let button = UIButton()
        button.backgroundColor = .purple
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Custom Button", for: .normal)
        
        return button
    }

    func stylize() {
        self.backgroundColor = .purple
        self.setTitleColor(.white, for: .normal)
        self.setTitle("Custom Button", for: .normal)
    }
}
