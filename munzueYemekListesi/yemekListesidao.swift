//
//  yemekListesidao.swift
//  munzueYemekListesi
//
//  Created by Kadir Aktas on 3.12.2019.
//  Copyright © 2019 Kadir Aktas. All rights reserved.
//

import Foundation
class yemekListesidao{
    
    let db : FMDatabase?
       
       init() {   let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
       
       let veriTabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("yemekListesi.db")
       
       
       db = FMDatabase(path: veriTabaniURL.path)
       }
    
    
    func tumYemeklerAl () -> [yemekListesi] {
        var liste = [yemekListesi]()
        db?.open()
        do {
            let rs = try db!.executeQuery("SELECT * FROM yemekListesi", values: nil)
            
            while rs.next() {
                var gelen = yemekListesi(yemek_id: Int(rs.string(forColumn: "yemek_id")!)!
                    , yemek_tarih: rs.string(forColumn: "yemek_tarih")!
                    ,yemek_1: rs.string(forColumn: "yemek_1")!
                    , yemek_2: rs.string(forColumn: "yemek_2")!
                    , yemek_3: rs.string(forColumn: "yemek_3")!
                    , yemek_4: rs.string(forColumn: "yemek_4")!)
                liste.append(gelen)
            }
            
            
        } catch  {
            print(error.localizedDescription)
        }
        
        
        db?.close()
        
        return liste
    }
    
    
    
}
