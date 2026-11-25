//
//  OneTwoThreeViewController.swift
//  SecondCompostional
//
//  Created by TaqieAllah on 30/07/2026.
//

import UIKit

class OneTwoThreeViewController: UIViewController {
    var arrLbl = [ArrLbl]()
    @IBOutlet var collectionView : UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeMyCollectionView()

    }
    func customizeMyCollectionView() {
        collectionView.register(OneTwoThreeCollectionViewCell.nib(), forCellWithReuseIdentifier: OneTwoThreeCollectionViewCell.identifier
        )
        let cellSize = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height/3)
        OneTwoThreeCollectionViewCell(frame: cellSize)
        collectionView.delegate = self
        collectionView.dataSource = self
        arrLbl.append(ArrLbl(lbl: "ahmed"))
        arrLbl.append(ArrLbl(lbl: "osama"))
        arrLbl.append(ArrLbl(lbl: "esraa"))
        arrLbl.append(ArrLbl(lbl: "asosa"))
        arrLbl.append(ArrLbl(lbl: "ahmed"))
        arrLbl.append(ArrLbl(lbl: "osama"))
        arrLbl.append(ArrLbl(lbl: "esraa"))
        arrLbl.append(ArrLbl(lbl: "asosa"))
        collectionView.collectionViewLayout = UICollectionViewCompositionalLayout(section: malingTheSection())

    }
    func malingTheSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.3))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let innerGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(0.3))
        let leftGroup = NSCollectionLayoutGroup.vertical(layoutSize: innerGroupSize, subitems: [item])
        let rightGroup = NSCollectionLayoutGroup.vertical(layoutSize: innerGroupSize, subitems: [item])
        let mainGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.3))
        let mainGroup = NSCollectionLayoutGroup.horizontal(layoutSize: mainGroupSize, subitems: [leftGroup, rightGroup])
        let section = NSCollectionLayoutSection(group: mainGroup)
        return section
    }


}



extension OneTwoThreeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrLbl.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OneTwoThreeCollectionViewCell.identifier, for: indexPath) as! OneTwoThreeCollectionViewCell
        if indexPath.row == 0 {
            cell.backGroundView.backgroundColor = .red
        }else if indexPath.row == 1 {
            cell.backGroundView.backgroundColor = .blue
        }else if indexPath.row == 2 {
            cell.backGroundView.backgroundColor = .green
        }else if indexPath.row == 3 {
            cell.backGroundView.backgroundColor = .darkGray
        }else {
            cell.backGroundView.backgroundColor = .orange
        }
        cell.cellLbl.text = arrLbl[indexPath.row].lbl
        
        
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("numberofselected\(indexPath.section) and\(indexPath.section) and\(arrLbl[indexPath.row].lbl)")
    }
    
}

struct ArrLbl {
    let lbl : String
}


//MARK:
/*
func createLayout() -> UICollectionViewLayout {
    // Item: fills 100% of its group
    let itemSize = NSCollectionLayoutSize(
        widthDimension: .fractionalWidth(1.0),
        heightDimension: .fractionalHeight(1.0)
    )
    let item = NSCollectionLayoutItem(layoutSize: itemSize)

    // Group: 50% of the collection view's width, and its height is 50% of that width's screen equivalent
    let groupSize = NSCollectionLayoutSize(
        widthDimension: .fractionalWidth(0.5),      // 50% of screen width
        heightDimension: .fractionalWidth(0.5)      // ratio relative to width -> square-ish
    )
    let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

    let section = NSCollectionLayoutSection(group: group)
    return UICollectionViewCompositionalLayout(section: section)
}
*/
