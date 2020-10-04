//
//  ListCellViewModel.swift
//  BountyList
//
//  Created by 민창경 on 2020/10/03.

import Foundation
import RxSwift
import RxCocoa

protocol ListCellViewModelType {
    var image: Observable<UIImage> {get}
    var name: Observable<String> {get}
    var bounty: Observable<String> {get}
    
}

class ListCellViewModel: ListCellViewModelType{
    let image: Observable<UIImage>
    let name: Observable<String>
    let bounty: Observable<String>
    
    init(model BountyInfo: BountyInfo){
        bounty = Observable.just(BountyInfo.bounty ?? "0")
            .observeOn(MainScheduler.instance)
        name = Observable.just(BountyInfo.name ?? "no name")
            .observeOn(MainScheduler.instance)
        image = Observable.just(BountyInfo.image!)
            .observeOn(MainScheduler.instance)
    }
    
}
