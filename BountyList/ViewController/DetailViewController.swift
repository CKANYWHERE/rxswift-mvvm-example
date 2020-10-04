//
//  DetailViewController.swift
//  BountyList
//

import UIKit
import RxCocoa
import RxSwift

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!

    var viewModel:DetailViewModel!
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindUI()
    }
    
    func bindUI() {
        guard let bountyInfo = viewModel else { return }
        
        bountyInfo.bounty
            .bind(to: bountyLabel.rx.text)
            .disposed(by: disposeBag)
        
        bountyInfo.name
            .bind(to: nameLabel.rx.text)
            .disposed(by: disposeBag)
        
        bountyInfo.image
            .bind(to: imgView.rx.image)
            .disposed(by: disposeBag)
        
        print(bountyInfo.name)
        
    }
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
