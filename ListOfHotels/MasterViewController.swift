//
//  MasterViewController.swift
//  ListOfHotels
//
//  Created by Tomasz Kuzma on 24/03/2016.
//  Copyright © 2016 Expedia. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController{
    
    var collectionView: UICollectionView!
    var dataSource: DataSource!
    
    lazy var fetcher: HotelFetcher = {
        HotelFetcher(network: Network())
    }()
    
    func showDetails(hotel: Hotel) {
        let details = DetailViewController(hotel: hotel)
        navigationController?.pushViewController(details, animated: true)
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        collectionView = UICollectionView(frame: view.bounds,
                                          collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = UIColor.whiteColor()
        dataSource = DataSource(collectionView: collectionView, hotelFetcher: fetcher)
        view .addSubview(collectionView);
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Update",
                                                                style: .Plain,
                                                                target: self,
                                                                action: #selector(MasterViewController.reloadData))
    }
    
    func reloadData() {
        dataSource.reload()
    }
}

