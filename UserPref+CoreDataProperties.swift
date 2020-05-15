//
//  UserPref+CoreDataProperties.swift
//  Cook
//
//  Created by Adison on 14/05/2020.
//  Copyright © 2020 Adison. All rights reserved.
//
//

import Foundation
import CoreData


extension UserPref {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserPref> {
        return NSFetchRequest<UserPref>(entityName: "UserPref")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String
    @NSManaged public var ban: Bool

}
