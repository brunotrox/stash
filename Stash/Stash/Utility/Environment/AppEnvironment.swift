//
//  AppEnvironment.swift
//  Stash
//
//  Created by Bruno Agatte on 6/1/18.
//  Copyright © 2018 Bruno Agatte. All rights reserved.
//

import UIKit

final class AppEnvironment {

	// MARK: - Private properties

	private let jsonFileReader: JSONFileReader = JSONFileReader()
	private let jsonParser: JSONParser = JSONParser()

	// MARK: - Init

	init() {
		let router: Router = Router()
		router.setupRouters(
			withViewControllerBuilder: ViewControllerBuilder(
				router: router,
				resources: self
			)
		)
		router.setupRootViewController()
	}
}

// MARK: - Resources

extension AppEnvironment: Resources {

	var coachResource: CoachResource {
		return LocalCoachResource(
			jsonFileReader: jsonFileReader,
			jsonParser: jsonParser
		)
	}
}
