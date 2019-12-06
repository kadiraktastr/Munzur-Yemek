//
//  yemekDetayVC.swift
//  munzueYemekListesi
//
//  Created by Kadir Aktas on 3.12.2019.
//  Copyright © 2019 Kadir Aktas. All rights reserved.
//

import UIKit

class yemekDetayVC: UIViewController {

    //MARK:IBOutlets
    @IBOutlet weak var yemek1Label: UILabel!
    
    @IBOutlet weak var yemek2Label: UILabel!
    
    @IBOutlet weak var yemek3Label: UILabel!
    
    @IBOutlet weak var yemek4Label: UILabel!
    
    var yemek:yemekListesi?
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let y  = yemek {
            yemek1Label.text = y.yemek_1
            yemek2Label.text = y.yemek_2
            yemek3Label.text = y.yemek_3
            yemek4Label.text = y.yemek_4
            
        }

    }
    

}
