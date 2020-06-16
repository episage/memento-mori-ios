//
//  Helpers.swift
//  Memento Mori
//
//  Created by Kamil Rudnicki on 02/05/2020.
//  Copyright © 2020 TimeCamp S.A. All rights reserved.
//

import Foundation
import UIKit

extension Formatter {
    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = " "
        formatter.numberStyle = .decimal
        return formatter
    }()
}

extension Int {
    var formattedWithSeparator: String {
        return Formatter.withSeparator.string(for: self) ?? ""
    }
} 

enum DateFormat: String, CustomStringConvertible
{
    case yyyy_mm_dd
    case yyyy_mm_dd_hh_mm_ss
    case yyyy_mm_dd_hh_mm_ss_SS
    
    var description: String {
        get {
            return self.getStringRepresentation
        }
    }
    
    var getStringRepresentation: String {
        switch self {
        case.yyyy_mm_dd:
            return "yyyy-MM-dd"
        case .yyyy_mm_dd_hh_mm_ss:
            return "yyyy-MM-dd HH:mm:ss"
        case .yyyy_mm_dd_hh_mm_ss_SS:
            return "yyyy-MM-dd HH:mm:ss.SSS"
        }
    }
}

extension Date {
    
    init(_ dateString:String, format: DateFormat = DateFormat.yyyy_mm_dd) {
        let dateStringFormatter = DateFormatter()
        dateStringFormatter.dateFormat = format.getStringRepresentation
        dateStringFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale
        let date = dateStringFormatter.date(from: dateString)!
        self.init(timeInterval:0, since:date)
    }
    
    static func getTodayString(format: DateFormat = .yyyy_mm_dd_hh_mm_ss_SS) -> String {
        let date = Date()
        let formater = DateFormatter()
        formater.dateFormat = format.getStringRepresentation
        let formattedDate = formater.string(from: date)
        return formattedDate
    }
    
    func getString(format: DateFormat = .yyyy_mm_dd_hh_mm_ss) -> String {
        let df = DateFormatter()
        df.dateFormat = format.getStringRepresentation
        let now = df.string(from: self)
        return now
    }
    
    func getEmptyString() -> String { //todo: trick siwftui to refresh ui, find better way
        return "";
    }
    
    func daysBetween(_ to: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: self, to: to).day!
    }
}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(
           red:   .random(),
           green: .random(),
           blue:  .random(),
           alpha: 1.0
        )
    }
}
