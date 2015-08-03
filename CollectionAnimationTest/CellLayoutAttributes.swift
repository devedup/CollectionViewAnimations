//
//  CellLayoutAttributes.swift
//  CollectionAnimationTest
//
//  Created by David Casserly on 03/08/2015.
//  Copyright (c) 2015 Devedup Ltd. All rights reserved.
//

import UIKit

class CellLayoutAttributes: UICollectionViewLayoutAttributes {
   
    var animation: CABasicAnimation?
    
    override func copyWithZone(zone: NSZone) -> AnyObject {
        let attributes: CellLayoutAttributes = super.copyWithZone(zone) as! CellLayoutAttributes
        attributes.animation = self.animation
        return attributes
    }
    
    // Note that -applyLayoutAttributes: in UITableViewCell is only called when attributes change, as defined by -isEqual:.
    override func isEqual(object: AnyObject?) -> Bool {
        if let object = object as? CellLayoutAttributes {
            if let animation = animation {
                let returnValue = animation.isEqual(object.animation) && self.alpha == object.alpha
                return returnValue
            } else {
                return false
            }
        } else {
            return false
        }
    }
    
    override var hash: Int {
        return self.animation!.hashValue
    }
    
}
