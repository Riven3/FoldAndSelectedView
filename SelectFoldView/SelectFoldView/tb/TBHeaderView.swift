//
//  TBHeaderView.swift
//  SelectFoldView
//
//  Created by 金劲通 on 2021/8/11.
//

import UIKit
import SnapKit
class TBHeaderView: UIView {
    var foldClickClosure: FoldClickedClosure?
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .gray
        setUpSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - setter / getter
    
    lazy var tagBtn: UIButton = {
        let tag = UIButton()
        tag.setImage(UIImage.init(named: "people_unselected"), for: UIControl.State.normal)
        tag.setImage(UIImage.init(named: "people_selected"), for: UIControl.State.selected)
        return tag
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "标题"
        label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.bold)
        label.textColor = .black
        return label
    }()
    
    lazy var arrowView: UIButton = {
        let view = UIButton()
        view.setImage(UIImage.init(named: "arrow_down"), for: UIControl.State.normal)
        view.addTarget(self, action: #selector(arrowClicked(sender:)), for: UIControl.Event.touchUpInside)
        return view
    }()
    
    @objc func arrowClicked(sender: UIButton) {
        if self.foldClickClosure != nil {
            self.foldClickClosure!()
        }
    }
}


// MARK: - initial methods
extension TBHeaderView {}

//MARK: - config UI
extension TBHeaderView {
    func setUpSubviews() {
        addSubviews()
        snapSubviews()
    }
    
    func snapSubviews() {
        tagBtn.snp.makeConstraints { (make) in
            make.left.top.equalTo(15)
            make.size.equalTo(20)
            make.bottom.equalTo(-15)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(tagBtn)
            make.left.equalTo(tagBtn.snp.right).offset(10)
        }
        
        arrowView.snp.makeConstraints { (make) in
            make.centerY.equalTo(titleLabel)
            make.right.equalTo(-15)
        }
    }
    
    func addSubviews() {
        addSubview(tagBtn)
        addSubview(titleLabel)
        addSubview(arrowView)
    }
}
//MARK: - actions
extension TBHeaderView {}

//MARK: - load data
extension TBHeaderView {}

//MARK: - public methods
extension TBHeaderView {}

//MARK: - delegate
extension TBHeaderView {}
