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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var tableViewCellViewModelObject : TableViewCellViewModel?
    
    @objc func likeButtonPressed(sender : UIButton) {
        tableViewCellViewModelObject?.likeBtnPressed?()
    }
    
    func setup(viewModel: RowViewModel) {
        guard let viewModel = viewModel as? TableViewCellViewModel else {
            return
        }
        self.tableViewCellViewModelObject = viewModel
        userName.text = viewModel.userName
        postData.text = viewModel.postData
        numberOfLikes.text = String(viewModel.numberOfLikes)
        likeButton.addTarget(self, action: #selector(likeButtonPressed), for: .touchUpInside)
        if viewModel.likeStatus == true {
            likeButton.setImage(UIImage(systemName: "hand.thumbsup.fill"), for: .normal)
        }
        else {
            likeButton.setImage(UIImage(systemName: "hand.thumbsup"), for: .normal)
        }
        setNeedsLayout()
    }
    
}
