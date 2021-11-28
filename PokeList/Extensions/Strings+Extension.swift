//
//  Strings+Extension.swift
//  PokeList
//
//  Created by Thiago Gaspar on 28/11/21.
//

import UIKit

extension String {
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}
