//
//  DataSource.swift
//  CollectionAnimationTest
//
//  Created by David Casserly on 03/08/2015.
//  Copyright (c) 2015 Devedup Ltd. All rights reserved.
//

import UIKit

class DataSource: NSObject, UICollectionViewDataSource {
    
    var cellCount: Int = 0
    let cellColour: UIColor
    
    init(colour: UIColor) {
        self.cellColour = colour
    }
    
    @objc func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.cellCount
    }
    
    @objc func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell: CollectionCell = collectionView.dequeueReusableCellWithReuseIdentifier("CollectionViewCell", forIndexPath: indexPath) as! CollectionCell
        cell.backgroundColor = self.cellColour
        return cell
    }
    
}
