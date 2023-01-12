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
    @IBOutlet weak var progressLabel: UIProgressView!
    
    var firstName: String!
    var secondName: String!
    
    private var resultValue = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        namesLabel.text = "\(firstName ?? "") and \(secondName ?? "" )"
        
        resultValue = findResult()
        if #available(iOS 15.0, *) {
            resultInProcentLabel.text = resultValue.formatted(.percent)
        } else {
            // Fallback on earlier versions
        }
        progressLabel.progress = Float(resultValue) / 100
        progressLabel.transform = progressLabel.transform.scaledBy(x: 1, y: 4)
    }
    
    
    private func findValue(for name: String) -> Int {
        var count = 0
        
        for character in name.lowercased() {
            switch character{
            case "a", "i", "j", "q", "y":
                count += 1
            case "b", "k", "r":
                count += 2
            case "c", "g", "l", "s":
                count += 3
            case "d", "m", "t":
                count += 4
            case "e", "h", "n", "x":
                count += 5
            case "u", "v", "w":
                count += 6
            case "o", "z", "f", "p":
                count += 7
            default:
              count += 0
            }
        }
        return count
    }

    private func findResult() -> Int {
        var result = 0
        
        let firstValue = findValue(for: firstName)
        let secondValue = findValue(for: secondName)
        let differenceBetweenValue = abs(firstValue - secondValue)
        
        switch differenceBetweenValue{
        case 0, 1, 2:
            result = 100
        case 3, 4:
            result = 65
        case 5:
            result = 50
        case 6:
            result = 30
        default:
            result = 20
    
        }
        return result
    }
    
}
