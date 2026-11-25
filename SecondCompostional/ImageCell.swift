//
//  ImageCell.swift
//  SecondCompostional
//
//  Created by TaqieAllah on 29/07/2026.
//

import UIKit

class ImageCell: UICollectionViewCell {
    static let identifier : String = "ImageCell"
    static func nib() -> UINib{
        return UINib(nibName: "ImageCell", bundle: nil)
    }
    @IBOutlet weak var cellImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
