//
//  ViewController.swift
//  CollectionAnimationTest
//
//  Created by David Casserly on 03/08/2015.
//  Copyright (c) 2015 Devedup Ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var dataSource: DataSource!
    
    
    override func viewWillAppear(animated: Bool) {
        self.dataSource = DataSource(colour: UIColor.redColor())
        self.dataSource.cellCount = 10
        self.collectionView.dataSource = self.dataSource
        self.collectionView.reloadData()
    }
    
    @IBAction func loadGreenCells(sender: AnyObject) {
        loadTableWithDataSource(DataSource(colour: UIColor.greenColor()))
    }
    
    
    @IBAction func loadYellowCells(sender: AnyObject) {
        loadTableWithDataSource(DataSource(colour: UIColor.yellowColor()))
    }
    
    
    @IBAction func loadRedCells(sender: AnyObject) {
        loadTableWithDataSource(DataSource(colour: UIColor.redColor()))
    }
    
    func loadTableWithDataSource(dataSource: DataSource) {
        
        var indexPaths = [NSIndexPath]()
        for (var i = 0; i < 10; i++) {
            let indexPath = NSIndexPath(forRow: i, inSection: 0)
            indexPaths.append(indexPath)
        }
        
        
        // First remove the current ones
        self.collectionView.performBatchUpdates({ () -> Void in
            self.dataSource.cellCount = 0
            self.collectionView.deleteItemsAtIndexPaths(indexPaths)
        }, completion: { (finished) -> Void in
            // Setup the new ones and insert
            self.dataSource = dataSource
            self.collectionView.dataSource = dataSource
            self.collectionView.performBatchUpdates({ () -> Void in
                dataSource.cellCount = 10
                self.collectionView.insertItemsAtIndexPaths(indexPaths)
            }, completion:nil)
        })
 
    }
    
}

