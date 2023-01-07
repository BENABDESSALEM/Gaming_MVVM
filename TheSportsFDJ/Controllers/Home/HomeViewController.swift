//
//  HomeViewController.swift
//  TheSportsFDJ
//
//  Created by Wajih Benabdessalem on 5/1/2023.
//

import UIKit

class HomeViewController: BaseViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var leaguesCollectionView: UICollectionView!
    @IBOutlet weak var autocompleteTableView: UITableView!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    
    var viewModel: HomeViewModel!
    var searchActive : Bool = false
    @Published private(set) var searchQuery = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initViews()
        self.initViewModels()
        self.setBindings()
    }

    func initViews() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 40
        layout.sectionInset = UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 50)
        if UIDevice.current.userInterfaceIdiom == .pad {
            let top = self.leaguesCollectionView.frame.height * 0.3
            layout.sectionInset = UIEdgeInsets(top: top, left: 120, bottom: 0, right: 120)
        }
        leaguesCollectionView.setCollectionViewLayout(layout, animated: false)
        leaguesCollectionView.register(HomeCollectionViewCell.nib(), forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
        autocompleteTableView.register(AutoCompleteTableViewCell.nib(), forCellReuseIdentifier: AutoCompleteTableViewCell.identifier)
        searchBar.setShowsCancelButton(false, animated: true)
    }
    
    func initViewModels() {
        viewModel = HomeViewModel()
        viewModel.reloadTableData = { [weak self] in
            DispatchQueue.main.async {
                self?.autocompleteTableView.reloadData()
                self?.tableViewHeight.constant = CGFloat((self?.viewModel.filtredLeagues.count ?? 0) * 30)
            }
        }
        viewModel.reloadCollectionData = { [weak self] in
            DispatchQueue.main.async {
                self?.leaguesCollectionView.reloadData()
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
    
    func setBindings(){
        $searchQuery
            .receive(on: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] value in
                self?.viewModel.searchQuery = value
            }.store(in: &subscriptions)
    }
}

extension HomeViewController: UISearchBarDelegate {

    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.searchBar.setShowsCancelButton(true, animated: true)
        self.autocompleteTableView.isHidden = false
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchQuery = searchText
        self.autocompleteTableView.isHidden = searchText.count > 0 ? false : true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searchQuery = ""
        self.searchBar.text = ""
        self.autocompleteTableView.isHidden = true
        self.searchBar.setShowsCancelButton(false, animated: true)
        searchBar.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.viewModel.leagueToSearch = self.searchQuery
        self.searchBar.setShowsCancelButton(false, animated: true)
        self.autocompleteTableView.isHidden = true
        searchBar.resignFirstResponder()
    }

}

extension HomeViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var width = 120
        if UIDevice.current.userInterfaceIdiom == .pad {
            width = 150
        }
        return CGSize(width: width, height: width+30)
    }
}

extension HomeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.teams.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath) as! HomeCollectionViewCell
        let team = viewModel.teams[indexPath.row]
        let teamCollectionViewModel = TeamCollectionViewModel(team: team)
        cell.configureWith(viewModel: teamCollectionViewModel)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let query = viewModel.teams[indexPath.row].strTeam ?? ""
        let vc = DetailsViewController.instantiate(with: DetailsViewModel(query: query))
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.filtredLeagues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let league = viewModel.filtredLeagues[indexPath.row]
        let cellViewModel = LeagueTableViewModel(league:league)
        let cell = tableView.dequeueReusableCell(withIdentifier: AutoCompleteTableViewCell.identifier, for: indexPath) as! AutoCompleteTableViewCell
        cell.configureWith(viewModel: cellViewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let league = viewModel.filtredLeagues[indexPath.row].strLeague ?? ""
        self.searchBar.text = league
        self.viewModel.leagueToSearch = league
        self.autocompleteTableView.isHidden = true
        self.searchBar.resignFirstResponder()
        self.searchBar.setShowsCancelButton(false, animated: true)
    }
}

extension HomeViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
}
