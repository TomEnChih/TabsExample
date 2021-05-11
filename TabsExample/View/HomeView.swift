//
//  HomeView.swift
//  TabsExample
//
//  Created by 董恩志 on 2021/5/11.
//

import UIKit

class HomeView: UIView {
    
    // MARK: - UIElement
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25)
        label.text = "TabsExample"
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label.textAlignment = NSTextAlignment.center
        return label
    }()
    
    var tabsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        //左右cell的間隔
        layout.minimumInteritemSpacing = 1
        
        layout.scrollDirection = .vertical
        
        var cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        cv.backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        cv.register(TabsCollectionViewCell.self, forCellWithReuseIdentifier: TabsCollectionViewCell.cellKey)
        
        return cv
    }()
    
    var bottomView: UIView = {
        let view = UIView()
        return view
    }()
    
    // MARK: - Autolayout
    
    func constraints() {
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.safeAreaLayoutGuide)
            make.left.right.equalTo(self)
            make.height.equalTo(50)
        }
        
        tabsCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom)
            make.left.right.equalTo(self)
            make.height.equalTo(50)
        }
        
        bottomView.snp.makeConstraints { (make) in
            make.top.equalTo(tabsCollectionView.snp.bottom)
            make.right.left.bottom.equalTo(self)
        }
    }
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        
        
        addSubview(titleLabel)
        addSubview(tabsCollectionView)
        addSubview(bottomView)
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
