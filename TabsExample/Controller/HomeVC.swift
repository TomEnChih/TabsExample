//
//  ViewController.swift
//  TabsExample
//
//  Created by 董恩志 on 2021/5/11.
//

import UIKit
import SnapKit

class HomeVC: UIViewController {
    
    let homeView = HomeView()
    let pages = ["美食","電影","音樂"]
    
    var pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    var pageViewIndex: Int = 0
    var viewControllers = [FoodVC(),MovieVC(),MusicVC()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = homeView
        setCollectionView()
        setPageViewController()
        childViewConfiguration()
    }
    
    // MARK: - Methods
    func setCollectionView() {
        homeView.tabsCollectionView.delegate = self
        homeView.tabsCollectionView.dataSource = self
        homeView.tabsCollectionView.selectItem(at: IndexPath(item: 0, section: 0), animated: true, scrollPosition: .centeredHorizontally)
    }
    
    func setPageViewController() {
        view.addSubview(pageViewController.view)
        addChild(pageViewController)
        
        pageViewController.view.snp.makeConstraints { (make) in
            make.edges.equalTo(homeView.bottomView)
        }
        
        pageViewController.delegate = self
        pageViewController.dataSource = self
        
        
        pageViewController.setViewControllers([viewControllers[pageViewIndex]], direction: .forward, animated: true)

    }
    
    func childViewConfiguration() {
        guard let foodVC = viewControllers[0] as? FoodVC else {
            return
        }
        
        foodVC.delegate = self
    }

    
    func pageViewToChange(index: Int) -> UIViewController? {
        
        if index < 0 {
            return viewControllers.last
            
        } else if index > viewControllers.count-1 {
            return viewControllers.first
            
        } else {
            return viewControllers[index]
        }
    }
    
}

//MARK: - CollectionViewDelegate,CollectionViewDataSource

extension HomeVC: UICollectionViewDelegateFlowLayout,UICollectionViewDataSource {
    
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
        
        if indexPath.item > pageViewIndex {
            pageViewIndex = indexPath.item
            pageViewController.setViewControllers([viewControllers[pageViewIndex]], direction: .forward, animated: true)
        }
        if indexPath.item < pageViewIndex {
            pageViewIndex = indexPath.item
            pageViewController.setViewControllers([viewControllers[pageViewIndex]], direction: .reverse, animated: true)
        }
    }
    
}


//MARK: - PageViewControllerDelegate, PageViewControllerDataSource

extension HomeVC: UIPageViewControllerDelegate,UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        return pageViewToChange(index: pageViewIndex - 1)
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        return pageViewToChange(index: pageViewIndex + 1)
        
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        if finished {
            if completed {
                guard let vc = pageViewController.viewControllers?.first else { return }
                
                pageViewIndex = vc.view.tag
                
                
                homeView.tabsCollectionView.selectItem(at: IndexPath(item: pageViewIndex, section: 0), animated: true, scrollPosition: .centeredVertically)
            }
        }
    }
    
}

//MARK: - PhotoTableViewControllerDelegate

extension HomeVC: PhotoTableViewControllerDelegate {
    func tableViewDidScroll(_ tableView: FoodVC, translation: CGFloat) {

        self.homeView.topView.snp.remakeConstraints { (make) in
            make.left.right.equalTo(view)
            make.top.equalTo(view.snp.topMargin)
            make.height.equalTo(200-translation)
        }    }
}
