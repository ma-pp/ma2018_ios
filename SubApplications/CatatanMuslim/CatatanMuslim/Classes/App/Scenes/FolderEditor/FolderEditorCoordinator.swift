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

class FolderEditorCoordinator: Coordinator {
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
        
        vc.navigator = self
        vc.presenter = FolderEditorPresenter(session: session)
        let nav = UINavigationController(rootViewController: vc)
        navigationController
            .topViewController?
            .present(
                nav,
                animated: true,
                completion: nil
        )
    }
}

extension FolderEditorCoordinator: FolderEditorNavigator {
    func back() {
        navigationController
            .topViewController?
            .presentedViewController?
            .dismiss(animated: true, completion: nil)
    }
}

