//
//  RankCollectionViewCell.swift
//  Baemin
//
//  Created by 김학동 on 2021/11/30.
//

import UIKit

class RankCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var Rank: UILabel!
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var state: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func loadRank(rank: Rank?) {
        self.Rank.text = "\(String(describing: rank?.rank ?? 1))"
        self.Name.text = rank?.name
    }
}
