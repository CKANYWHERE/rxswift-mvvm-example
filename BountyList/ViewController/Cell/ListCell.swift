//
//  ListCell.swift
//  BountyList
//
//  Created by 민창경 on 2020/10/03.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

class ListCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
    private var disposeBag = DisposeBag()
    
    
    var viewModel: ListCellViewModel? {
        didSet {
            let disposeBag = DisposeBag()
            
            guard let viewModel = viewModel else { return }
            
            viewModel.image
                .bind(to: imgView.rx.image)
                .disposed(by: disposeBag)
            
            viewModel.name
                .bind(to: nameLabel.rx.text)
                .disposed(by: disposeBag)
            
            viewModel.bounty
                .bind(to: bountyLabel.rx.text)
                .disposed(by: disposeBag)
            
            self.disposeBag = disposeBag
        }
    }
    
    func update(info: BountyInfo){
        imgView.image = info.image
        nameLabel.text = info.name
        bountyLabel.text = "\(info.bounty ?? "0" )"
    }
}
