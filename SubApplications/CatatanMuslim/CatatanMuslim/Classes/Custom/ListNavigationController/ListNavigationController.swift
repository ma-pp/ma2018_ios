//
//  ListNavigationController.swift
//  CatatanMuslim
//
//  Created by PondokiOS on 11/16/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import UIKit
import Common

public class ListNavigationController: UINavigationController {
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
    }
    
    lazy var tabBar: SimpleTabBar = {
        return NibLoader.load(SimpleTabBar.self)!
    }()
    
    private let badgeSetting = (
        size: CGFloat(7.5),
        padding: (
            top: CGFloat(3),
            right: CGFloat(3)
        )
    )
    
    private func setupNewItemButton() {
        let newButton = tabBar.newButton
        newButton?.addTarget(self, action: #selector(makeNewItem), for: .touchUpInside)
    }
    
    let toggleUnreadButton = BadgedButton()
    private func setupToggleUnreadButton() {
        toggleUnreadButton.setTitle("Unread", for: .normal)
        toggleUnreadButton.setTitleColor(.black, for: .normal)
        let btn = toggleUnreadButton
        btn.badge.size = badgeSetting.size
        btn.badge.topPadding = badgeSetting.padding.top
        btn.badge.rightPadding = badgeSetting.padding.right
        toggleUnreadButton.addTarget(self, action: #selector(toggleUnread), for: .touchUpInside)
    }
    
    let toggleGridButton = UIButton()
    private func setupToggleGridButton() {
        toggleGridButton.setTitle("Grid", for: .normal)
        toggleGridButton.setTitleColor(.black, for: .normal)
        toggleGridButton.addTarget(self, action: #selector(toggleGrid), for: .touchUpInside)
    }
    
    let showDiscussionButton = BadgedButton()
    private func setupShowDiscussionButton() {
        showDiscussionButton.setTitle("Discuss", for: .normal)
        showDiscussionButton.setTitleColor(.black, for: .normal)
        let btn = showDiscussionButton
        btn.badge.size = badgeSetting.size
        btn.badge.topPadding = badgeSetting.padding.top
        btn.badge.rightPadding = badgeSetting.padding.right
        showDiscussionButton.addTarget(self, action: #selector(showDiscussion), for: .touchUpInside)
    }
    
    private func setupTabBar() {
        tabBar.addButton(toggleUnreadButton)
        tabBar.addButton(toggleGridButton)
        tabBar.addButton(showDiscussionButton)
        
        setupTabBarConstraint()
        
        setupNewItemButton()
        setupToggleUnreadButton()
        setupToggleGridButton()
        setupShowDiscussionButton()
    }
    
    private func setupTabBarConstraint() {
        // See XIB!
        let tabBarViewHeight: CGFloat = 70
        
        tabBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tabBar)
        view.bringSubview(toFront: tabBar)
        tabBar.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tabBar.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tabBar.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tabBar.heightAnchor.constraint(equalToConstant: tabBarViewHeight).isActive = true
    }
    
    private var tabBarResponders: [ListNavTabBarResponder] = []
    
    private var currentResponder: ListNavTabBarResponder? {
        return tabBarResponders.last
    }
    
    public override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        guard let responder = viewController as? ListNavTabBarResponder else { return }
        tabBarResponders.append(responder)
        super.pushViewController(viewController, animated: animated)
    }
    
    public override func popViewController(animated: Bool) -> UIViewController? {
        let vc = super.popViewController(animated: animated)
        let responder = tabBarResponders.removeLast()
        assert(vc?.isEqual(responder) ?? false)
        return vc
        
    }
    
    @objc
    private func makeNewItem() {
        currentResponder?.makeNewItem()
    }
    
    @objc
    private func toggleUnread() {
        currentResponder?.toggleUnread()
    }
    
    @objc
    private func toggleGrid() {
        currentResponder?.toggleGrid()
    }
    
    @objc
    private func showDiscussion() {
        currentResponder?.showDiscussion()
    }
}
