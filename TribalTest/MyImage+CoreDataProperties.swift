//
//  MyImage+CoreDataProperties.swift
//  
//
//  Created by Azteca on 28/10/21.
//
//

import Foundation
import CoreData


extension MyImage {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MyImage> {
        return NSFetchRequest<MyImage>(entityName: "MyImage")
    }

    @NSManaged public var url: String?

}
