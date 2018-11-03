//
//  HomePresenter.swift
//  MuslimApp
//
//  Created by PondokiOS on 11/3/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import Foundation
import SubApplication

class HomePresenter {
    var subApplications: [SubApplication] {
        return SubApplicationManager.shared.applications
    }
}
