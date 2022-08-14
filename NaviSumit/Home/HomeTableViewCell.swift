//
//  HomeTableViewCell.swift
//  NaviSumit
//
//  Created by Sumit Kumar on 14/08/22.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    private var containerView: UIView = {
        let view = UIView()
        return view
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello"
        label.textAlignment = .left
        return label
    }()
    
    private var createdLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        return label
    }()
    
    private var closedLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        return label
    }()
    
    private var usernameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        return label
    }()
    
    private var userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    // MARK: - Properties
    
    private let userImageSize = CGSize(width: 100, height: 100)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    private func setup() {
        setupUI()
        setupConstraints()
    }
    
    private func setupUI() {
        
    }
    
    private func setupConstraints() {
        setupContainerViewConstraints()
        setupUserImageConstraints()
        setupTitleLabelConstraints()
    }
    
    private func setupContainerViewConstraints() {
        contentView.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            containerView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    private func setupUserImageConstraints() {
        containerView.addSubview(userImageView)
        userImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userImageView.topAnchor.constraint(equalTo: contentView.topAnchor,
                                               constant: Constants.paddingEight),
            userImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor,
                                                constant: Constants.paddingSixteen),
            userImageView.heightAnchor.constraint(equalToConstant: userImageSize.height),
            userImageView.widthAnchor.constraint(equalToConstant: userImageSize.width)
        ])
    }
    
    private func setupTitleLabelConstraints() {
        containerView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor,
                                            constant: Constants.paddingEight),
            titleLabel.leftAnchor.constraint(equalTo: userImageView.rightAnchor),
            titleLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor,
                                              constant: -Constants.paddingSixteen)
        ])
    }
    
}
