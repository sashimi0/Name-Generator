//
//  ViewController.swift
//  Name Generator
//
//  Created by sasha on 12/12/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var middleNameLabel: UILabel!
    @IBOutlet weak var GirlorBoyLabel: UILabel!
    @IBOutlet weak var middleNameSwitch: UISwitch!
    @IBOutlet weak var maleFemaleSwitch: UISwitch!
    @IBOutlet weak var anotherNameButton: UIButton!
    var copyGirlNames : NSArray = NSArray()
    var copyBoyNames : NSArray = NSArray()
    
    var isGirl : Int = 1
    var randomBoy : Int = 0
    var randomGirl : Int = 0
        
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let copiedGirlNames: girlNames = girlNames()
        let copiedBoyNames: boyNames = boyNames()
        copyGirlNames = copiedGirlNames.girlnames
        copyBoyNames = copiedBoyNames.boynames
        middleNameSwitch.isOn = false
 
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func AnotherNameAction() {
        
        chooseName()
    }
    
    @IBAction func GirlBoyButtonAction() {
        chooseGirlOrBoy()
        
    }

    func chooseGirlOrBoy(){
        
        if isGirl == 0 {
            GirlorBoyLabel.text = "Girl"
            
        }
        
        if isGirl == 1{
            GirlorBoyLabel.text = "Boy"
          
        }
        
        isGirl = isGirl + 1
        
        if isGirl == 2{
            isGirl = 0
            
        }
        
        chooseName()
    }
    func chooseName(){
        
        if isGirl == 0{
            randomGirl = Int(arc4random_uniform(UInt32(copyGirlNames.count)))
            NameLabel.text = "\(copyGirlNames[randomGirl])"
        }
        
        if isGirl == 1{
            randomBoy = Int(arc4random_uniform(UInt32(copyBoyNames.count)))
            NameLabel.text = "\(copyBoyNames[randomBoy])"
            
        }
        
    }
   
//    Adding switch to enable a second name.
    
    @IBAction func switchuse(_ sender: UISwitch) {
        if (sender.isOn == true) {
            secondName()
            
        }
        else  {
        }
        func secondName(){
            if isGirl == 0{
                randomGirl = Int(arc4random_uniform(UInt32(copyGirlNames.count)))
                middleNameLabel.text = "\(copyGirlNames[randomGirl])"
            }
            
            if isGirl == 1{
                randomBoy = Int(arc4random_uniform(UInt32(copyBoyNames.count)))
                middleNameLabel.text = "\(copyBoyNames[randomBoy])"
            }
        }
        
    }
    
    
        
    
    @IBAction func girlOrBoy(_ sender: Any) {
        
        chooseGirlOrBoy()
    }
    

}


