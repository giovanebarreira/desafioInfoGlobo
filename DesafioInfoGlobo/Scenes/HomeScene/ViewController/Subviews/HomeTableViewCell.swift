//
//  HomeTableViewCell.swift
//  DesafioInfoGlobo
//
//  Created by Giovane Barreira on 12/13/20.
//

import UIKit
import Kingfisher

class HomeTableViewCell: UITableViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var sectionNameLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setup(viewData: HomeSceneViewDataItemType?) {
        sectionNameLbl.text = viewData?.sectionTitle
        titleLbl.text = viewData?.newsTitle
        
        viewData?.newsImage.forEach {
            newsImage.kf.setImage(with: URL(string: $0))
        }
    }
}
