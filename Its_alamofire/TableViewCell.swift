//
//  TableViewCell.swift
//  Its_alamofire
//
//  Created by Jhansi Ch on 17/08/22.
//

import UIKit

class TableViewCell: UITableViewCell ,CellConfigurable{
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var postData: UILabel!
    @IBOutlet weak var numberOfLikes: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    lazy var loadingIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(indicator)
        return indicator
    }()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    var tableViewCellViewModelObject : TableViewCellViewModel?
    func setup(viewModel: RowViewModel) {
        guard let viewModel = viewModel as? TableViewCellViewModel else {
            return
        }
        self.tableViewCellViewModelObject = viewModel
        userName.text = viewModel.userName
        postData.text = viewModel.postData
        numberOfLikes.text = String(viewModel.numberOfLikes)
        viewModel.isLoading.addObserver { [weak self] (isLoading) in
            if isLoading {
                self?.loadingIndicator.startAnimating()
            } else {
                self?.loadingIndicator.stopAnimating()
            }
        }
        setNeedsLayout()
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        tableViewCellViewModelObject?.isLoading.removeObserver()
    }

}
