//
//  ReferenceVC.swift
//  SecondCompostional
//
//  Created by TaqieAllah on 30/07/2026.
//

import UIKit

class ReferenceVC: UIViewController {
    var items = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40"]
    var collectionView: UICollectionView!   // plain var, not @IBOutlet

    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 100)

        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = .gray
        view.addSubview(collectionView)   // add it AFTER creating it
        collectionView.register(MyCell.nib(), forCellWithReuseIdentifier: MyCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }


}
extension ReferenceVC : UICollectionViewDelegate , UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCell.identifier, for: indexPath) as! MyCell
        cell.myLbl.text = self.items[indexPath.row]
        
        cell.backgroundColor = .yellow
        return cell
    }
}
