//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Viktoriia Shakleina on 18.02.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 222/255, green: 193/255, blue: 210/255, alpha: 1)
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Профиль"
    }

}
