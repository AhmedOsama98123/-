//
//  ViewController.swift
//  SecondCompostional
//
//  Created by TaqieAllah on 29/07/2026.
//

import UIKit

class ViewController: UIViewController {
    var modelImage = [ModelImage]()
    @IBOutlet var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollection()
    }
    
    func setupCollection() {
        
        modelImage.append(ModelImage(image: UIImage(named: "image1") ?? UIImage(systemName: "photo")!))
        modelImage.append(ModelImage(image: UIImage(named: "image2") ?? UIImage(systemName: "photo")!))
        modelImage.append(ModelImage(image: UIImage(named: "image1") ?? UIImage(systemName: "photo")!))
        modelImage.append(ModelImage(image: UIImage(named: "image2") ?? UIImage(systemName: "photo")!))
           
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ImageCell.nib(), forCellWithReuseIdentifier: ImageCell.identifier)
        collectionView.collectionViewLayout = UICollectionViewCompositionalLayout(section: makeSection())
        collectionView.backgroundColor = .gray
        

        
    }
    func makeSection() -> NSCollectionLayoutSection {
        let itemOneSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1.0))
        let itemOne = NSCollectionLayoutItem(layoutSize: itemOneSize)
        let itemTwo = NSCollectionLayoutItem(layoutSize: itemOneSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(0.3))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [
            itemOne,
            itemTwo
        ])
        let secondGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(0.3))
        let secondGroup = NSCollectionLayoutGroup.vertical(layoutSize: secondGroupSize, subitems: [itemOne,itemTwo])
        
        let outerGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.3)),subitems:[group, secondGroup])
        
        let section = NSCollectionLayoutSection(group: outerGroup)
        section.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
        section.orthogonalScrollingBehavior = .groupPaging
        return section
    }
}
extension ViewController:UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return modelImage.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCell.identifier, for: indexPath) as! ImageCell
        cell.cellImage.image = modelImage[indexPath.row].image
        
        
        
        return cell
    }
}

struct ModelImage {
    let image : UIImage
    
    
    init(image: UIImage) {
        self.image = image
    }
}

