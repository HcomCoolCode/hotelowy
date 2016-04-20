//
//  DetailViewController.swift
//  ListOfHotels
//
//  Created by Tomasz Kuzma on 24/03/2016.
//  Copyright © 2016 Expedia. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    private var detailDescriptionLabel: UILabel!
    private let hotel : Hotel
    
    init(hotel: Hotel) {
        self.hotel = hotel
        super.init(nibName: nil, bundle: nil)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Randomise location", style: .Plain, target: self, action: #selector(randomiseTapped))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let detailView = HotelDetailView()
        self.view = detailView
        setRandomisedLocation()
    }
    
    var hotelDetailView: HotelDetailView {
        return self.view as! HotelDetailView
    }
    
    func setRandomisedLocation() {
        let hotelComponentModel = HotelComponentModel()

        let generateRandomOffset: Void -> Double = {
            let max = UInt32(2 << 10)
            let delta = 0.1
            return delta * Double(arc4random_uniform(max)) / Double(max)
        }
        // The Ritz
        hotelComponentModel.latitude = 51.506918 + generateRandomOffset()
        hotelComponentModel.longitude = -0.141588 + generateRandomOffset()
        self.hotelDetailView.hotelComponentModel = hotelComponentModel
    }

    func randomiseTapped() {
        setRandomisedLocation()
    }
}

