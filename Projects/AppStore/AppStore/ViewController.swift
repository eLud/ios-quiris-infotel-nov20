//
//  ViewController.swift
//  AppStore
//
//  Created by Ludovic Ollagnier on 06/11/2020.
//

import UIKit
import SwiftyJSON
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var noteLabel: UILabel!
    @IBOutlet weak var appSubtitleLabel: UILabel!
    @IBOutlet weak var interLabelConstraint: NSLayoutConstraint!
    @IBOutlet weak var appAgeLabel: UILabel!

    @IBOutlet weak var appIconImageview: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showHide(_ sender: Any) {

//        self.view.shake()

        appSubtitleLabel.isHidden.toggle()
        noteLabel.isHidden.toggle()

        if noteLabel.isHidden {
            interLabelConstraint.constant = -20
        } else {
            interLabelConstraint.constant = 8
        }

        UIView.animate(withDuration: 0.4) {
//            self.appIconImageview.isHidden.toggle()
//
//            self.appIconImageview.transform = CGAffineTransform(translationX: self.appIconImageview.isHidden ? -100 : 0, y: 0)

            self.view.layoutIfNeeded()
        }

    }

    @IBAction func getApp(_ sender: Any) {

        let app = App(name: "Méditer avec Petit BamBou", subtitle: "Méditation & sommeil", keywords: ["Méditation", "bien-être", "bambou"], categorie: .lifestyle, note: 5, minAge: 4, haveInAppPurchases: true)

        let encoder = JSONEncoder()
//        encoder.keyEncodingStrategy = .convertToSnakeCase
        encoder.dateEncodingStrategy = .secondsSince1970

        guard let data = try? encoder.encode([app]) else {
            return
        }
        print(String(data: data, encoding: .utf8)!)

        let decoder = JSONDecoder()
//        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .secondsSince1970

        do {
            let appArray = try decoder.decode([App].self, from: data)
            print(appArray)
        } catch {
            print(error)
        }

        // Codable qui utilise JSONSerializer (pur Swift)
        // JSONSerialization inclus dans l'OS (Objective-C) : ne marche qu'avec des classes
        // Lib tierces

        guard let json = try? JSON(data: data) else { return }
        if let appName = json[0]["name"].string {
            print(appName)
        }

        let webView = WKWebView() //UIWebView
        webView.frame = CGRect(x: 0, y: 0, width: 300, height: 600)
        webView.uiDelegate = self
        webView.navigationDelegate = self
        self.view.addSubview(webView)
        let request = URLRequest(url: URL(string: "https://www.apple.com")!)
        webView.load(request)
    }
}

extension ViewController: WKUIDelegate {
    
}

extension ViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {

        decisionHandler(.allow)
    }
}

extension UIView {

    func appear(_ duration: TimeInterval) {

    }

    func shake() {
        UIView.animateKeyframes(withDuration: 0.5, delay: 0, options: []) {

            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.25) {
                self.transform = CGAffineTransform(translationX: -10, y: 0)
            }

            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25) {
                self.transform = CGAffineTransform(translationX: 10, y: 0)
            }

            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.25) {
                self.transform = CGAffineTransform(translationX: -10, y: 0)
            }

            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25) {
                self.transform = CGAffineTransform.identity
            }

        } completion: { (completed) in

        }

    }
}
