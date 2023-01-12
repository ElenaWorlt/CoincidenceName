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
        performSegue(withIdentifier: "goToResult", sender: nil)
    }
    
}

