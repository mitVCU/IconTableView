//
//  IconTableViewCell.swift
//  IconTableView
//
//  Created by Mit Amin on 12/24/21.
//

import UIKit

class IconTableViewCell: UITableViewCell {
    static let identifier = "IconTableViewCell"
    
    func setIcon(place: PlaceType) {
        let mask = IconView(frame: frame, place: place)
        self.contentView.mask = mask.createMask()
    }
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}
