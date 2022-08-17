//
//  ViewController.swift
//  Its_alamofire
//
//  Created by Jhansi Ch on 17/08/22.
//

import UIKit

class ViewController: UIViewController {
    var controller : PostsController = {
        return PostsController()
    }()
    var viewModelObject : ViewModel {
        return controller.viewModelObject
    }
    let networkObject = Network()
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    lazy var loadingIdicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .gray)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.hidesWhenStopped = true
        self.view.addSubview(indicator)
        NSLayoutConstraint.activate([
            indicator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            indicator.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
            ])
        return indicator
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        initBinding()
        controller.start()
        viewModelObject.callGetPosts { _ in
            
        }
    }
    func initView() {
        view.backgroundColor = .white
    }
    func initBinding() {
        viewModelObject.sectionViewModels.addObserver(fireNow: false) { getposts in
            self.tableView.reloadData()
        }
        viewModelObject.title.addObserver { title in
            self.titleLabel.text = title
        }
        viewModelObject.isTabelViewHidden.addObserver { isHidden in
            self.tableView.isHidden = isHidden
        }
        viewModelObject.isLoading.addObserver { isLoading in
            if isLoading {
                self.loadingIdicator.startAnimating()
            }
            else {
                self.loadingIdicator.stopAnimating()
            }
        }
    }
}
extension ViewController :UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModelObject.sectionViewModels.value.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let rowViewModel = viewModelObject.sectionViewModels.value[indexPath.row]
        if let cell = cell as? CellConfigurable {
            cell.setup(viewModel: rowViewModel)
        }
        cell.layoutIfNeeded()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 184.0
    }
}

