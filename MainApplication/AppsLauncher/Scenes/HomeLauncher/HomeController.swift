//
//  HomeController.swift
//  MuslimApp
//
//  Created by PondokiOS on 11/2/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import UIKit
import SubApplication
import Common

class HomeController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var navigator: HomeNavigator!
    var presenter: HomePresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationItem()
        setupCollectionView()
    }
    
    private func setupNavigationItem() {
        let notificationImage = UIImage(
            named: AssetFileNames.notif_button,
            in: Constant.bundle,
            compatibleWith: nil
        )
        
        let notificationBarButton = UIBarButtonItem(
            image: notificationImage,
            style: .plain,
            target: self,
            action: #selector(launchNotification)
        )
        
        let profileImage = UIImage(
            named: AssetFileNames.profile_button,
            in: Constant.bundle,
            compatibleWith: nil
        )
        
        let profileBarButton = UIBarButtonItem(
            image: profileImage,
            style: .plain,
            target: self,
            action: #selector(launchProfile)
        )
        
        navigationItem.leftBarButtonItem = notificationBarButton
        navigationItem.rightBarButtonItem = profileBarButton
    }
    
    @objc func launchNotification() {
        navigator.launchNotification()
    }
    
    @objc func launchProfile() {
        navigator.launchProfile()
    }
    
    private func setupCollectionView() {
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.registerReusableCell(LauncherCell.self)
    }
}

extension HomeController: UICollectionViewDataSource {
    
    private var items: [SubApplication] {
        return presenter.subApplications
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: LauncherCell = collectionView
            .dequeueReusableCell(for: indexPath) else {
            fatalError()
        }
        let item = items[indexPath.row]
        cell.configureCell(with: item)
        return cell
    }
}

extension HomeController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let subApplication = items[indexPath.row]
        navigator.launchSubApplication(subApplication)
    }
}

extension HomeController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 170)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}
