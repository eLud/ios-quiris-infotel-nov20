//
//  ViewController.swift
//  DemoUI
//
//  Created by Ludovic Ollagnier on 05/11/2020.
//

import UIKit

class ViewController: UIViewController {

    //var qui référence les objets graphiques : Outlet
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var sayHelloButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }


    //functions qui s'executent au besoin : Actions
    @IBAction func sayHello(_ sender: UIButton) {
        guard let name = nameTextField.text else { return }
        helloLabel.text = "Hello \(name)"

    }

}

