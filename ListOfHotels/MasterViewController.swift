//
//  MasterViewController.swift
//  ListOfHotels
//
//  Created by Tomasz Kuzma on 24/03/2016.
//  Copyright © 2016 Expedia. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController {
    
    var collectionView: UICollectionView!
    var dataSource: DataSource!

    var detailViewController: DetailViewController? = nil
    var hotels = [Hotel]() {
        didSet {
            self.reloadData()
        }
    }
    lazy var fetcher: HotelFetcher = {
        HotelFetcher(network: Network())
    }()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = UIColor.whiteColor()
        dataSource = DataSource(collectionView: collectionView, hotelFetcher: fetcher)
        view .addSubview(collectionView);
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Update", style: .Plain, target: self, action: #selector(MasterViewController.reloadData))

        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }
    
    func reloadData() {
        dataSource.reload()
    }
    
    
    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
//            if let indexPath = self.tableView.indexPathForSelectedRow {
//                let hotel = hotels[indexPath.row]
//                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
//                controller.hotel = hotel
//                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
//                controller.navigationItem.leftItemsSupplementBackButton = true
//            }
        }
    }
}

