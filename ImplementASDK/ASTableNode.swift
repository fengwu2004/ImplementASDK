//
//  ASTableNode.swift
//  ImplementASDK
//
//  Created by ky on 2018/12/10.
//  Copyright © 2018 yellfun. All rights reserved.
//

import Foundation
import UIKit

protocol ASTableNodeDelegate: NSObjectProtocol {
  
  func numerbOfRows(_ node:ASTableNode) -> Int
  
  func cellForRow(_ node:ASTableNode, row:Int) -> ASTableCellNodeGenerator
}

class ASTableNode: UIView, UITableViewDelegate, UITableViewDataSource {
  
  private var tableview:UITableView
  
  private weak var delegate:ASTableNodeDelegate!
  
  private var cells = [ASTableCellNodeGenerator]()
  
  required init?(coder aDecoder: NSCoder) {
    
    tableview = UITableView()
    
    super.init(coder: aDecoder)
  }
  
  override init(frame: CGRect) {
    
    tableview = UITableView()
    
    super.init(frame: frame)
    
    tableview.delegate = self
    
    tableview.dataSource = self
    
    tableview.frame = self.bounds
    
    tableview.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    
    self.addSubview(tableview)
  }
  
  func queryData(_ delegate:ASTableNodeDelegate) -> Void {
    
    self.delegate = delegate
    
    let count = self.delegate.numerbOfRows(self)
    
    for i in 0..<count {
      
      let cg = self.delegate.cellForRow(self, row: i)
      
      cells.append(cg)
    }
    
    tableview.reloadData()
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    
    return 100
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    return cells[indexPath.row].node ?? cells[indexPath.row].next()
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return cells.count
  }
}
