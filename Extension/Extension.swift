//
//  Extension.swift
//  FinalDecode
//
//  Created by Tosc189 on 27/02/19.
//  Copyright © 2019 Tosc189. All rights reserved.
//

import Foundation
import UIKit

extension ViewController {
    
    func activityIndicatorView(frame : CGRect = UIScreen.main.bounds) -> UIView{
        let viewindicator = UIView(frame: frame)
        viewindicator.backgroundColor =  UIColor.black.withAlphaComponent(0.6)
        let act = UIActivityIndicatorView(style: .whiteLarge)
        act.startAnimating()
        act.center = viewindicator.center
        viewindicator.addSubview(act)
        return viewindicator
    }
    
}


extension UIImageView {
    public func imageFromServerURL(urlString: String) {
        self.image = nil
        URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in
            DispatchQueue.main.async(execute: { () -> Void in
                if let dat = data{
                    if let image = UIImage(data: dat){
                        self.image = image
                    }
                }
            })
                
        }).resume()
    }}
