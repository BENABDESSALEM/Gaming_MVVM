//
//  HomeCollectionViewCell.swift
//  TheSportsFDJ
//
//  Created by Wajih Benabdessalem on 6/1/2023.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing: HomeCollectionViewCell.self)
    static func nib() -> UINib { return UINib.init(nibName: identifier, bundle: nil)}

    @IBOutlet weak var leagueImageView: UIImageView!
    
    var viewModel: TeamCollectionViewModel! {
        didSet {
            leagueImageView.load(imageUrl: viewModel.team?.strTeamBadge ?? "")
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureWith(viewModel:TeamCollectionViewModel){
        self.viewModel = viewModel
    }
    
}
