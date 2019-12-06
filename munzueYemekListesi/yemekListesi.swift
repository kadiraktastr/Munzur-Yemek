//
//  yemekListesi.swift
//  munzueYemekListesi
//
//  Created by Kadir Aktas on 3.12.2019.
//  Copyright © 2019 Kadir Aktas. All rights reserved.
//

import Foundation
class yemekListesi {
          
    var yemek_id :Int?
    var yemek_tarih : String?
    var yemek_1 : String?
    var yemek_2 : String?
    var yemek_3 : String?
    var yemek_4 : String?

    
    init() {
        
    }
    
    init(yemek_id :Int ,yemek_tarih : String , yemek_1 : String , yemek_2 : String , yemek_3 : String ,yemek_4 : String) {
        
        
        
        self.yemek_id = yemek_id
        self.yemek_tarih = yemek_tarih
        self .yemek_1 = yemek_1
        self .yemek_2 = yemek_2
        self .yemek_3 = yemek_3
        self .yemek_4 = yemek_4
        
    }
    
    
}
