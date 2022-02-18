//
//  FeedViewController.swift
//  Navigation
//
//  Created by Viktoriia Shakleina on 18.02.2022.
//

import UIKit

class FeedViewController: UIViewController {

    private lazy var postButton: UIButton = {
        let postButton = UIButton()
        postButton.setTitle("Показать пост", for: .normal)
        postButton.setTitleColor(UIColor(red: 105/255, green: 40/255, blue: 63/255, alpha: 1), for: .normal)
        postButton.backgroundColor = .white
        postButton.layer.cornerRadius = 12
        postButton.clipsToBounds = true
        postButton.addTarget(self, action: #selector(didTapPostButton), for: .touchUpInside)
        postButton.translatesAutoresizingMaskIntoConstraints = false
        return postButton 
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 222/255, green: 193/255, blue: 210/255, alpha: 1)
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Лента"
        self.navigationItem.backButtonTitle = ""
        self.view.addSubview(self.postButton)
        self.addConstraintForPostButton()
    }

    private func addConstraintForPostButton() {
        self.postButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100).isActive = true
        self.postButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        self.postButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        self.postButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

    @objc private func didTapPostButton() {
        let postVC = PostViewController()
        postVC.closure = {
        }
        self.navigationController?.pushViewController(postVC, animated: true)
    }

}

