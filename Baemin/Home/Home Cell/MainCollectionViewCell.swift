//
//  MainCollectionViewCell.swift
//  Baemin
//
//  Created by 김학동 on 2021/11/24.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var menuThumnailImage: UIImageView!
    @IBOutlet weak var menuTitle: UILabel!
    @IBOutlet weak var menuDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        menuThumnailImage.layer.cornerRadius = 10
    }
    
    func loadMenu(item: Menu?) {
        guard let menu = item else { return }
        menuThumnailImage.image = menu.thumnailImage
        menuTitle.text = menu.title
        menuDescription.text = menu.discription
    }
}
