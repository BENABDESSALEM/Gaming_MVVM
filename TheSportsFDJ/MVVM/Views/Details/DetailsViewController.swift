//
//  DetailsViewController.swift
//  TheSportsFDJ
//
//  Created by Wajih Benabdessalem on 5/1/2023.
//

import UIKit

class DetailsViewController: BaseViewController {

    @IBOutlet weak var detailsTableView: UITableView!
    @IBOutlet weak var teamTitleLabel: UILabel!
    
    internal static func instantiate(with viewModel: DetailsViewModel) -> DetailsViewController {
        let vc = StoryboardScene.Details.detailsViewController.instantiate()
        vc.viewModel = viewModel
        return vc
    }
    
    var viewModel: DetailsViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initViews()
        self.initViewModels()
    }
    
    func initViews() {
        detailsTableView.register(InfoTeamTableViewCell.nib(), forCellReuseIdentifier: InfoTeamTableViewCell.identifier)
        detailsTableView.register(DescriptionTeamTableViewCell.nib(), forCellReuseIdentifier: DescriptionTeamTableViewCell.identifier)
    }
    
    func initViewModels() {
        viewModel.getTeamDetails()
        viewModel.reloadTableData = { [weak self] in
            DispatchQueue.main.async {
                self?.teamTitleLabel.text = self?.viewModel.teamName
                self?.detailsTableView.reloadData()
            }
        }
        
        viewModel.$isLoading
            .receive(on: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] value in
                if value {
                    self?.loadingHelper.start()
                }else{
                    self?.loadingHelper.stop()
                }
            }.store(in: &subscriptions)
    }
}

extension DetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = viewModel.items[indexPath.row]
        if let infoTableViewModel = item as? InfoTableViewModel {
            let cell = tableView.dequeueReusableCell(withIdentifier: InfoTeamTableViewCell.identifier, for: indexPath) as! InfoTeamTableViewCell
            cell.configureWith(viewModel: infoTableViewModel)
            return cell
        } else if let descriptionTableViewModel = item as? DescriptionTableViewModel {
            let cell = tableView.dequeueReusableCell(withIdentifier: DescriptionTeamTableViewCell.identifier, for: indexPath) as! DescriptionTeamTableViewCell
            cell.configureWith(viewModel: descriptionTableViewModel)
            return cell
        }
        return UITableViewCell()
    }
}

extension DetailsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let item = viewModel.items[indexPath.row]
        if let _ = item as? InfoTableViewModel {
            return 200
        }else if let _ = item as? DescriptionTableViewModel {
            return UITableView.automaticDimension
        }
        return UITableView.automaticDimension
    }
}
