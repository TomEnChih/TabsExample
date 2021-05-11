//
//  ViewController.swift
//  TabsExample
//
//  Created by 董恩志 on 2021/5/11.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    let homeView = HomeView()
    let pages = ["美食","電影","音樂"]
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view = homeView
        setCollectionView()
    }
    
    // MARK: - Methods
    func setCollectionView() {
        homeView.tabsCollectionView.delegate = self
        homeView.tabsCollectionView.dataSource = self
        homeView.tabsCollectionView.selectItem(at: IndexPath(item: 0, section: 0), animated: true, scrollPosition: .centeredHorizontally)
    }

}

//MARK: - CollectionViewDelegate,CollectionViewDataSource
extension HomeViewController: UICollectionViewDelegateFlowLayout,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TabsCollectionViewCell.cellKey, for: indexPath) as! TabsCollectionViewCell
        cell.backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        cell.pageLabel.text = pages[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: homeView.tabsCollectionView.frame.width/4, height: homeView.tabsCollectionView.frame.height - 4)
    }
    
    
    //MARK: didSelect
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //        let cell = collectionView.cellForItem(at: indexPath) as! PageSelectionCollectionViewCell
        //        cell.displayTheCurrentPageView.backgroundColor = .red
//        collectionViewIndex = indexPath.item
//        collectionToPageDelegate.collectionToPage(collectionIndex: indexPath.item)
    }
    
}
