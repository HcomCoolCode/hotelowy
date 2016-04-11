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
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        detailDescriptionLabel = UILabel(frame: view.bounds)
        detailDescriptionLabel.autoresizingMask = [.FlexibleHeight,.FlexibleWidth]
        detailDescriptionLabel.backgroundColor = UIColor.whiteColor()
        detailDescriptionLabel.textAlignment = .Center
        detailDescriptionLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
        view.addSubview(detailDescriptionLabel)
        detailDescriptionLabel.text = hotel.name
    }
}

