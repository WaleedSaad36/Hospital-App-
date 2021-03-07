//
//  String+Extensions.swift
//  IDEHospital_Intake1_Team5
//
//  Created by AbeerSharaf on 12/9/20.
//  Copyright © 2020 Abeer. All rights reserved.
//

import Foundation

extension String {
    //trimmed
    var trimmed: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
//    func formattedDateString(format: String? = "MMM d, h:mm a") -> String {
//        
//        let dateFormatter = DateFormatter()
//        dateFormatter.locale = Locale(identifier: "en_AU")
//        dateFormatter.timeZone = TimeZone(abbreviation: "Australia/Sydney")
//        dateFormatter.amSymbol = "AM"
//        dateFormatter.pmSymbol = "PM"
//        dateFormatter.calendar = Calendar(identifier: .gregorian)
//        dateFormatter.dateFormat = format
//        return dateFormatter.string(from: )
//        
//    }

}
