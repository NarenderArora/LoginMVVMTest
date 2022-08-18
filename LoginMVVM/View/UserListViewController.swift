//
//  UserListViewController.swift
//  LoginMVVM
//
//  Created by Narender Kumar on 16/08/22.
//

import UIKit

class UserListViewController: UIViewController {
    static var identifier: String {return String(describing: self)}
    @IBOutlet weak var tableView: UITableView!

    private var userListViewModel = UserListViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpTableView()
        userListViewModel.getUserListData { status in
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
    
    private func setUpTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(UserTableViewCell.nib, forCellReuseIdentifier: UserTableViewCell.identifier)
    }

}

extension UserListViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension UserListViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userListViewModel.userList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        guard let userCell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.identifier, for: indexPath) as? UserTableViewCell else {
            fatalError("User cell is not availabel")
        }
        userCell.showMapButton.tag = indexPath.row
        userCell.delegate = self
        userCell.setUpData(user: userListViewModel.userList[indexPath.row])
        
        return userCell
        
    }
}

extension UserListViewController: UserTableViewCellDelegate{
    func showMapButtonPressed(index: Int) {
        let mapVC = self.storyboard?.instantiateViewController(withIdentifier: MapViewController.identifier) as! MapViewController
        mapVC.lattitude = Double(userListViewModel.userList[index].address.geo.lat)
        mapVC.longitude = Double(userListViewModel.userList[index].address.geo.lng)
        self.navigationController?.pushViewController(mapVC, animated: true)
    }
    
    
}
