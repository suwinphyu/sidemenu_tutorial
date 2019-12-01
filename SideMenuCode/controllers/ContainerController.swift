//
//  ContainerController.swift
//  SideMenuSample
//
//  Created by Su Win Phyu on 12/1/19.
//  Copyright © 2019 swp. All rights reserved.
//

import UIKit

class ContainerController: UIViewController {
    
    var menucontroller : MenuController!
    var centerController: UIViewController!
    var isExpanded = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHomeController()
        
        
    }
    
    
    
    // MARK: - side menu
    
    func configureHomeController(){
        let homecontroller = HomeController()
        homecontroller.delegate = self
        centerController = UINavigationController(rootViewController: homecontroller)
        view.addSubview(centerController.view)
        addChild(centerController)
        centerController.didMove(toParent: self)
    }
    
    func configureMenuController(){
        if menucontroller == nil{
            menucontroller = MenuController()
            menucontroller.delegate = self
            view.insertSubview(menucontroller.view, at: 0)
            addChild(menucontroller)
            menucontroller.didMove(toParent: self)
            print("menu")
            
        }
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    func showSideMenu(shouldExpand : Bool){
        if shouldExpand{
            //MARK - show menu
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.centerController.view.frame.origin.x = self.centerController.view.frame.width - 100
            }, completion: nil)
        }
        else {
            //MARK - hide menu
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.centerController.view.frame.origin.x = 0
            }, completion: nil)
        }
    }
    
}

extension ContainerController : SideMenuDelegate{
    func handleMenuToggle() {
        if !isExpanded{
            configureMenuController()
            
        }
        isExpanded = !isExpanded
        showSideMenu(shouldExpand: isExpanded)
    }
}
