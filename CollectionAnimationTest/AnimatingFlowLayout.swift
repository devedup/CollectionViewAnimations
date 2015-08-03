//
//  AnimatingFlowLayout.swift
//  CollectionAnimationTest
//
//  Created by David Casserly on 03/08/2015.
//  Copyright (c) 2015 Devedup Ltd. All rights reserved.
//

import UIKit

class AnimatingFlowLayout: UICollectionViewFlowLayout {
 
    override class func layoutAttributesClass() -> AnyClass {
        return CellLayoutAttributes.self
    }
    
    override func initialLayoutAttributesForAppearingItemAtIndexPath(itemIndexPath: NSIndexPath) -> UICollectionViewLayoutAttributes? {
        let attributes: CellLayoutAttributes = super.initialLayoutAttributesForAppearingItemAtIndexPath(itemIndexPath) as! CellLayoutAttributes
        
        // Start them off at the far right and finish them in their original place
        let startX = CGRectGetWidth(self.collectionView!.frame)
        let startTransform: CATransform3D = CATransform3DMakeTranslation(startX, 0, 0)
        let endTransform: CATransform3D = CATransform3DIdentity
        
        // Build a basic animation that animates the transform property
        let transformAnimation = CABasicAnimation(keyPath: "transform")
        transformAnimation.fromValue = NSValue(CATransform3D:startTransform)
        transformAnimation.toValue = NSValue(CATransform3D:endTransform)
        
        transformAnimation.duration = 0.4
        
        // If you add a staggered begin time, you need to change the fill mode to Backwards
        // https://developer.apple.com/library/ios/documentation/Cocoa/Conceptual/CoreAnimation_guide/AdvancedAnimationTricks/AdvancedAnimationTricks.html
        /*

            If you delay the start of an animation, you might also want to set the fillMode property to kCAFillModeBackwards. This fill mode causes the layer to display the animation’s start value, even if the layer object in the layer tree contains a different value. Without this fill mode, you would see a jump to the final value before the animation starts executing. Other fill modes are available too.

        */
        transformAnimation.beginTime = CACurrentMediaTime() + Double((0.05 * Float(itemIndexPath.row)))
        transformAnimation.fillMode = kCAFillModeBackwards
        
        attributes.animation = transformAnimation
        
        return attributes
    }
    
    override func finalLayoutAttributesForDisappearingItemAtIndexPath(itemIndexPath: NSIndexPath) -> UICollectionViewLayoutAttributes? {
        let attributes: CellLayoutAttributes = super.finalLayoutAttributesForDisappearingItemAtIndexPath(itemIndexPath) as! CellLayoutAttributes

        // Default is 0, if I set it to 1.0 you don't see anything happen..'
        attributes.alpha = 0.5
        
        let endX = -CGRectGetWidth(self.collectionView!.frame)
        let startTransform: CATransform3D = CATransform3DIdentity
        let endTransform: CATransform3D = CATransform3DMakeTranslation(endX, 0, 0)
        
        let transformAnimation = CABasicAnimation(keyPath: "transform")
        transformAnimation.fromValue = NSValue(CATransform3D:startTransform)
        transformAnimation.toValue = NSValue(CATransform3D:endTransform)
        transformAnimation.duration = 0.4
        transformAnimation.beginTime = CACurrentMediaTime() + Double((0.04 * Float(itemIndexPath.row)))
        transformAnimation.fillMode = kCAFillModeForwards
        
        attributes.animation = transformAnimation
        
        return attributes
    }
    
}
