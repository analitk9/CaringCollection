//
//  CollectionFlowLayout.swift
//  CaringCollection
//
//  Created by Denis Evdokimov on 11/27/23.
//

import UIKit

class CollectionFlowLayout: UICollectionViewFlowLayout {
    
    
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint,
                                      withScrollingVelocity velocity: CGPoint) -> CGPoint {
        
        guard let collectionView = self.collectionView else {
            let latestOffset = super.targetContentOffset(forProposedContentOffset: proposedContentOffset,
                                                         withScrollingVelocity: velocity)
            return latestOffset
        }
        
        let pageWidth = itemSize.width + minimumInteritemSpacing
        let approximatePage = collectionView.contentOffset.x/pageWidth
        
        let velocityX =  velocity.x
        let currentPage: CGFloat
        
        if velocityX == 0 {
            currentPage = round(approximatePage)
        } else if velocityX < 0 {
            currentPage = floor(approximatePage) // округляем вниз
        } else {
            currentPage = ceil(approximatePage) // округляем вверх
        }
        
        let flickedPages = (abs(round(velocityX)) <= 1) ? 0 : round(velocityX)
        
        let newHorizontalOffset = ((currentPage + flickedPages) * pageWidth) - collectionView.contentInset.left - minimumInteritemSpacing
        
        return CGPoint(x: newHorizontalOffset, y: proposedContentOffset.y)
    }
}
