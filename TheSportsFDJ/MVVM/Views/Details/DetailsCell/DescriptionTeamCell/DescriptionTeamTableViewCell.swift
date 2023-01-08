//
//  DescriptionTeamTableViewCell.swift
//  TheSportsFDJ
//
//  Created by Wajih Benabdessalem on 7/1/2023.
//

import UIKit

class DescriptionTeamTableViewCell: UITableViewCell {

    static let identifier = String(describing: DescriptionTeamTableViewCell.self)
    static func nib() -> UINib { return UINib.init(nibName: identifier, bundle: nil)}
    
    @IBOutlet weak var teamDescriptionLabel: UILabel!
    
    var viewModel: DescriptionTableViewModel! {
        didSet {
            self.teamDescriptionLabel.text = viewModel.teamDescription
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureWith(viewModel:DescriptionTableViewModel){
        self.viewModel = viewModel
    }
    
}
