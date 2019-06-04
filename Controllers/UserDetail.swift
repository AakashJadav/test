//
//  UserDetail.swift
//  AJDecode
//
//  Created by Tosc189 on 14/03/19.
//  Copyright © 2019 Tosc189. All rights reserved.
//

import UIKit

class UserDetail: UIViewController {

    @IBOutlet var userdetailTableView: UITableView!
    var userInfos = [UserInfo]()
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.isHidden = false
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        let userDetail = UserInfo()
         userInfos = userDetail.getUserRecords()
        
        DispatchQueue.main.async {
            self.userdetailTableView.reloadData()
        }
        
        for users in userInfos {
            print(users.strName)
            print(users.city)
            print(users.phoneno)
        }
        
//         print(userInfos[0].strName)
//         print(userInfos[0].city)
//        print(userInfos[0].phoneno)
    }
    

   

}


extension UserDetail : UITableViewDelegate , UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userInfos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = userdetailTableView.dequeueReusableCell(withIdentifier:"cell", for: indexPath) as! custcell
        cell.lblcity.text = userInfos[indexPath.row].city
        cell.lblname.text = userInfos[indexPath.row].strName
        cell.lblphone.text = userInfos[indexPath.row].phoneno
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCell.EditingStyle.delete){
            print(indexPath.row)
            let userinfo = UserInfo()
            let status = userinfo.deleteRecordBy(id: userInfos[indexPath.row].userId)
            print(status)
            viewWillAppear(true)
            
        }
    }
    
    
}
