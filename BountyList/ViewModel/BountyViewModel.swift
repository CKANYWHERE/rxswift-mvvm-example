//
//  BountyViewModel.swift
//  BountyList
//
import Foundation
import RxSwift
import RxCocoa

protocol BountyViewModelType {
    // MARK: - Output
    var bountyInfoList: Observable<[BountyInfo]> { get }
    //var bountyInfo : Observable<BountyInfo> {get}
}

class BountyViewModel : BountyViewModelType{
    let bountyInfoList: Observable<[BountyInfo]>
    //let bountyInfo : Observable<BountyInfo>
    
    init(){
        bountyInfoList = Observable.just([
            BountyInfo(name: "brook", bounty: 33000000),
            BountyInfo(name: "chopper", bounty: 50),
            BountyInfo(name: "franky" , bounty: 44000000),
            BountyInfo(name: "luffy", bounty: 300000000),
            BountyInfo(name: "nami",bounty: 16000000),
            BountyInfo(name: "robin", bounty: 80000000),
            BountyInfo(name: "sanji", bounty: 77000000),
            BountyInfo(name: "zoro", bounty: 120000000)
        ]).observeOn(MainScheduler.instance)
        
    }
    
}
