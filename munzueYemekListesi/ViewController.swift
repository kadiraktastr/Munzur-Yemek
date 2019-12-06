//
//  ViewController.swift
//  munzueYemekListesi
//
//  Created by Kadir Aktas on 3.12.2019.
//  Copyright © 2019 Kadir Aktas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK:IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    var yemeklerListesi = [yemekListesi]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        veritabaniKopyala()
        tableView.delegate = self
        tableView.dataSource = self
        
       yemeklerListesi =  yemekListesidao().tumYemeklerAl()
            
        
        
        
        
    }

   
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let indeks = sender as? Int
        
        let gidilecekVc = segue.destination as! yemekDetayVC
        gidilecekVc.yemek = yemeklerListesi[indeks!]
        
        
        
    }
    

    func veritabaniKopyala(){
           
           let bundleYolu = Bundle.main.path(forResource: "yemekListesi", ofType: ".db")
           
           let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
           
           
           let fileManager = FileManager.default
           let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("yemekListesi.db")
           
           
           if fileManager.fileExists(atPath: kopyalanacakYer.path){
               
               print("Database Var")
               
               
           }else{
               
               
               do {
                   try fileManager.copyItem(atPath: bundleYolu!, toPath: kopyalanacakYer.path)
                   
               }catch{
               print(error)
               }
               
           }
           
           
       }
    
    
    
    
}

extension ViewController : UITableViewDelegate , UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  yemeklerListesi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let yemek = yemeklerListesi[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tarihCell", for: indexPath) as! tarihlerTableViewCell
        
        cell.tarihLabel.text = yemek.yemek_tarih
        cell.selectionStyle = .none
        
        return cell
        
        
        
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toDetail" , sender: indexPath.row)
    }
    
    
    
    
}
