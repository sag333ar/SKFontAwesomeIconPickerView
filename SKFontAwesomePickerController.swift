//
//  SKFontAwesomePicker.swift
//  SKFontAwesome
//
//  Created by Kothari, Sagar on 11/13/17.
//  Copyright © 2017 Kothari, Sagar. All rights reserved.
//

import UIKit

public class SKFontAwesomePickerController: UIViewController {

  public var selectedIndex = 0
  @IBOutlet var collectionView: UICollectionView!
  public var viewReference: SKFontAwesomePickerView!

  override public func viewDidLoad() {
    super.viewDidLoad()
  }

  public let fontAwesomeIconsArray = ["", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""]
}

extension SKFontAwesomePickerController: UICollectionViewDataSource, UICollectionViewDelegate {

  public func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }

  public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return fontAwesomeIconsArray.count
  }

  public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SKFontAwesomeCell", for: indexPath)
    applyCustomization(cell, indexPath: indexPath)
    return cell
  }

  private func applyCustomization(_ cell: UICollectionViewCell, indexPath: IndexPath) {
    if let label = cell.viewWithTag(1) as? UILabel {
      label.text = fontAwesomeIconsArray[indexPath.row]
      if indexPath.row == selectedIndex {
        label.layer.borderWidth = CGFloat(viewReference.selectedIconBorderSize)
        label.layer.borderColor = viewReference.selectedIconBorderColor.cgColor
        label.textColor = viewReference.selectedIconColor
        label.layer.cornerRadius =  CGFloat(viewReference.selectedIconBorderRadius)
        label.backgroundColor = viewReference.selectedIconBackgroundColor
      } else {
        label.layer.borderWidth = CGFloat(viewReference.iconBorderSize)
        label.layer.borderColor = viewReference.iconBorderColor.cgColor
        label.textColor = viewReference.iconColor
        label.layer.cornerRadius =  CGFloat(viewReference.iconBorderRadius)
        label.backgroundColor = viewReference.iconBackgroundColor
      }
    }
  }

  public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    collectionView.deselectItem(at: indexPath, animated: true)
    selectedIndex = indexPath.row
    collectionView.reloadData()
    viewReference.didSelectClosure?(fontAwesomeIconsArray[indexPath.row])
  }

}
