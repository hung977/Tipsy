//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by admin on 10/21/19.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var result: String?
    var people: String?
    var tip: String?

    @IBOutlet weak var totalLable: UILabel!
    @IBOutlet weak var settingLable: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLable.text = result
        let tipValue = String(format: "%.0f", (Float(tip!)! * 100))
        settingLable.text = "Split between \(people!) people, with \(tipValue)% tip."
        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
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
