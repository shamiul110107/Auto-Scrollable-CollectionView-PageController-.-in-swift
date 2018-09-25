//
//  PagingCollectionVIew.swift
//  PageControllerDemo
//
//  Created by Rocky Ahmed  on 26/9/18.
//  Copyright © 2018 Rocky Ahmed . All rights reserved.
//

import UIKit

class PagingCollectionVIew: UICollectionView {
    
    private var timer = Timer()
    var scrollInterval: Int = 2

    override func awakeFromNib() {
        super.awakeFromNib()
        self.isPagingEnabled = true
    }
    
    func startScrolling() {
        if !timer.isValid {
            if self.numberOfItems(inSection: 0) != 0 {
                
                setTimer()
            }
        }
    }
    
    deinit { stopTimer() }
    
    func stopTimer() {
        
        if timer.isValid {
            self.timer.invalidate()
            
        }
    }
    
    fileprivate func setTimer() {
        self.timer = Timer.scheduledTimer(timeInterval: TimeInterval(scrollInterval), target: self, selector: #selector(self.autoScrollImageSlider), userInfo: nil, repeats: true)
        RunLoop.main.add(self.timer, forMode: .common)
    }
    
    @objc fileprivate func autoScrollImageSlider() {
        DispatchQueue.main.async {
            let firstIndex = 0
            let lastIndex = self.numberOfItems(inSection: 0) - 1
            let visibleCellsIndexes = self.indexPathsForVisibleItems.sorted()
            
            if !visibleCellsIndexes.isEmpty {
                let nextIndex = visibleCellsIndexes[0].row + 1
                let nextIndexPath: IndexPath = IndexPath.init(item: nextIndex, section: 0)
                let firstIndexPath: IndexPath = IndexPath.init(item: firstIndex, section: 0)
                
                (nextIndex > lastIndex) ? (self.scrollToItem(at: firstIndexPath, at: .centeredHorizontally, animated: true)) : (self.scrollToItem(at: nextIndexPath, at: .centeredHorizontally, animated: true))
            }
        }
    }
  
}
