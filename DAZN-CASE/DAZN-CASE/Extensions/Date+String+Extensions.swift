//
//  Date+String+Extensions.swift
//  DAZN-CASE
//
//  Created by Devran Ates on 14.09.2021.
//

import Foundation
extension String {
    // convert string date to string another format
    
    func convertToStringDate(to: String) -> String {
        let dateTemplates: [String] = ["yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
                                       "yyyy-MM-dd'T'HH:mm:ss",
                                       "yyy-MM-dd'T'HH:mm:ss" ,
                                       "DD/mm/yyyy HH:mm:ss a" ,
                                       "yyyy-MM-dd'T'HH:mm:ss.SSSZ",
                                       "yyyy-MM-dd'T'HH:mm:ssZZZZZ",
                                       "YYYY-MM-dd HH:mm:ss 'GMT'Z",
        "yyyy-MM-dd HH:mm:ss"]
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "TR_tr")
        for format in dateTemplates{
            dateFormatter.dateFormat = format
            if let date = dateFormatter.date(from: self) {
                dateFormatter.dateFormat = to
                return  dateFormatter.string(from: date)
            }
        }
        return ""
    }
}
