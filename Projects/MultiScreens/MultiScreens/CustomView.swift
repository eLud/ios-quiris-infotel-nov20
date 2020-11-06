//
//  CustomView.swift
//  MultiScreens
//
//  Created by Ludovic Ollagnier on 06/11/2020.
//

import UIKit

class CustomView: UIView {

    @IBOutlet var contentView: UIView?

    override init(frame: CGRect) { // Utilisé si init par le code
        super.init(frame: frame)
        common()
    }

    required init?(coder: NSCoder) { // Utilisé si init par le storyboard
        super.init(coder: coder)
        common()
    }

    func common() {
        self.backgroundColor = .red

        let textField = UITextField()
        let label = UILabel()

        self.addSubview(textField)
        self.addSubview(label)

        //Rajouter des constraints

    }

}
