//
//  TBModel.swift
//  SelectFoldView
//
//  Created by 金劲通 on 2021/8/12.
//

import UIKit

class TBModel: NSObject {
    var isOpen = false
    var btnModel: [BtnModel]?
    var isSelected = false
}

class BtnModel: NSObject {
    var isSelected = false
}
