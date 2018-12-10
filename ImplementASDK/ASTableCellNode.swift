//
//  ASTableCellNode.swift
//  ImplementASDK
//
//  Created by ky on 2018/12/10.
//  Copyright © 2018 yellfun. All rights reserved.
//

import UIKit

class ASTableCellNode: UITableViewCell {
  
  class Generator: NSObject {
    
    
  }
  
  init(withPhoto photo:String) {
    
    super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: "PhotoCell")
    
    let imageview = UIImageView(frame: CGRect(x: 10, y: 10, width: 200, height: 80))
    
    self.addSubview(imageview)
    
    imageview.image = UIImage(named: photo)
  }
  
  required init?(coder aDecoder: NSCoder) {
    
    super.init(coder: aDecoder)
  }
}
