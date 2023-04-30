//
//  ViewController.swift
//  NewsReaderApp
//
//  Created by Fadilla Nurhidayah on 27/04/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var emailTittleLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTittleLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTittleLabel.text = "Surel"
        emailTextField.placeholder = "surel@pengguna.com"
        passwordTextField.text = "Kata Sandi"
        passwordTextField.placeholder = "Rahasia"
        loginButton.setTitle("Masuk", for: UIControl.State.normal)
        loginButton.layer.cornerRadius = 4
        
        
        ApiService.shared.loadLatestNews { result in
            switch result {
            case.success(let newsList):
                print(newsList)
                self.emailTextField.text = "Num Result: \(newsList.count)"
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    @IBAction func loginButtonTapped(_ sender: Any) {
        print("Email: \(emailTextField.text ?? "-")")
    }
    
}
