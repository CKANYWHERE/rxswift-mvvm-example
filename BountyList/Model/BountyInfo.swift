//
//  BountyInfo.swift
//  BountyList
//
//  Created by 민창경 on 2020/10/02.
//  Copyright © 2020 com.joonwon. All rights reserved.
//

import UIKit

struct BountyInfo {
    let name:String?
    let bounty:String?
    var image:UIImage?{
        return UIImage(named: ("\(name ?? "no").jpg"))
    }
    
    init(name:String, bounty:Int) {
        self.name = name
        self.bounty = String(bounty)
    }
}
