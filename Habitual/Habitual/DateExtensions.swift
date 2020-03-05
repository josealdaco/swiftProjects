//
//  DateExtensions.swift
//  Habitual
//
//  Created by Jose Arellanes on 3/2/20.
//  Copyright © 2020 Jose Arellanes. All rights reserved.
//
import UIKit
import Foundation
extension Date {
    var stringValue: String {
        return DateFormatter.localizedString(from: self, dateStyle: .medium, timeStyle: .none)
    }

    var isToday: Bool {
        let calendar = Calendar.current
        return calendar.isDateInToday(self)
    }

    var isYesterday: Bool {
        let calendar = Calendar.current
        return calendar.isDateInYesterday(self)
    }
}
