//
//  ExDouble.swift
//  Currency Converter
//
//  Created by Diaa SAlAm on 6/30/21.
//

import Foundation

extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
