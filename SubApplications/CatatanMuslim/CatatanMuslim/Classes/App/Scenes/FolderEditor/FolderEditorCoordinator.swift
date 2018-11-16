//
//  FolderEditorCoordinator.swift
//  CatatanMuslim
//
//  Created by PondokiOS on 11/16/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import UIKit
import Common

protocol FolderEditorNavigator: Navigator {
    
}

class FolderEditCoordinator: Coordinator {
    private let navigationController: UINavigationController
    private let session: EditorSession<Folder>
    init(navigationController: UINavigationController, session: EditorSession<Folder>) {
        self.navigationController = navigationController
        self.session = session
    }
    
    func start() {
        guard let vc: FolderEditorController = NibLoader.loadController() else {
            fatalError()
        }
        navigationController.pushViewController(vc, animated: true)
    }
}

extension FolderEditCoordinator: FolderEditorNavigator {
    func back() {
        navigationController.popViewController(animated: true)
    }
}

