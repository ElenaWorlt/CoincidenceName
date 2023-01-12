//
//  ResultViewController.swift
//  CoincidenceNames
//
//  Created by Елена Душакова on 19.12.2022.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var namesLabel: UILabel!
    @IBOutlet weak var resultInProcentLabel: UILabel!
    @IBOutlet var progressLabel: UIView!
    
    var firstName: String!
    var secondName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        namesLabel.text = "\(firstName ?? "") and \(secondName ?? "" )"

    }
    

}
