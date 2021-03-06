//
//  SettingsViewModel.swift
//  Ratios
//
//  Created by Mark Kim on 3/5/21.
//  Copyright © 2021 John Peden. All rights reserved.
//

import Foundation

enum MeasureUnit {
    case gram
    case tbsp
}

class SettingsViewModel {
    let defaults = UserDefaults.standard
    
    public func saveRatio(water: String) {
        defaults.set(water, forKey: "DefaultRatio")
    }
}
