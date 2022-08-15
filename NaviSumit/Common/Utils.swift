//
//  Utils.swift
//  NaviSumit
//
//  Created by Sumit Kumar on 15/08/22.
//

import Foundation

struct Utils {
    
    static func getFormattedDate(dateString: String,
                          currentFomat: String,
                          expectedFromat: String) -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = currentFomat
        let date : Date = dateFormatterGet.date(from: dateString) ?? Date()
        dateFormatterGet.dateFormat = expectedFromat
        return dateFormatterGet.string(from: date)
    }
}
