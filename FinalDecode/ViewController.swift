//
//  ViewController.swift
//  FinalDecode
//
//  Created by Tosc189 on 27/02/19.
//  Copyright © 2019 Tosc189. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
    @IBOutlet var myTablView: UITableView!
    var myposts = [Post]()
    var myusers = [UserDetails]()
    var mytcikets : tickets?
    var mycomments = [Comments]()
    var activityIndicator : UIView?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func addActiVityIndicator(){
       removeIndicator()
       activityIndicator = self.activityIndicatorView(frame: self.view.bounds)
       self.view.addSubview(activityIndicator!)
    }
    
    func removeIndicator(){
        if activityIndicator != nil {
            activityIndicator?.removeFromSuperview()
            activityIndicator = nil
        }
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        addActiVityIndicator()
        let AH = ApiManager()
        AH.makeApiRequest(url:"posts", requestype: .GET, parameters: [:]) { (Sucess, Message, data) in
        if (Sucess) {
                guard let data = data as? Data else {return}
                self.mycomments = try! JSONDecoder().decode([Comments].self, from: data)
                self.myposts = try! JSONDecoder().decode([Post].self, from: data)
                DispatchQueue.main.async {
                    self.removeIndicator()
                }
                print(self.myposts[0].title ?? "")
               }
            }
         }

}


extension ViewController : UITableViewDelegate , UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.mytcikets?.ticketList.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTablView.dequeueReusableCell(withIdentifier:"cell", for: indexPath) as! custcell
      //  cell.lblTicketId.text = mytcikets?.ticketList[indexPath.row]?.ticketId
       // cell.lblTicketName.text = mytcikets?.ticketList[indexPath.row]?.ticketName
       // cell.lblProductName.text = mytcikets?.ticketList[indexPath.row]?.productName
        //cell.imageView?.imageFromServerURL(urlString: self.mytcikets?.ticketList[indexPath.row]?.imageUrlList! ?? "")
        return cell
    }
   
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 141
    }
    
}

