//
//  ViewController.swift
//  MultiScreens
//
//  Created by Ludovic Ollagnier on 06/11/2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var activity: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        let customButton = UIButton.styledButton()
        customButton.frame = CGRect(x: 100, y: 100, width: 150, height: 30)

        self.view.addSubview(customButton)

        loginButton.stylize()
    }

    @IBAction func logIn(_ sender: UIButton) {

        //Lancer ma requete
        activity.startAnimating()

        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(1000)) {
            //Retour requete

            self.performSegue(withIdentifier: "loggedIn", sender: sender)

//            let seconSto = UIStoryboard(name: "SecondStoryboard", bundle: nil)
//            guard let controller = seconSto.instantiateInitialViewController() else { return }
//            self.present(controller, animated: true, completion: nil) // presentModaly
//            self.navigationController?.pushViewController(controller, animated: true) // Show

            self.activity.stopAnimating()
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Appelée juste avant l'éxécution d'un segue
        // Appelée pour TOUS les segues qui s'executent
        print("prepare")
        if segue.identifier == "loggedIn" {

            guard let destination = segue.destination as? RedViewController else { fatalError("Wrong controller for segue loggedIn. Should be RedViewController") }
            destination.userIsLoggedIn = true

        } else if segue.identifier == "green" {
            let destination = segue.destination
            destination.title = "Green"
        }
    }

}

