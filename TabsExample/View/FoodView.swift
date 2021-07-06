//
//  FoodView.swift
//  TabsExample
//
//  Created by 董恩志 on 2021/6/30.
//

import UIKit

class FoodView: UIView {

    let tabelView: UITableView = {
        let tv = UITableView()
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tv.clipsToBounds = true
        return tv
    }()
    
    func autoLayout() {
        tabelView.snp.makeConstraints { (make) in
            make.edges.equalTo(self)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(tabelView)
        
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
