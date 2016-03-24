//
//  MasterViewController.swift
//  ListOfHotels
//
//  Created by Tomasz Kuzma on 24/03/2016.
//  Copyright © 2016 Expedia. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

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
        tableView.estimatedRowHeight = 100
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Update", style: .Plain, target: self, action: Selector("fetch"))

        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
    func fetch() {
        fetcher.fetchHotels {[unowned self] (hotels, error) -> () in
            if let hotels = hotels {
                self.hotels = hotels
            }
        }
    }

    override func viewWillAppear(animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
        super.viewWillAppear(animated)
    }
    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let hotel = hotels[indexPath.row]
                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
                controller.hotel = hotel
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View


    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hotels.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        let hotel = hotels[indexPath.row]
        cell.textLabel!.numberOfLines = 0
        cell.textLabel!.text = hotel.name
        return cell
    }


}

