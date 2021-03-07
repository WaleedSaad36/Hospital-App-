//
//  String+Trimming.swift
//  IDEA_Hospital_Team4
//
//  Created by Hossam on 12/7/20.
//  Copyright © 2020 IOS. All rights reserved.
//

import Foundation

extension String {
    var trimmed: String{
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
