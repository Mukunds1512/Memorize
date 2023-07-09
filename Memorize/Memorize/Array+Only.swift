//
//  Array+Only.swift
//  Memorize
//
//  Created by Mukund Sharma on 6/26/23.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
