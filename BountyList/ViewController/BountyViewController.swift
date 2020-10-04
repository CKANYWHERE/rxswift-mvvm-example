//
//  BountyViewController.swift
//  BountyList
//

import UIKit
import RxSwift
import RxCocoa

class BountyViewController: UIViewController{
    
    let viewModel = BountyViewModel()
    let disposeBag = DisposeBag()
    @IBOutlet weak var tableView: UITableView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let vc = segue.destination as? DetailViewController
            if let index = sender as? BountyInfo {
                vc?.viewModel = DetailViewModel(model:index)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bind()
    }
    
    func bind(){
        viewModel.bountyInfoList
            .bind(to: tableView.rx.items(cellIdentifier: "cell",cellType: ListCell.self)){ index, bounty, cell in
                cell.bountyLabel.text = bounty.bounty
                cell.imgView.image = bounty.image
                cell.nameLabel.text = bounty.name
            }
            .disposed(by:disposeBag)
        
        tableView.rx.itemSelected
          .subscribe(onNext: { [weak self] indexPath in
            
            let cell = self?.tableView.cellForRow(at: indexPath) as? ListCell
            var bountyInfo:BountyInfo?
            if let name = cell?.nameLabel.text, let bounty = cell?.bountyLabel.text {
                bountyInfo = BountyInfo(name:name, bounty: Int(bounty) ?? 0)
            }
            self!.performSegue(withIdentifier: "showDetail", sender: bountyInfo)
          }).disposed(by: disposeBag)
        
    }
    
}
