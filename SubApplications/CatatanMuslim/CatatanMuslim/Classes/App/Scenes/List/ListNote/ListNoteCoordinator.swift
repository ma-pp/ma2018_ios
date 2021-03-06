//
//  ListNoteCoordinator.swift
//  CatatanMuslim
//
//  Created by PondokiOS on 11/15/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import Foundation
import Logging

protocol ListNoteNavigator {
    func launchNoteEditor(session: EditorSession<Note>)
}

class ListNoteCoordinator {
    private let navigationController: UINavigationController
    
    private let folder: Folder
    
    init(navigationController: UINavigationController, folder: Folder) {
        self.navigationController = navigationController
        self.folder = folder
    }
    
    private var context: ListNoteContext?
    
    func start() {
        let context = ListNoteContext(navigator: self, folder: folder)
        let vc = ListItemController()
        vc.presenter = context.presenter
        vc.navigator = self
        vc.setupTableView(with: context.tableViewSetup)
        let viewController = ListItemContainerController(
            listItemController: vc
        )
        viewController.navigator = self
        navigationController.pushViewController(
            viewController,
            animated: true
        )
        
        self.context = context // Retain
    }
}

extension ListNoteCoordinator: ListItemNavigator {
    func back() {
        navigationController.popViewController(animated: true)
    }
    
    func editItem<T>(_ item: T) where T : ListItemSelected {
        guard let note = item.item as? Note else { return }
        launchNoteEditor(session: .edit(note))
    }
    
    func selectItem<T>(_ item: T) where T : ListItemSelected {
        guard let note = item.item as? Note else { return }
        launchNoteEditor(session: .edit(note))
    }
}

extension ListNoteCoordinator: ListItemContainerNavigator {
    func makeNewItem() {
        launchNoteEditor(session: .new)
    }
}

extension ListNoteCoordinator {
    // MARK: NoteNavigation
    
    func launchNoteEditor(session: EditorSession<Note>) {
        
    }
}
