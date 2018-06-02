//
//  AchievementCollectionViewCell.swift
//  Stash
//
//  Created by Bruno Agatte on 6/1/18.
//  Copyright © 2018 Bruno Agatte. All rights reserved.
//

import UIKit

class AchievementCollectionViewCell: UICollectionViewCell {

	// MARK: - IBOutlets

	@IBOutlet private weak var levelView: UIView!
	@IBOutlet private weak var levelNumberLabel: UILabel!
	@IBOutlet private weak var currentProgressLabel: UILabel!
	@IBOutlet private weak var totalProgressLabel: UILabel!
	@IBOutlet private weak var backgroundImageView: UIImageView!
	@IBOutlet private weak var activityIndicatorView: UIView!
	@IBOutlet private weak var activityIndicator: UIActivityIndicatorView!

	// MARK: - Public methods

	func layout(withViewModel viewModel: AchievementViewModel) {
		activityIndicator.startAnimating()

		levelView.layer.cornerRadius = levelView.frame.size.width / 2
		backgroundImageView.layer.cornerRadius = 10
		backgroundImageView.layer.masksToBounds = true

		levelNumberLabel.text = viewModel.level

		currentProgressLabel.text = viewModel.currentPoints
		totalProgressLabel.text = viewModel.totalPoints

		if let url = viewModel.imageUrl {
			URLSession.fetchDataFromUrl(url) { (data, urlResponse, error) in
				guard let data = data else {
					return
				}

				DispatchQueue.main.async { [weak self] in
					self?.alpha = viewModel.isAccessible ? 1 : 0.3

					self?.backgroundImageView.image = UIImage(data: data)
					self?.activityIndicator.stopAnimating()
					self?.activityIndicatorView.isHidden = true
				}
			}
		}
	}
}
