//
//  ImagesSchemaFactory.swift
//  MappingArchitecture
//
//  Created by Michael Voong on 12/04/2016.
//  Copyright © 2016 Hotels.com. All rights reserved.
//

import Foundation

public class ImagesSchemaFactory : NSObject, SchemaFactory {
    public typealias T = ImagesResponse
    
    public func schema() -> Schema<ImagesResponse> {
        let imageSizeMapping = EntityMapping<ImageSize>()
            .withPropertyMapping("type") { $0.type = $1 }
            .withPropertyMapping("suffix") { $0.suffix = $1 }
        
        let imageMapping = EntityMapping<Image>()
            .withPropertyMapping("base_url") { $0.baseURL = $1 }
            .withRelationshipMapping("image_sizes", mapping: imageSizeMapping) { $0.imageSizes = $1 }
        
        let responseMapping = EntityMapping<ImagesResponse>()
            .withPropertyMapping("hotel_id") { $0.hotelId = $1 }
            .withRelationshipMapping("hotel_images", mapping: imageMapping) { $0.images = $1 }
        
        return Schema(mapping: responseMapping)
    }
}
