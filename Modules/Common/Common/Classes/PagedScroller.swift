//
//  PagedScroller.swift
//  Common
//
//  Created by PondokiOS on 11/4/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import UIKit

/**
 TODO: http://www.iosnomad.com/blog/2014/4/21/fluent-pagination
 */

public class PagedScroller {
    public typealias PagePrepared = () -> Void
    
    private var preparePageCallback: (PagePrepared) -> Void = { _ in
        print("Preparing not set!")
    }
    
    private weak var scrollView: UIScrollView?
    
    private var offsetObservation: NSKeyValueObservation?
    private var isPreparingPage = false
    
    public init(scrollView: UIScrollView) {
        self.scrollView = scrollView
        setupObservation()
    }
    
    private func setupObservation() {
        offsetObservation = scrollView?.observe(\.contentOffset, options: [.new, .old], changeHandler: { [unowned self] (scrollView, value) in
            self.scrollViewOffsetChange(
                currentSize: scrollView.contentSize,
                newOffset: value.newValue ?? CGPoint.zero,
                oldOffset: value.oldValue ?? CGPoint.zero
            )
        })
    }
    
    deinit {
        offsetObservation?.invalidate()
    }
    
    private func scrollViewOffsetChange(
        currentSize: CGSize,
        newOffset: CGPoint,
        oldOffset: CGPoint ) {
        
        guard newOffset.y > oldOffset.y else { return }
        let outViewPortHeight = currentSize.height - (scrollView?.bounds.height ?? 0.0)
        print("""
            OutViewPortHeight \(outViewPortHeight)
            CurrentSizeHeight \(currentSize.height)
            BoundsHeight \(scrollView?.bounds.height ?? 0.0)
            
            """)
        let isExceedTreshold = newOffset.y > outViewPortHeight
        
        if isExceedTreshold && !isPreparingPage  {
            isPreparingPage = true
            self.preparePageCallback({ [unowned self] in
                self.isPreparingPage = false
            })
        }
    }
    
    // MARK: Client Method
    
    public func preparePage(completion: @escaping (PagePrepared) -> Void) {
        preparePageCallback = completion
    }
}
