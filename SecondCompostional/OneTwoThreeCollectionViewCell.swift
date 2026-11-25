//
//  OneTwoThreeCollectionViewCell.swift
//  SecondCompostional
//
//  Created by TaqieAllah on 30/07/2026.
//

import UIKit

class OneTwoThreeCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "OneTwoThreeCollectionViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "OneTwoThreeCollectionViewCell", bundle: nil)
    }
    
    @IBOutlet weak var cellLbl: UILabel!
    @IBOutlet weak var backGroundView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        cellLbl.textAlignment = .center
        
    }
  
    
}
