//
//  ViewController.swift
//  CoincidenceNames
//
//  Created by Елена Душакова on 19.12.2022.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var nameLabelTF: UITextField!
    @IBOutlet weak var partnerLabelTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationVC = segue.destination as? ResultViewController else { return}
    
        destinationVC.firstName = nameLabelTF.text
        destinationVC.secondName = partnerLabelTF.text
        
    }
    

    @IBAction func resultButton() {
        guard let firstName = nameLabelTF.text, let secondName = partnerLabelTF.text else { return }
        if firstName.isEmpty || secondName.isEmpty {
            showAlert(title: "Names are missing", message: "Please enter both names 🌵")
            return
        }
        performSegue(withIdentifier: "goToResult", sender: nil)
        
    }
    
    @IBAction func unwindSegueToFVC (segue: UIStoryboardSegue) {
        
        guard segue.identifier == "unwindSegue" else { return }
        nameLabelTF.text = ""
        partnerLabelTF.text = ""
    }
}

extension FirstViewController{
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .destructive)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
extension FirstViewController: UITextFieldDelegate{
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameLabelTF{
            partnerLabelTF.becomeFirstResponder()
        } else {
            resultButton ()
        }
        return true
    }
}
