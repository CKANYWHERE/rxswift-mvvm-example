//
//  DetailViewModel.swift
//  BountyList
//
//  Created by 민창경 on 2020/10/02.

import Foundation
import RxSwift
import RxCocoa

class DetailViewModel{
    //let bountyInfo : BountyInfo?
    let disposeBag = DisposeBag()
    
    //output
    let bounty:Observable<String>
    let name:Observable<String>
    let image:Observable<UIImage>

    init(model BountyInfo: BountyInfo){
        bounty = Observable.just(BountyInfo.bounty ?? "0")
            .observeOn(MainScheduler.instance)
        name = Observable.just(BountyInfo.name ?? "no name")
            .observeOn(MainScheduler.instance)
        image = Observable.just(BountyInfo.image!)
            .observeOn(MainScheduler.instance)
    }
    
}
