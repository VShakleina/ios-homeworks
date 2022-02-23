//
//  PrView.swift
//  Navigation
//
//  Created by Viktoriia Shakleina on 19.02.2022.
//

import UIKit

class ProfileHeaderView: UIView {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var statusShowButton: UIButton!
    @IBOutlet weak var newStatusTextField: UITextField!
    @IBOutlet weak var statusToButtonConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageToButtonConstraint: NSLayoutConstraint!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func setupView() {
        let view = self.loadViewFromXib()
        self.addSubview(view)
        view.frame = self.bounds
        self.settingForImage()
        self.settingForStatusButton()
        self.settingForStatusTextField()
    }

    private func loadViewFromXib() -> UIView {
        guard let view = Bundle.main.loadNibNamed("ProfileHeaderView", owner: self, options: nil)?.first as? UIView else { return UIView() }
        return view
    }

    private func settingForImage() {
        profileImage.layer.cornerRadius = self.profileImage.frame.height / 2
        profileImage.layer.borderWidth = 3
        profileImage.layer.borderColor = UIColor.white.cgColor
    }

    private func settingForStatusButton() {
        statusShowButton.addTarget(self, action: #selector(didTapShowStatusButton), for: .touchUpInside)
        statusShowButton.layer.cornerRadius = 4
       // statusShowButton.layer.shadowPath = UIBezierPath(rect: self.statusShowButton.bounds).cgPath   для оптимизации просит использовать shadowPath, но я пока не поняла, как именно он работает, попозже разберусь, поэтому закомментила)
        statusShowButton.layer.shadowOffset.height = 4
        statusShowButton.layer.shadowOffset.width = 4
        statusShowButton.layer.shadowRadius = 4
        statusShowButton.layer.shadowColor = UIColor.black.cgColor
        statusShowButton.layer.shadowOpacity = 0.7
        statusShowButton.setTitle("Show status", for: .normal)
        statusToButtonConstraint?.priority = UILayoutPriority(rawValue: 999)
        imageToButtonConstraint?.priority = UILayoutPriority(rawValue: 999)
    }

    private func settingForStatusTextField() {
        newStatusTextField.isHidden = true
        newStatusTextField.layer.borderWidth = 1
        newStatusTextField.layer.borderColor = UIColor.black.cgColor
        newStatusTextField.layer.cornerRadius = 12
        newStatusTextField.clipsToBounds = true
    }

    @objc private func didTapShowStatusButton() {
        if newStatusTextField.isHidden {
            self.imageToButtonConstraint.constant = 56
            self.statusToButtonConstraint.constant = 74
            self.statusShowButton.setTitle("Set status", for: .normal)
            self.newStatusTextField.alpha = 1
        } else {
            self.imageToButtonConstraint.constant = 16
            self.statusToButtonConstraint.constant = 34
            self.statusShowButton.setTitle("Show status", for: .normal)
            self.newStatusTextField.alpha = 0 // если не использовать alpha, то текстфилд накладывается на кнопку
            if newStatusTextField.hasText {
                if let text = newStatusTextField.text {
                    print(text)
                    self.statusLabel.text = text
                }
            }
            self.newStatusTextField.text = ""
        }
        UIView.animate(withDuration: 0.5) {
            self.layoutIfNeeded()
        } completion: { _ in
            self.newStatusTextField.isHidden.toggle()
        }
    }
}
