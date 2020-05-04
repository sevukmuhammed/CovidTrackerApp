//
//  ViewController3.swift
//  Covid
//
//  Created by user on 4/23/20.
//  Copyright © 2020 Muhammed Sevuk. All rights reserved.
//

import UIKit

class ViewController3: UIViewController {

    @IBOutlet weak var southAmericaButton: UIButton!
    @IBOutlet weak var europeButton: UIButton!
    @IBOutlet weak var africaButton: UIButton!
    @IBOutlet weak var asiaButton: UIButton!
    @IBOutlet weak var australiaButton: UIButton!
    @IBOutlet weak var northAmericaButton: UIButton!
    var name = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func asiaButtonClicked(_ sender: Any) {
        self.name = "Asia"
        performSegue(withIdentifier: "name", sender: self)
    }
    @IBAction func africaButtonClicked(_ sender: Any) {
        self.name = "Africa"
        performSegue(withIdentifier: "name", sender: self)
    }
    @IBAction func europeButtonClicked(_ sender: Any) {
        self.name = "Europe"
        performSegue(withIdentifier: "name", sender: self)
    }
    @IBAction func australiaButtonClicked(_ sender: Any) {
        self.name = "Oceania"
        performSegue(withIdentifier: "name", sender: self)
    }
    @IBAction func northAmericaButtonClicked(_ sender: Any) {
        self.name = "North America"
        performSegue(withIdentifier: "name", sender: self)
    }
    @IBAction func southAmericaButtonClicked(_ sender: Any) {
        self.name = "South America"
        performSegue(withIdentifier: "name", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var vc = segue.destination as! ViewController5
        vc.continentName = self.name
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
