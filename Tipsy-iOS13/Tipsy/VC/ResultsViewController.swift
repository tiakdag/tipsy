//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Timur Akdag on 4/5/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    var total: String?
    var tipPercentage: String?
    var numPeople: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = total ?? "0"
        settingsLabel.text = "Split between \(numPeople!) people, with \(tipPercentage!) tip."
        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculatePressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
