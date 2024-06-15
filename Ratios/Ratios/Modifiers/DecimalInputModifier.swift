//
//  DecimalInput.swift
//  Ratios
//
//  Created by Yoonhee Tian on 2024-06-14.
//  Copyright © 2024 John Peden. All rights reserved.
//

import SwiftUI
import Combine

struct DecimalInputModifier: ViewModifier {
    @Binding var text: String

    func body(content: Content) -> some View {
        AnyView(content)
            .onReceive(Just(text)) { newValue in
                var filtered = newValue.filter { "0123456789.".contains($0) }
                if (filtered.filter { $0 == "." }.count > 1) {
                    filtered = String(filtered.dropLast())
                }
                if filtered != newValue {
                    self.text = filtered
                }
            }
    }
}

extension View {
    func decimalInput(text: Binding<String>) -> some View {
        self.modifier(DecimalInputModifier(text: text))
    }
}
