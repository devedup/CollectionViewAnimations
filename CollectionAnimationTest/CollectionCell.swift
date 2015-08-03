//
//  CollectionCell.swift
//  CollectionAnimationTest
//
//  Created by David Casserly on 03/08/2015.
//  Copyright (c) 2015 Devedup Ltd. All rights reserved.
//

import UIKit

class CollectionCell: UICollectionViewCell {
    
    // Classes that want to support custom layout attributes specific to a given UICollectionViewLayout subclass can apply them here.
    // This allows the view to work in conjunction with a layout class that returns a custom subclass of UICollectionViewLayoutAttributes from -layoutAttributesForItem: or the corresponding layoutAttributesForHeader/Footer methods.
    // -applyLayoutAttributes: is then called after the view is added to the collection view and just before the view is returned from the reuse queue.
    // Note that -applyLayoutAttributes: is only called when attributes change, as defined by -isEqual:.
    override func applyLayoutAttributes(layoutAttributes: UICollectionViewLayoutAttributes!) {
        let cellLayoutAttributes: CellLayoutAttributes = layoutAttributes as! CellLayoutAttributes
        self.layer.addAnimation(cellLayoutAttributes.animation, forKey: "LayoutAnimation")
    }
    
}
