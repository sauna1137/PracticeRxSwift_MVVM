//
//  ViewController.swift
//  PracticeRxSwift
//
//  Created by KS on 2021/12/25.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()

    private var viewModel = ProdictViewModel()
    private var bag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(tableView)
        tableView.frame = view.bounds
        bindTableData()
    }

    func bindTableData() {
        // bind items to table
        viewModel.items.bind(
            to: tableView.rx.items(
                cellIdentifier: "cell",
                cellType: UITableViewCell.self)
        ) { row, model, cell in
            cell.textLabel?.text = model.title
            cell.imageView?.image = UIImage(systemName: model.imageName)
        }.disposed(by: bag)

        // bind a model selected handler
        tableView.rx.modelSelected(Product.self).bind { product in
            print(product.title)
        }.disposed(by: bag)

        // fetch items
        viewModel.fetchItems()
    }
}
