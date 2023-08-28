//
//  RegisterViewController.swift
//  PrayerDiary
//
//  Created by Youngmin Cho on 8/22/23.
//

import UIKit
import PMSuperButton

class RegisterPartnerViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var nextButton: PMSuperButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupTextField()
    }
    
    private func setupTextField() {
        self.nameTextField.delegate = self
        self.nameTextField.tag = 0
        
        self.idTextField.delegate = self
        self.idTextField.tag = 1
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
          if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
             nextField.becomeFirstResponder()
          } else {
             textField.resignFirstResponder()
          }
        
          return false
       }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        guard let name = self.nameTextField.text,
              let id = self.idTextField.text else { return }
        
        UserDefaults.standard.setValue(name, forKey: "partnerName")
        Manager.shared.setPartnerName(partnerName: name)
        
        UserDefaults.standard.setValue(id, forKey: "partnerID")
        Manager.shared.setPartnerID(partnerID: id)
        
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "prayerlist_segue2", sender: nil)
        }
    }
}
