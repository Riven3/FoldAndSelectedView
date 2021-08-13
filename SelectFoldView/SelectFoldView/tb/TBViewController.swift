//
//  TBViewController.swift
//  SelectFoldView
//
//  Created by 金劲通 on 2021/8/11.
//

import UIKit

class TBViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        view.backgroundColor = UIColor.init(red: 244.0/255.0, green:  244.0/255.0, blue:  244.0/255.0, alpha: 1)
        // Do any additional setup after loading the view.
    }
    
    lazy var tbModels: [TBModel] = {
        var models = [TBModel]()
        for i in 0..<10 {
            let model = TBModel()
            model.isOpen = false
            let btnM = BtnModel()
            model.btnModel?.append(btnM)
            models.append(model)
        }
        return models
    }()
    
    lazy var tableView: UITableView = {
        let list = UITableView()
        list.delegate = self
        list.dataSource = self
        list.estimatedRowHeight = 80
        list.tableFooterView = UIView()
        list.backgroundColor = .clear
        list.tableFooterView?.backgroundColor = .clear
        list.separatorStyle = .none
        return list
    }()
    
}


// MARK: - config ui
extension TBViewController {
    func configureUI() {
        view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}
// MARK: - view controller lifecyle
extension TBViewController {}
// MARK: - target methods
extension TBViewController {}
// MARK: - delegate
extension TBViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: TBTableViewCell? = tableView.dequeueReusableCell(withIdentifier: "TBTableViewCell1") as? TBTableViewCell
        if cell == nil {
            cell = TBTableViewCell.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: "TBTableViewCell1")
        }
        cell?.selectionStyle = .none
        cell?.datas = tbModels[indexPath.section]
        let model = tbModels[indexPath.section]
        cell?.foldClickClosure = {[weak self] in
            if model.isOpen {
                self?.tbModels[indexPath.section].isOpen = false
            }else {
                self?.tbModels[indexPath.section].isOpen = true
            }
            let indexSet = IndexSet.init(integer: indexPath.section)
            self?.tableView.reloadSections(indexSet, with: UITableView.RowAnimation.fade)
        }
        let transformm = CGAffineTransform.init(rotationAngle: CGFloat.pi)
        UIView.animate(withDuration: 0.2) {
            if cell?.datas.isOpen == true {
                cell?.arrowView.transform = transformm
            }else {
                cell?.arrowView.transform = .identity
            }
        }
        return cell!
    }
}
// MARK: - private methods
extension TBViewController {}
// MARK: - target-action
extension TBViewController {}
