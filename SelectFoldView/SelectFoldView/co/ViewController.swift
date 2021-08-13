//
//  ViewController.swift
//  SelectFoldView
//
//  Created by 金劲通 on 2021/8/11.
//

import UIKit
let reuseHeader = "reuseHeader"
let reuseCell = "reuseCell"
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupSubViews()
    }
    
    lazy var sectionDict: [[String: Any]] = {
        let dict = [["isOpen": true,"items":10],["isOpen": true,"items":10]]
        return dict
    }()
    
    lazy var flowLayout: UICollectionViewFlowLayout = {
        let flow = UICollectionViewFlowLayout.init()
        flow.scrollDirection = .vertical
        flow.estimatedItemSize = CGSize(width: 100, height: 45)
        flow.minimumLineSpacing = 10
        flow.minimumInteritemSpacing = 5
        flow.sectionInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        
        return flow
    }()
    
    lazy var collectionView: UICollectionView = {
        let coView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: flowLayout)
        coView.delegate = self
        coView.dataSource = self
        coView.alwaysBounceVertical = true
//        coView.isScrollEnabled = false
        coView.register(SectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: reuseHeader)
        coView.register(NameTagView.self, forCellWithReuseIdentifier: reuseCell)
        coView.backgroundColor = .white
        return coView
    }()
    
    func setupSubViews() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.bottom.right.left.equalToSuperview()
            make.top.equalTo(64)
        }
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: NameTagView = collectionView.dequeueReusableCell(withReuseIdentifier: reuseCell, for: indexPath) as! NameTagView
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
    
        return sectionDict.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let dict = sectionDict[section]
        let isOpen = dict["isOpen"] as! Bool
        if isOpen {
            return dict["items"] as! Int
        }else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let reuseAbleView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: reuseHeader, for: indexPath) as! SectionHeaderView
        let dict = sectionDict[indexPath.section]
        let isOpen = dict["isOpen"] as! Bool
        reuseAbleView.foldClickClosure = { [weak self] in
            self?.sectionDict[indexPath.section]["isOpen"] = !isOpen
            self?.collectionView.reloadData()
        }
        return reuseAbleView
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.size.width, height: 49)
    }
    
}
