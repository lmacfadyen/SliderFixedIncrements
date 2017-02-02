//
//  ViewController.swift
//  SliderFixedIncrements
//
//  Created by Lawrence F MacFadyen on 2017-02-01.
//
//

import UIKit

enum FilterMode:Float {
    case silver = 0.0
    case all = 5.0
    case gold = 10.0
}

class ViewController: UIViewController {
    
    @IBOutlet weak var labelCurrentValue: UILabel!
    @IBOutlet weak var sliderFilter: UISlider!
    @IBOutlet weak var imageViewProducts: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        handleFilter()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func sliderChanged(_ sender: AnyObject) {
        // Restrict slider to a fixed value
        let fixed = roundf(sender.value / 5.0) * 5.0;
        sender.setValue(fixed, animated: true)
        
        handleFilter()
    }
    
    func handleFilter()
    {
        guard let mode = FilterMode(rawValue: sliderFilter.value) else {
            // You might do something different in a real app
            labelCurrentValue.text = "All"
            displayImage(name: "all.jpg")
            return
        }
        
        switch mode {
        case FilterMode.silver:
            labelCurrentValue.text = "Silver"
            displayImage(name: "silver.jpg")
        case FilterMode.all:
            labelCurrentValue.text = "All"
            displayImage(name: "all.jpg")
        case FilterMode.gold:
            labelCurrentValue.text = "Gold"
            displayImage(name: "gold.jpg")
        }
    }
    
    func displayImage(name:String)
    {
        guard let image = UIImage(named: name) else {
            imageViewProducts?.image = nil
            return
        }
        imageViewProducts?.image = image
    }


}

