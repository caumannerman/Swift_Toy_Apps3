//
//  StationSearchViewController.swift
//  SubwayStationSearchApp
//
//  Created by 양준식 on 2022/04/23.
//

import UIKit
import SnapKit

class StationSearchViewController: UIViewController {
    private var numberOfCells: Int = 0
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.isHidden = true
        
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
       setNavigationItems()
        setTableViewLayout()
       
    }
    
    private func setNavigationItems(){
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "지하철 도착 정보"
        
        //UISearchController 생성
        let searchController = UISearchController()
        searchController.searchBar.placeholder = "지하철 역을 입력해주세요."
        //화면 어두워지지 않도록 false 처리
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        
        // UISearchController embedded
        navigationItem.searchController = searchController
    }
    
    private func setTableViewLayout(){
        view.addSubview(tableView)
        tableView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
}

extension StationSearchViewController: UISearchBarDelegate{
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        numberOfCells = 10
        //지웠다 다시 그려줘야함 
        tableView.reloadData()
        tableView.isHidden = false
    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        numberOfCells = 0
        tableView.isHidden = true
    }
}


extension StationSearchViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "\(indexPath.item)"
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfCells
    }
}


extension StationSearchViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = StationDetailViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
