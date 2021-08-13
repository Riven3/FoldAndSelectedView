//
//  TBTableViewCell.swift
//  SelectFoldView
//
//  Created by 金劲通 on 2021/8/11.
//

import UIKit

class TBTableViewCell: UITableViewCell {
    var foldClickClosure: FoldClickedClosure?
    
    var datas = TBModel() {
        didSet {
            configureWithModels(datass: datas)
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
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
        tag.addTarget(self, action: #selector(tagSelected(sender:)), for: UIControl.Event.touchUpInside)
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
        print("创建arrow")
        view.setImage(UIImage.init(named: "arrow_down"), for: UIControl.State.normal)
        view.addTarget(self, action: #selector(arrowClicked(sender:)), for: UIControl.Event.touchUpInside)
        view.jt_setEnlargeEdge(withTop: 50, right: 100, bottom: 50, left: 100)
        return view
    }()
    //(datas.btnModel?.count ?? 0)
    lazy var buttonArrays: [UIButton] = {
        var tempButtons = [UIButton]()
        for i in 0..<10 {
            let btn = UIButton()
            btn.backgroundColor = UIColor.red
            btn.layer.cornerRadius = 13
            btn.layer.masksToBounds = true
            btn.layer.masksToBounds = true
            btn.addTarget(self, action: #selector(changeStatus(sender:)), for: UIControl.Event.touchUpInside)
            tempButtons.append(btn)
        }
        return tempButtons
    }()
    
    
    lazy var backView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white.withAlphaComponent(1)
        return view
    }()
    
    @objc func arrowClicked(sender: UIButton) {
        print(datas.isOpen)
        if self.foldClickClosure != nil {
            self.foldClickClosure!()
        }
    }
    
    @objc func changeStatus(sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            sender.layer.borderWidth = 0
        }else {
            sender.layer.borderWidth = 0.5
        }
        sender.backgroundColor = sender.isSelected ? .red : .white
    }
    
    @objc func tagSelected(sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
}


// MARK: - initial methods
extension TBTableViewCell {}

//MARK: - config UI
extension TBTableViewCell {
    func setUpSubviews() {
        addSubviews()
        snapSubviews()
    }
    
    func snapSubviews() {
        backView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(15)
        }
        tagBtn.snp.makeConstraints { (make) in
            make.left.top.equalTo(15)
            //make.size.equalTo(20)
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
        contentView.addSubview(backView)
        backView.addSubview(tagBtn)
        backView.addSubview(titleLabel)
        backView.addSubview(arrowView)
        for btn in buttonArrays {
            backView.addSubview(btn)
        }
    }
}
//MARK: - actions
extension TBTableViewCell {}

//MARK: - load data
extension TBTableViewCell {
    func configureWithModels(datass: TBModel) {
        if datass.isOpen {
            tagBtn.snp.remakeConstraints { (make) in
                make.left.top.equalTo(15)
               // make.size.equalTo(20)
            }
            
            titleLabel.snp.remakeConstraints { (make) in
                make.centerY.equalTo(tagBtn)
                make.left.equalTo(tagBtn.snp.right).offset(10)
            }
            
            arrowView.snp.remakeConstraints { (make) in
                make.centerY.equalTo(titleLabel)
                make.right.equalTo(-15)
            }
            let itemWidth = (ScreenWidth - 90)/4
            for btn in buttonArrays {
                btn.isHidden = false
                let index = buttonArrays.firstIndex(of: btn) ?? 0
                let totalRow = (buttonArrays.count - 1) / 4
                //行
                let hRow = index / 4
                //列
                let vLine = index % 4
                btn.snp.remakeConstraints { (make) in
                    make.top.equalTo(tagBtn.snp.bottom).offset(15 + hRow * 15 + hRow * 26)
                    make.left.equalTo(15 + (itemWidth + 10) * CGFloat(vLine))
                    make.width.equalTo(itemWidth)
                    make.height.equalTo(26)
                    make.bottom.equalTo(-(15 + 41 * (totalRow - hRow)))
                }
            }
            
        }else {
            tagBtn.snp.remakeConstraints { (make) in
                make.left.top.equalTo(15)
                //make.size.equalTo(20)
                make.bottom.equalTo(-15)
            }
            
            titleLabel.snp.remakeConstraints { (make) in
                make.centerY.equalTo(tagBtn)
                make.left.equalTo(tagBtn.snp.right).offset(10)
            }
            
            arrowView.snp.remakeConstraints { (make) in
                make.centerY.equalTo(titleLabel)
                make.right.equalTo(-15)
            }
            for btn in buttonArrays {
                btn.isHidden = true
            }
        }
    
    }
    override func draw(_ rect: CGRect) {
        
    }
    
    //viewDidLayoutSubviews
    override func layoutSubviews() {
        backView.layer.cornerRadius = 8
        backView.setShadow(offset: CGSize(width: 0, height: 0), radius: 8, color: .gray, opacity: 0.3,cornerRadius: 8)
    }
}

//MARK: - public methods
extension TBTableViewCell {}

//MARK: - delegate
extension TBTableViewCell {}
