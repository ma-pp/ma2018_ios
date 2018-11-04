//
//  PagedScroller.swift
//  Common
//
//  Created by PondokiOS on 11/4/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import UIKit

public class PagedScroller {
    private var preparePageCallback: () -> Void = { print("Preparing not set!") }
    
    private weak var scrollView: UIScrollView?
    
    private var offsetObservation: NSKeyValueObservation?
    
    public init(scrollView: UIScrollView) {
        self.scrollView = scrollView
        setupObservation()
    }
    
    private func setupObservation() {
        offsetObservation = scrollView?.observe(\.contentOffset, options: [.new, .old], changeHandler: { [unowned self] (scrollView, value) in
            
            self.preparePageCallback()
        })
    }
    
    deinit {
        offsetObservation?.invalidate()
    }
    
    public func preparePage(completion: @escaping () -> Void) {
        preparePageCallback = completion
    }
    
    public func pagePrepared() {
        
    }
}
