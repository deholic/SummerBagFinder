//
//  StoreListCell.swift
//  SummerBagFinder
//
//  Created by EUIGYOM KIM on 2020/06/21.
//  Copyright © 2020 EUIGYOM KIM. All rights reserved.
//

import UIKit

class StoreListCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var stockImage: UIImageView!
    @IBOutlet weak var stockStatusLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setStoreInfo(_ store: StoreList.ViewModel.Store) {
        nameLabel.text = store.name
        addressLabel.text = store.address
    }
    
    func setStockInfo(_ stock: StoreList.ViewModel.Stock) {
        stockImage.tintColor = stock.iconColor
        stockStatusLabel.text = stock.status
    }
}
