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
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.numberOfLines = 0
        return label
    }()
    
    private var createdLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 12)
        label.numberOfLines = 0
        return label
    }()
    
    private var closedLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 12)
        label.numberOfLines = 0
        return label
    }()
    
    private var usernameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.numberOfLines = 0
        return label
    }()
    
    private var userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    // MARK: - Properties
    
    private let userImageSize = CGSize(width: 50, height: 50)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setup() {
        setupUI()
        setupConstraints()
    }
    
    private func setupUI() {
        userImageView.addCorner(with: userImageSize.height/2, borderColor: .gray, borderWidth: 1.0)
    }
    
    private func setupConstraints() {
        setupContainerViewConstraints()
        setupUserImageConstraints()
        setupTitleLabelConstraints()
        setupCreatedLabelConstraints()
        setupClosedLabelConstraints()
        setupUsernameLabelConstraints()
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
            userImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            userImageView.leftAnchor.constraint(equalTo: containerView.leftAnchor,
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
            titleLabel.leftAnchor.constraint(equalTo: userImageView.rightAnchor,
                                             constant: Constants.paddingEight),
            titleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 20.0),
            titleLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor,
                                              constant: -Constants.paddingSixteen)
        ])
    }
    
    private func setupCreatedLabelConstraints() {
        containerView.addSubview(createdLabel)
        createdLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            createdLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
                                              constant: 2.0),
            createdLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor),
            createdLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 20.0),
            createdLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor,
                                              constant: -Constants.paddingSixteen)
        ])
    }
    
    private func setupClosedLabelConstraints() {
        containerView.addSubview(closedLabel)
        closedLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            closedLabel.topAnchor.constraint(equalTo: createdLabel.bottomAnchor,
                                             constant: 2.0),
            closedLabel.leftAnchor.constraint(equalTo: createdLabel.leftAnchor),
            closedLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 20.0),
            closedLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor,
                                              constant: -Constants.paddingSixteen)
        ])
    }
    
    private func setupUsernameLabelConstraints() {
        containerView.addSubview(usernameLabel)
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            usernameLabel.topAnchor.constraint(equalTo: closedLabel.bottomAnchor,
                                             constant: 2.0),
            usernameLabel.leftAnchor.constraint(equalTo: closedLabel.leftAnchor),
            usernameLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor,
                                              constant: -Constants.paddingSixteen),
            usernameLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 20.0),
            usernameLabel.bottomAnchor.constraint(lessThanOrEqualTo: containerView.bottomAnchor,
                                                  constant: -Constants.paddingEight)
        ])
    }
    
    func configure(with pullRequest: HomeModel) {
        titleLabel.text = pullRequest.title
        createdLabel.text = "Created At: " + Utils.getFormattedDate(dateString: pullRequest.createdAt!,
                                                   currentFomat: "yyyy-MM-dd'T'HH:mm:ssZ",
                                                   expectedFromat: "MMM d, h:mm a")
        closedLabel.text = "Closed At: " + Utils.getFormattedDate(dateString: pullRequest.closedAt!,
                                                  currentFomat: "yyyy-MM-dd'T'HH:mm:ssZ",
                                                  expectedFromat: "MMM d, h:mm a")
        usernameLabel.text = pullRequest.user.login
        userImageView.loadThumbnail(urlSting: pullRequest.user.userImageUrlString)
    }
}
