//
//  NoteEditorCoordinator.swift
//  CatatanMuslim
//
//  Created by PondokiOS on 11/21/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import UIKit
import Common

protocol NoteEditorNavigator: Navigator {
    
}

class NoteEditorCoordinator: Coordinator {
    private let navigationController: UINavigationController
    private let session: EditorSession<Note>
    
    init(navigationController: UINavigationController, session: EditorSession<Note>) {
        self.navigationController = navigationController
        self.session = session
    }
    
    func start() {
        let vc = NoteEditorController()
        vc.navigator = self
        vc.presenter = NoteEditorPresenter(session: session)
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

extension NoteEditorCoordinator: NoteEditorNavigator {
    func back() {
        navigationController
            .topViewController?
            .presentedViewController?
            .dismiss(animated: true, completion: nil)
    }
}
