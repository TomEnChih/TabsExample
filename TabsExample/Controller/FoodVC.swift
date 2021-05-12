//
//  FoodVC.swift
//  TabsExample
//
//  Created by 董恩志 on 2021/5/12.
//

import UIKit

class FoodVC: UIViewController {

    let label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 40)
        label.text = "Food View"
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label.textAlignment = NSTextAlignment.center
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.tag = 0
        view.backgroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        view.addSubview(label)
        
        label.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        
    }
    

}
