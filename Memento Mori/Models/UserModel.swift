//
//  UserModel.swift
//  Memento Mori
//
//  Created by Kamil Rudnicki on 02/05/2020.
//  Copyright © 2020 TimeCamp S.A. All rights reserved.
//

import Foundation

func weeks(withoutFormatting : Bool = false) -> String {
    let born = Date("1988-03-08", format: .yyyy_mm_dd)
    let yearsToLive = 85
    
    var dateComponent = DateComponents()
    dateComponent.year = yearsToLive
    let futureDate = Calendar.current.date(byAdding: dateComponent, to: born)
    
    let now = Date()
    
    //return (futureDate?.getString())!
    
    let myInt : Int = now.daysBetween(futureDate!) / 7
    
    if withoutFormatting {
        return String(myInt)
    }
    
    let myIntString = myInt.formattedWithSeparator
    
    return myIntString
}
