//
//  AutoCompleteTableViewCell.swift
//  TheSportsFDJ
//
//  Created by Wajih Benabdessalem on 6/1/2023.
//

import UIKit

class AutoCompleteTableViewCell: UITableViewCell {

    static let identifier = String(describing: AutoCompleteTableViewCell.self)
    static func nib() -> UINib { return UINib.init(nibName: identifier, bundle: nil)}
    
    @IBOutlet weak var autoCompleteLabel: UILabel!
    
    var viewModel: LeagueTableViewModel! {
        didSet {
            autoCompleteLabel.text = viewModel.league?.strLeague
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureWith(viewModel:LeagueTableViewModel){
        self.viewModel = viewModel
    }
    
}
