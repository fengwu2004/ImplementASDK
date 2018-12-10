//
//  ViewController.swift
//  ImplementASDK
//
//  Created by ky on 2018/12/10.
//  Copyright © 2018 yellfun. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ASTableNodeDelegate {
  
  private var tableNode:ASTableNode!
  
  var photoImages:[String]!
  
  override func viewDidLoad() {
    
    super.viewDidLoad()
    
    tableNode = ASTableNode(frame: self.view.bounds)
    
    tableNode.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    
    self.view.addSubview(tableNode)
    
    photoImages = Bundle.main.paths(forResourcesOfType: "png", inDirectory: "largeimage")
    
    tableNode.queryData(self)
  }
  
  func numerbOfRows(_ node: ASTableNode) -> Int {
    
    return photoImages.count
  }
  
  func cellForRow(_ node: ASTableNode, row: Int) -> ASTableCellNode {
    
    return ASTableCellNode(withPhoto: photoImages[row])
  }
}

