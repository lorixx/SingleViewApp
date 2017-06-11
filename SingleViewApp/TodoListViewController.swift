//
//  ViewController.swift
//  SingleViewApp
//
//  Created by Zhisheng on 6/10/17.
//  Copyright © 2017 Zhisheng. All rights reserved.
//

import UIKit

class TodoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
  var tableView: UITableView?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    navigationItem.title = "Todo list"
    
    self.navigationController?.navigationBar.prefersLargeTitles = true
  }
  
  override func loadView() {
    super.loadView()
    
    tableView = UITableView(frame: CGRect.zero, style: UITableViewStyle.plain)
    tableView?.separatorStyle = .none
    tableView?.dataSource = self
    tableView?.delegate = self
    
    view.addSubview(tableView!)
  }
  
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    
    tableView?.frame = CGRect(x: view.frame.origin.x, y: view.safeAreaInsets.top, width: view.bounds.size.width, height: view.bounds.size.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom)
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 20
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    var cell: TodoCell? = tableView.dequeueReusableCell(withIdentifier: "custom-cell") as! TodoCell?
      
    if cell == nil {
      cell = TodoCell(style: UITableViewCellStyle.default, reuseIdentifier: "custom-cell")
    }
    
    cell?.configure(with: String(indexPath.row))
    
    return cell!
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 50
  }
}

