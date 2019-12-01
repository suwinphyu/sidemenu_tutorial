//
//  HomeController.swift
//  SideMenuCode
//
//  Created by Su Win Phyu on 12/1/19.
//  Copyright © 2019 swp. All rights reserved.
//

import UIKit

class HomeController: UIViewController {

    var delegate : SideMenuDelegate?
  
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        configureNavigationBar()
    }
    


    // MARK: - Navigationbar
    func configureNavigationBar(){
        navigationController?.navigationBar.barTintColor = .darkGray
        navigationController?.navigationBar.barStyle = .black
        navigationItem.title = "Side Menu"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "icons8-menu").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMenuToggle))
    }

    @objc func handleMenuToggle(){
        delegate?.handleMenuToggle()
    }
    


}
