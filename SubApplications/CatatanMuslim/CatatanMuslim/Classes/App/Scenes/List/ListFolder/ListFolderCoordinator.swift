//
//  ListFolderCoordinator.swift
//  CatatanMuslim
//
//  Created by PondokiOS on 11/15/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import UIKit

protocol ListFolderNavigator {
    func launchFolderEditor(session: EditorSession<Folder>)
    func launchListNote(folder: Folder)
}

class ListFolderCoordinator: Coordinator {
    private let navigationController: UINavigationController
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    private lazy var context = ListFolderContext(navigator: self)
    
    func start() {
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
    }
}

extension ListFolderCoordinator: ListItemNavigator {
    func back() {
        fatalError("There is no back button for current design!")
    }
    
    // MARK: See ListItemCoordinator.swift
    
    func selectItem<T>(_ item: T) where T : ListItemSelected {
        guard let folder = item.item as? Folder else { return }
        launchListNote(folder: folder)
    }
    
    func editItem<T>(_ item: T) where T : ListItemSelected {
        guard let folder = item.item as? Folder else { return }
        launchFolderEditor(session: .edit(folder))
    }
}

extension ListFolderCoordinator: ListItemContainerNavigator {
    func makeNewItem() {
        launchFolderEditor(session: .new)
    }
}

extension ListFolderCoordinator: ListFolderNavigator {
    func launchFolderEditor(session: EditorSession<Folder>) {
        let coordinator = FolderEditorCoordinator(
            navigationController: navigationController,
            session: session
        )
        coordinator.start()
    }
    
    func launchListNote(folder: Folder) {
        let coordinator = ListNoteCoordinator(
            navigationController: navigationController,
            folder: folder
        )
        coordinator.start()
    }
}
