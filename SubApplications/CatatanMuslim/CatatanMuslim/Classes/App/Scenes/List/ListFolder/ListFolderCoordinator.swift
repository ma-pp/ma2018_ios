//
//  ListFolderCoordinator.swift
//  CatatanMuslim
//
//  Created by PondokiOS on 11/15/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import UIKit

class ListFolderCoordinator: ListItemCoordinator {
    private let navigationController: UINavigationController
    private lazy var context = ListFolderContext(navigator: self)
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        super.init(
            navigationController: navigationController,
            context: context
        )
    }
    
    override func start() {
        let vc = ListItemController()
        
        vc.presenter = context.presenter
        vc.navigator = self
        vc.setupTableView(with: context.tableViewSetup)
        navigationController.pushViewController(
            vc,
            animated: true
        )
    }
    
    // MARK: See ListItemCoordinator.swift
    
    override func selectItem<T>(_ item: T) where T : ListItemSelected {
        guard let folder = item.item as? Folder else { return }
        launchListNote(folder: folder)
    }
    
    override func editItem<T>(_ item: T) where T : ListItemSelected {
        guard let folder = item.item as? Folder else { return }
        launchFolderEditor(session: .edit(folder))
    }
    
    override func newItem<T>(_ type: T.Type) where T : ListItemSelected {
        guard type == Folder.self else { return }
        launchFolderEditor(session: .new)
    }
}

extension ListFolderCoordinator {
    func launchFolderEditor(session: EditorSession<Folder>) {
        
    }
    
    func launchListNote(folder: Folder) {
        let coordinator = ListNoteCoordinator(
            navigationController: navigationController,
            folder: folder
        )
        coordinator.start()
    }
}
