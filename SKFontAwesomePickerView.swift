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

  public var fontAwesomePicker: SKFontAwesomePickerController!

  @IBInspectable public var iconBorderSize: Int = 1 {
    didSet {
      if fontAwesomePicker != nil {
        fontAwesomePicker.collectionView.reloadData()
      }
    }
  }

  @IBInspectable public var iconBorderColor: UIColor = UIColor.black {
    didSet {
      if fontAwesomePicker != nil {
        fontAwesomePicker.collectionView.reloadData()
      }
    }
  }

  @IBInspectable public var iconColor: UIColor = UIColor.black {
    didSet {
      if fontAwesomePicker != nil {
        fontAwesomePicker.collectionView.reloadData()
      }
    }
  }

  @IBInspectable public var iconBorderRadius: Int = 10 {
    didSet {
      if fontAwesomePicker != nil {
        fontAwesomePicker.collectionView.reloadData()
      }
    }
  }

  @IBInspectable public var iconBackgroundColor: UIColor = UIColor.white {
    didSet {
      if fontAwesomePicker != nil {
        fontAwesomePicker.collectionView.reloadData()
      }
    }
  }

  @IBInspectable public var selectedIconBorderSize: Int = 1 {
    didSet {
      if fontAwesomePicker != nil {
        fontAwesomePicker.collectionView.reloadData()
      }
    }
  }

  @IBInspectable public var selectedIconBorderColor: UIColor = UIColor.gray {
    didSet {
      if fontAwesomePicker != nil {
        fontAwesomePicker.collectionView.reloadData()
      }
    }
  }

  @IBInspectable public var selectedIconColor: UIColor = UIColor.white {
    didSet {
      if fontAwesomePicker != nil {
        fontAwesomePicker.collectionView.reloadData()
      }
    }
  }

  @IBInspectable public var selectedIconBorderRadius: Int = 10 {
    didSet {
      if fontAwesomePicker != nil {
        fontAwesomePicker.collectionView.reloadData()
      }
    }
  }

  @IBInspectable public var selectedIconBackgroundColor: UIColor = UIColor.darkGray {
    didSet {
      if fontAwesomePicker != nil {
        fontAwesomePicker.collectionView.reloadData()
      }
    }
  }

  @IBInspectable public var pickerBackgroundColor: UIColor = UIColor.clear {
    didSet {
      if fontAwesomePicker != nil {
        backgroundColor = UIColor.clear
        fontAwesomePicker.view.backgroundColor = UIColor.clear
        fontAwesomePicker.collectionView.backgroundColor = pickerBackgroundColor
      }
    }
  }

  @IBInspectable public var selectedIndex: Int = 0 {
    didSet {
      if fontAwesomePicker != nil {
        fontAwesomePicker.selectedIndex = selectedIndex
        let indexPath = IndexPath(row: fontAwesomePicker.selectedIndex, section: 0)
        fontAwesomePicker.collectionView.reloadData()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
          self.fontAwesomePicker.collectionView.scrollToItem(at: indexPath,
                                                        at: .top,
                                                        animated: true)
        }
      }
    }
  }

  public var didSelectClosure: ((String) -> Void)?

  override public func awakeFromNib() {
    super.awakeFromNib()
    let podBundle = Bundle(for: self.classForCoder)
    if let bundleURL = podBundle.url(forResource: "Controls", withExtension: "bundle") {
      if let bundle = Bundle(url: bundleURL) {
        fontAwesomePicker = (UIStoryboard(name: "SKFontAwesomePicker", bundle: bundle)
          .instantiateViewController(withIdentifier: "SKFontAwesomePickerControllerID") as? SKFontAwesomePickerController)!
        fontAwesomePicker.viewReference = self
        fontAwesomePicker.view.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
        addSubview(fontAwesomePicker.view)
        applyFullScreenContraints(fontAwesomePicker.view)
      }
    }
  }
  
  func applyFullScreenContraints(_ fontAwesomePickerView: UIView) {
    let leading = NSLayoutConstraint(item: fontAwesomePickerView,
                                     attribute: NSLayoutAttribute.leading,
                                     relatedBy: NSLayoutRelation.equal,
                                     toItem: self,
                                     attribute: NSLayoutAttribute.leading,
                                     multiplier: 1,
                                     constant: 0)
    leading.isActive = true
    let top = NSLayoutConstraint(item: fontAwesomePickerView,
                                 attribute: NSLayoutAttribute.top,
                                 relatedBy: NSLayoutRelation.equal,
                                 toItem: self,
                                 attribute: NSLayoutAttribute.top,
                                 multiplier: 1,
                                 constant: 0)
    top.isActive = true
    let bottom = NSLayoutConstraint(item: fontAwesomePickerView,
                                    attribute: NSLayoutAttribute.bottom,
                                    relatedBy: NSLayoutRelation.equal,
                                    toItem: self,
                                    attribute: NSLayoutAttribute.bottom,
                                    multiplier: 1,
                                    constant: 0)
    bottom.isActive = true
    let trailing = NSLayoutConstraint(item: fontAwesomePickerView,
                                      attribute: NSLayoutAttribute.trailing,
                                      relatedBy: NSLayoutRelation.equal,
                                      toItem: self,
                                      attribute: NSLayoutAttribute.trailing,
                                      multiplier: 1,
                                      constant: 0)
    trailing.isActive = true
  }

}
