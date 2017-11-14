//
//  SKFontAwesomePickerView.swift
//  SKFontAwesome
//
//  Created by Kothari, Sagar on 11/13/17.
//  Copyright © 2017 Kothari, Sagar. All rights reserved.
//

import UIKit

@IBDesignable
public class SKFontAwesomePickerView: UIView {

  private var fontAwesomePicker: SKFontAwesomePickerController!

  @IBInspectable public var iconBorderSize: Int = 1 {
    didSet {
      fontAwesomePicker.collectionView.reloadData()
    }
  }

  @IBInspectable public var iconBorderColor: UIColor = UIColor.black {
    didSet {
      fontAwesomePicker.collectionView.reloadData()
    }
  }

  @IBInspectable public var iconColor: UIColor = UIColor.black {
    didSet {
      fontAwesomePicker.collectionView.reloadData()
    }
  }

  @IBInspectable public var iconBorderRadius: Int = 10 {
    didSet {
      fontAwesomePicker.collectionView.reloadData()
    }
  }

  @IBInspectable public var iconBackgroundColor: UIColor = UIColor.white {
    didSet {
      fontAwesomePicker.collectionView.reloadData()
    }
  }

  @IBInspectable public var selectedIconBorderSize: Int = 1 {
    didSet {
      fontAwesomePicker.collectionView.reloadData()
    }
  }

  @IBInspectable public var selectedIconBorderColor: UIColor = UIColor.gray {
    didSet {
      fontAwesomePicker.collectionView.reloadData()
    }
  }

  @IBInspectable public var selectedIconColor: UIColor = UIColor.white {
    didSet {
      fontAwesomePicker.collectionView.reloadData()
    }
  }

  @IBInspectable public var selectedIconBorderRadius: Int = 10 {
    didSet {
      fontAwesomePicker.collectionView.reloadData()
    }
  }

  @IBInspectable public var selectedIconBackgroundColor: UIColor = UIColor.darkGray {
    didSet {
      fontAwesomePicker.collectionView.reloadData()
    }
  }
  
  public var didSelectClosure: ((String) -> Void)?

  override public func awakeFromNib() {
    super.awakeFromNib()
    let bundle = Bundle(for: type(of: self))
    fontAwesomePicker = (UIStoryboard(name: "SKFontAwesomePicker", bundle: bundle)
      .instantiateViewController(withIdentifier: "SKFontAwesomePickerControllerID") as? SKFontAwesomePickerController)!
    fontAwesomePicker.viewReference = self
    fontAwesomePicker.view.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
    addSubview(fontAwesomePicker.view)
    let leading = NSLayoutConstraint(item: fontAwesomePicker.view,
                       attribute: NSLayoutAttribute.leading,
                       relatedBy: NSLayoutRelation.equal,
                       toItem: self,
                       attribute: NSLayoutAttribute.leading,
                       multiplier: 1,
                       constant: 0)
    leading.isActive = true
    let top = NSLayoutConstraint(item: fontAwesomePicker.view,
                                     attribute: NSLayoutAttribute.top,
                                     relatedBy: NSLayoutRelation.equal,
                                     toItem: self,
                                     attribute: NSLayoutAttribute.top,
                                     multiplier: 1,
                                     constant: 0)
    top.isActive = true
    let bottom = NSLayoutConstraint(item: fontAwesomePicker.view,
                                 attribute: NSLayoutAttribute.bottom,
                                 relatedBy: NSLayoutRelation.equal,
                                 toItem: self,
                                 attribute: NSLayoutAttribute.bottom,
                                 multiplier: 1,
                                 constant: 0)
    bottom.isActive = true
    let trailing = NSLayoutConstraint(item: fontAwesomePicker.view,
                                    attribute: NSLayoutAttribute.trailing,
                                    relatedBy: NSLayoutRelation.equal,
                                    toItem: self,
                                    attribute: NSLayoutAttribute.trailing,
                                    multiplier: 1,
                                    constant: 0)
    trailing.isActive = true
  }

}
