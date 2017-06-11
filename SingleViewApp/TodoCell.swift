//
//  TodoCell.swift
//  SingleViewApp
//
//  Created by Zhisheng on 6/10/17.
//  Copyright © 2017 Zhisheng. All rights reserved.
//

import UIKit

protocol TodoCellDelegate {
  func todoCellDidTapDelete(_ todoCell: TodoCell)
}

class TodoCell : UITableViewCell {
  
  var title: String?
  
  var delegate: TodoCellDelegate?
  
  let titleLabel = UILabel(frame: CGRect.zero)
  
  let deleteButton = UIButton(type: UIButtonType.system)
  
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style:style, reuseIdentifier: reuseIdentifier)
    
    titleLabel.font = UIFont.systemFont(ofSize: 17)
    
    deleteButton.setTitle("Delete", for: UIControlState.normal)
    deleteButton.titleLabel?.font = UIFont.systemFont(ofSize: 17)
    deleteButton.addTarget(self, action: #selector(buttonAction) , for: .touchUpInside)
    
    self.contentView.addSubview(titleLabel)
    self.contentView.addSubview(deleteButton)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public func configure(with title: String) {
    if self.title == title {
      return
    }
    
    self.title = title
    titleLabel.text = self.title
    
    self.setNeedsLayout()
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    titleLabel.frame = CGRect(x: 20, y: 10, width: 200, height: 20)
    
    deleteButton.frame = CGRect(x: self.bounds.size.width - 80, y: 10, width: 60, height: 20)
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    
    self.title = ""
  }
  
  @objc func buttonAction(sender: Any!) {
    delegate?.todoCellDidTapDelete(self)
  }
}
