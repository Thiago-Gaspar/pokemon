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

// PEGANDO APENAS NÚMEROS DENTRO DE UMA STRING //

extension String {
    var westernArabicNumeralsOnly: String {
        let pattern = UnicodeScalar("0")..."9"
        return String(unicodeScalars
                        .compactMap { pattern ~= $0 ? Character($0) : nil })
    }
}
