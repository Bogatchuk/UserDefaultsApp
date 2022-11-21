//
//  ViewController.swift
//  UserDefaultsApp
//
//  Created by Roma Bogatchuk on 21.11.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var seconNameTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var userNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let userName = UserDefaults.standard.string(forKey: "userName"){
            userNameLabel.text = userName
        }else{
            userNameLabel.text = "User Name"
        }
    }

    @IBAction func donePressed(_ sender: UIButton) {
        guard let firstName = firstNameTextField.text, !firstName.isEmpty else {
            wrongAlert()
            return
        }
        
        guard let seconName = seconNameTextField.text, !seconName.isEmpty else {
            wrongAlert()
            return
        }
        
        if let _ = Double(firstName){
            wrongAlert()
        }else if let _ = Double(seconName){
            wrongAlert()
        }else {
            userNameLabel.text = firstName + " " + seconName
            UserDefaults.standard.set(userNameLabel.text, forKey: "userName")
        }
        
    }
    
    private func wrongAlert(){
        let aler = UIAlertController(title: "Wrong Format!", message: "Please enter your name", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Cancel", style: .destructive)
        
        aler.addAction(alertAction)
        present(aler, animated: true)
    }
    
}

