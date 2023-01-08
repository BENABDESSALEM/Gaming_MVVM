//
//  InfoTeamTableViewCell.swift
//  TheSportsFDJ
//
//  Created by Wajih Benabdessalem on 7/1/2023.
//

import UIKit

class InfoTeamTableViewCell: UITableViewCell {

    static let identifier = String(describing: InfoTeamTableViewCell.self)
    static func nib() -> UINib { return UINib.init(nibName: identifier, bundle: nil)}
    
    @IBOutlet weak var bannerImageView: UIImageView!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var leagueLabel: UILabel!
    
    var viewModel: InfoTableViewModel! {
        didSet {
            self.bannerImageView.load(imageUrl: viewModel.teamBanner ?? "")
            self.countryLabel.text = viewModel.teamCountry
            self.leagueLabel.text = viewModel.teamLeague
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureWith(viewModel:InfoTableViewModel){
        self.viewModel = viewModel
    }
}
