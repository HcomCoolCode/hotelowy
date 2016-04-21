//
//  Copyright © 2016 Expedia. All rights reserved.
//

import Foundation





class FITFakeNetwork : NSObject, Network {

    var jsonString:NSString?

    required init(hotelDataSet: [FITHotelData]) {

        jsonString = "{\"result\" : { \"hotels\" :"
        jsonString = jsonString!.stringByAppendingString(FITHotelData.jsonArray(hotelDataSet))
        jsonString = jsonString!.stringByAppendingString("} }")

        let data = jsonString!.dataUsingEncoding(NSUTF8StringEncoding)
        do {
            let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
            print(json)
        }
        catch {
            print("error")
        }


        super.init()
    }

    func getURL(url: NSURL, completion: (data: NSData?, error: NSError?) -> ()) {

        let data = jsonString!.dataUsingEncoding(NSUTF8StringEncoding)
        completion(data: data, error: nil)
    }

}




@objc(FITPresentedHotels)
class FITPresentedHotels: NSObject {

    var staticHotelDataSetKey: NSString
    var fetchedHotels: [Hotel]?

    let titleColumnKey:NSString = "title"
    let starRatingColumnKey:NSString = "star rating"
    let imageUrlColumnKey:NSString = "image url"
    let idColumnKey:NSString = "id"


    init(string: NSString) {

        self.staticHotelDataSetKey = string
        super.init()
    }


    func query() -> NSArray {

        fetchHotels()

        let result = NSMutableArray()

        for hotel in self.fetchedHotels! {

            var starRatingString: NSString
            if (hotel.starRating.floatValue - floor(hotel.starRating.floatValue) > 0.01) {
                starRatingString = String(format:"%.1f",hotel.starRating.floatValue) as NSString
            } else {
                starRatingString = String(format:"%i",hotel.starRating.integerValue) as NSString
            }


            let row = [
                titleColumnKey: hotel.name as NSString,
                starRatingColumnKey: starRatingString,
                imageUrlColumnKey: hotel.imageURL.absoluteString,
                idColumnKey: String(format:"%lu",hotel.id) as NSString ]

            result.addObject(row)
        }

        return result.copy() as! NSArray
    }
    
    
    func fetchHotels() {

        let inputDataSet = FITHotelDataSet.getStaticHotelDataSet( self.staticHotelDataSetKey )

        let fakeNetork = FITFakeNetwork( hotelDataSet: inputDataSet! )

        let fetcher = HotelFetcher(network: fakeNetork, parser: HotelParser())

        fetcher.fetchHotels { (hotels, error) in

            self.fetchedHotels = hotels
        }
    }

}