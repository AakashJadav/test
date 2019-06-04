//
//  ApiManager.swift
//  FinalDecode
//
//  Created by Tosc189 on 27/02/19.
//  Copyright © 2019 Tosc189. All rights reserved.
//

import UIKit

class ApiManager: NSObject {
    let baseurl = "http://citysurfer.gobe.co/api/application.php?doAction="
    let baseurl2 = "https://jsonplaceholder.typicode.com/"
    var data1  = ["deviceType": "Android", "appVersion": "1.0", "deviceId": "acds2hghs12z", "userId": "150" ]
    
    enum RequestType {
       case GET
       case POST
    }
    
    
    func makeApiRequest(url : String , requestype : RequestType , parameters : [String: Any], completion:@escaping(_ status : Bool , _ message : String , _ data : Any)->()){
        
        let myurl = "\(baseurl2)\(url)"
        
        guard let jsonurl = URL(string: myurl) else {return}
        
        switch requestype {
        case .GET:
            URLSession.shared.dataTask(with: jsonurl) { (data, response, error) in
                guard let data = data else {return}
                
              do{
                  //let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments)
                  completion(true,"Sucess",data)
                }catch let Err {
                    print(Err)
                }
                
                
            }.resume()
        
        case .POST:
            
            var request = URLRequest(url: jsonurl)
            request.httpMethod = "POST"
            request.setValue("Application/json", forHTTPHeaderField:"Content-Type")
            guard let httpbody = try? JSONSerialization.data(withJSONObject: parameters, options: JSONSerialization.WritingOptions.prettyPrinted) else {return}
            request.httpBody = httpbody
            URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
                guard let data = data else {return}
                do  {
                   // let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments)
                    completion(true ,"Success",data)
                }catch let Err {
                    completion(false,"Failed",Err)
                    print(Err)
                }
                
            }).resume()
            
            
//
//        default:
//            break;
        }
        
        
        
        
        
    }
    
    

}
