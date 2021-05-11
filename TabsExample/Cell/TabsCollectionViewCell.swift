//
//  TabsCollectionViewCell.swift
//  TabsExample
//
//  Created by 董恩志 on 2021/5/11.
//

import UIKit

class TabsCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    static let cellKey = "CollectionViewCell"
    
    // MARK: - IBOutlets
    
    let pageLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = NSTextAlignment.center
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return label
    }()
    
    var displayTheCurrentPageView: UIView = {
        var view = UIView()
        return view
    }()
    
    // MARK: - Autolayout
    
    func constraints() {
        pageLabel.snp.makeConstraints { (make) in
            make.right.left.lessThanOrEqualTo(self)
            make.top.bottom.equalTo(self)
        }
        
        displayTheCurrentPageView.snp.makeConstraints { (make) in
            make.top.equalTo(pageLabel.snp.bottom)
            make.right.left.equalTo(pageLabel)
            make.height.equalTo(5)
        }
    }
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(pageLabel)
        addSubview(displayTheCurrentPageView)
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override var isSelected: Bool {
        didSet {
            DispatchQueue.main.async {
                UIView.animate(withDuration: 0.3) {
                    self.displayTheCurrentPageView.backgroundColor = self.isSelected ? UIColor.red : UIColor.clear
                    self.layoutIfNeeded()
                }
            }
        }
    }
}
