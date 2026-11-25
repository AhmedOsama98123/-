//
//  MyCell.swift
//  SecondCompostional
//
//  Created by TaqieAllah on 30/07/2026.
//

import UIKit

class MyCell: UICollectionViewCell {
    @IBOutlet weak var myLbl : UILabel!
    static let identifier : String = "MyCell"
    static func nib() -> UINib {
        return UINib(nibName: "MyCell", bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        myLbl.textAlignment = .center
        contentView.backgroundColor = .yellow
    }

}
