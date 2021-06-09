//
//  Bank+CoreDataProperties.swift
//  simpleBanking
//
//  Created by Anisha Lamichhane on 6/9/21.
//
//

import Foundation
import CoreData


extension Bank {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Bank> {
        return NSFetchRequest<Bank>(entityName: "Bank")
    }

    @NSManaged public var amount: Int16
    @NSManaged public var accountNum: Int32
    @NSManaged public var remarks: String?
    @NSManaged public var date: Date?
    @NSManaged public var bankName: String?
    
    public var wrappedRemarks: String {
        remarks ?? ""
    }
    
    public var wrappedBankName: String {
        bankName ?? ""
    }
    
}

extension Bank : Identifiable {

}
