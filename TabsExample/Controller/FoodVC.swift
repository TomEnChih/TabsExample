//
//  FoodVC.swift
//  TabsExample
//
//  Created by 董恩志 on 2021/5/12.
//

import UIKit

protocol PhotoTableViewControllerDelegate: class {
    func tableViewDidScroll(_ tableView: FoodVC, translation: CGFloat)
}


class FoodVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    let foodView = FoodView()
    
    weak var delegate: PhotoTableViewControllerDelegate?

    
    private let userInfoViewHeight: CGFloat = 270

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.tag = 0
        view = foodView
        
        
        foodView.tabelView.delegate = self
        foodView.tabelView.dataSource = self
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = String(indexPath.row)
        cell.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)

        return cell
    }
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let translation = scrollView.contentOffset.y

        if translation < 200 {
            
            self.delegate?.tableViewDidScroll(self, translation: translation)
        }
        
    }
    
}
