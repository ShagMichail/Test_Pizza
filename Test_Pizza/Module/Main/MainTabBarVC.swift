//
//  ViewController.swift
//  Test_Pizza
//
//  Created by Михаил Шаговитов on 13.10.2022.
//

import UIKit

class MainTabBarVC: UITabBarController, UITabBarControllerDelegate {
    
    
    //MARK: - Properties
    
    private let menuVC = UINavigationController(rootViewController: MenuVC())
    private let contactsVC = UINavigationController(rootViewController: ContactsVC())
    private let profileVC = UINavigationController(rootViewController: ProfileVC())
    private let basketVC = UINavigationController(rootViewController: BasketVC())
    
    
    //MARK: - Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstSetup()
        setupView()
        setupButton()
        setupTabBarLayer()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }

    func firstSetup(){
        viewControllers = [menuVC, contactsVC, profileVC, basketVC]
        self.delegate = self
        self.selectedIndex = 0
    }
    
    
    func setupButton(){
 
        UITabBar.appearance().tintColor = .selectedColor
  
        UITabBar.appearance().unselectedItemTintColor = .unselectedColor

        menuVC.tabBarItem = UITabBarItem(title: "Меню", image: #imageLiteral(resourceName: "menu"), tag: 0)

        contactsVC.tabBarItem = UITabBarItem(title: "Контакты", image: #imageLiteral(resourceName: "contacts"), tag: 0)

        profileVC.tabBarItem = UITabBarItem(title: "Профиль", image: #imageLiteral(resourceName: "profile"), tag: 0)

        basketVC.tabBarItem = UITabBarItem(title: "Корзина", image: #imageLiteral(resourceName: "basket"), tag: 0)
    }
    
    func setupView() {
        view.backgroundColor = .background
    }
   
    func setupTabBarLayer() {

        let tabGradientView = UIView(frame: self.tabBar.bounds)
        tabGradientView.backgroundColor = .background
        tabGradientView.translatesAutoresizingMaskIntoConstraints = false;

        self.tabBar.addSubview(tabGradientView)
        self.tabBar.sendSubviewToBack(tabGradientView)
        tabGradientView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        tabGradientView.layer.shadowOffset = CGSize(width: 0, height: 0)
        tabGradientView.layer.shadowRadius = 4.0
        tabGradientView.layer.shadowColor = UIColor.systemGray.cgColor
        tabGradientView.layer.shadowOpacity = 0.6
        self.tabBar.clipsToBounds = false
        self.tabBar.backgroundImage = UIImage()
        self.tabBar.shadowImage = UIImage()
    }
}

