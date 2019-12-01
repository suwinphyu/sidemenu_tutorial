//
//  MenuController.swift
//  SideMenuCode
//
//  Created by Su Win Phyu on 12/1/19.
//  Copyright © 2019 swp. All rights reserved.
//

import UIKit

class MenuController: UIViewController {
    
    
    var delegate: SideMenuDelegate?
    var tableView : UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // view.backgroundColor = .cyan
        configureTableView()
        
        
        
    }
    
    func configureTableView(){
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MenuOptionTableViewCell.self, forCellReuseIdentifier: String(describing: MenuOptionTableViewCell.identifier))
        
        tableView.separatorStyle = .none
        tableView.rowHeight = 80
        tableView.backgroundColor = .darkGray
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
    }
    
    
}

extension MenuController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let menuOption = MenuOption(rawValue: indexPath.row)
        delegate?.handleMenuToggle()
       
    }
}

extension MenuController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MenuOptionTableViewCell.identifier), for: indexPath) as! MenuOptionTableViewCell
        let menuOption = MenuOption(rawValue: indexPath.row)
        cell.descriptionLabel.text = menuOption?.description
        cell.iconImageView.image = menuOption?.menuImage
        
        return cell
    }
}
