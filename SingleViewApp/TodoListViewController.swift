//
//  ViewController.swift
//  SingleViewApp
//
//  Created by Zhisheng on 6/10/17.
//  Copyright © 2017 Zhisheng. All rights reserved.
//

import UIKit

class TodoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, TodoComposerViewControllerDelegate, TodoCellDelegate {
  
  var tableView: UITableView?
  
  var todoList = [String]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    navigationItem.title = "Todo list"
    
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAddTodoButton))
    
    self.navigationController?.navigationBar.prefersLargeTitles = true
    navigationItem.largeTitleDisplayMode = .always
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
    return todoList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    var cell: TodoCell? = tableView.dequeueReusableCell(withIdentifier: "custom-cell") as! TodoCell?
      
    if cell == nil {
      cell = TodoCell(style: UITableViewCellStyle.default, reuseIdentifier: "custom-cell")
      cell?.delegate = self
    }
    
    cell?.configure(with: todoList[indexPath.row])
    
    return cell!
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 50
  }
  
  @objc func didTapAddTodoButton(sender: Any) {
    
    let todoComposerViewController = TodoComposerViewController(nibName: nil, bundle: nil)
    todoComposerViewController.delegate = self
    
    self.navigationController?.pushViewController(todoComposerViewController, animated: true)
  }
  
  func composerViewController(_ composerViewController: TodoComposerViewController, didSave todo: String) {
    todoList.insert(todo, at: 0)
    
    tableView?.insertRows(at: [ IndexPath(row:0, section:0) ], with: .automatic)
  }
  
  func todoCellDidTapDelete(_ todoCell: TodoCell) {
    guard let indexPath = tableView?.indexPath(for: todoCell) else {
      return
    }
    
    todoList.remove(at: indexPath.row)
    tableView?.deleteRows(at: [ indexPath ], with: .automatic)
  }
}

