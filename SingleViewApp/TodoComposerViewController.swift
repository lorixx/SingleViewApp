//
//  TodoComposerViewController.swift
//  SingleViewApp
//
//  Created by Zhisheng on 6/11/17.
//  Copyright © 2017 Zhisheng. All rights reserved.
//

import UIKit

protocol TodoComposerViewControllerDelegate : NSObjectProtocol {
  
  func composerViewController(_ composerViewController: TodoComposerViewController, didSave todo: String)
}

class TodoComposerViewController : UIViewController {
  
  let textView = UITextView(frame: .zero, textContainer: nil)
  
  var delegate: TodoComposerViewControllerDelegate?
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    textView.layer.borderWidth = 1
    textView.layer.borderColor = UIColor.gray.cgColor
    textView.layer.cornerRadius = 6.0
    view.addSubview(textView)
    
    self.view.backgroundColor = .white
    self.navigationItem.title = "Create Todo"
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapSaveButton))
    navigationItem.largeTitleDisplayMode = .never
  }
  
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    
    textView.frame = CGRect(x: 20, y: 20 + view.safeAreaInsets.top, width: view.bounds.size.width - 40, height: 100)
  }
  
  @objc func didTapSaveButton(sender: Any) {
    delegate?.composerViewController(self, didSave: textView.text)
    
    self.navigationController?.popViewController(animated: true)
  }
}
