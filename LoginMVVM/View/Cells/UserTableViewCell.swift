//
//  UserTableViewCell.swift
//  LoginMVVM
//
//  Created by Narender Kumar on 16/08/22.
//

import UIKit

protocol UserTableViewCellDelegate: AnyObject {
    func showMapButtonPressed(index: Int)
}

class UserTableViewCell: UITableViewCell {
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var userPhone: UILabel!
    @IBOutlet weak var showMapButton: UIButton!
    
    weak var delegate: UserTableViewCellDelegate!

    static var identifier: String {return String(describing: self)}
    static var nib: UINib {return UINib(nibName: identifier, bundle: nil)}
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUpData(user: Users) {
        userName.text = user.name
        userEmail.text = user.email
        userPhone.text = user.phone
    }
    
    @IBAction func showMapButtonPressed(sender: UIButton){
        delegate?.showMapButtonPressed(index: sender.tag)
    }
    
}
