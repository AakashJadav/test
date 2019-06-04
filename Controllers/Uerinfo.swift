//
//  Uerinfo.swift
//  AJDecode
//
//  Created by Tosc189 on 14/03/19.
//  Copyright © 2019 Tosc189. All rights reserved.
//

import UIKit

class Uerinfo: UIViewController {

    var dbManager : DbManager!
    var myuser : UserInfo!
    @IBOutlet var txtname: UITextField!
    @IBOutlet var txtphone: UITextField!
    @IBOutlet var txtcity: UITextField!
    
    @IBOutlet var txtuserId: UITextField!
    @IBOutlet var txtsearchname: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        dbManager = DbManager()
       
        // Do any additional setup after loading the view.
    }
    
    @IBAction func dispAction(_ sender: Any) {
        
        let userDetail = self.storyboard?.instantiateViewController(withIdentifier:"userdetail") as! UserDetail
        self.navigationController?.pushViewController(userDetail, animated: true)
        
    }
    
    @IBAction func btnSearchAction(_ sender: Any) {
        
        let myuserinfo = UserInfo()
        myuser = myuserinfo.getuserByName(txtsearchname.text!)
        
        if myuser != nil{
            txtname.text = myuser.strName
            txtcity.text = myuser.city
            txtphone.text = myuser.phoneno
            txtuserId.text = "\(myuser.userId)"
        }
        
    }
    
    @IBAction func upadateBtnAction(_ sender: Any) {
        
        let myuserinfo = UserInfo()
        myuserinfo.strName = txtname.text!
        myuserinfo.city = txtcity.text!
        myuserinfo.phoneno = txtphone.text!
        myuserinfo.userId = txtuserId.text!
        let status : Bool = myuserinfo.updateRecords(myuserinfo)
        
        if status {
            print("record updated")
        }
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
         self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func saveDatAction(_ sender: Any) {
        
//        if (!txtname.text!.isEmpty && !txtcity.text!.isEmpty && txtphone.text!.isEmpty)
//        {
            let myuserinfo = UserInfo()
            myuserinfo.strName = txtname.text!
            myuserinfo.city = txtcity.text!
            myuserinfo.phoneno = txtphone.text!
            let status  : Bool =  myuserinfo.insertRecord(myuserinfo)
            if status {
                print("record inserted successfully")
            }
            else {
                print("error")
            }
            
//        }
        
        
        
        
    }
    

}
