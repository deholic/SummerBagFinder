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
    
    func setStoreInfo(_ store: Store) {
        nameLabel.text = store.name
        addressLabel.text = store.address
    }
    
    func setStockInfo(_ stock: Stock?) {
        guard let stock = stock else {
            stockImage.tintColor = .systemRed
            stockStatusLabel.text = "Unknown"
            return
        }
        
        stockImage.tintColor = stock.state.color
        stockStatusLabel.text = "G: \(stock.greenCount) / P: \(stock.pinkCount)"
    }
    
}

extension Stock.State {
    var color: UIColor {
        switch self {
        case .available:
            return .systemGreen
        case .warning:
            return .systemYellow
        case .outOfStock:
            return .systemRed
        }
    }
}
