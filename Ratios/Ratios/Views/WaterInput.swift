//
//  WaterInput.swift
//  Ratios
//
//  Created by John Peden on 2/29/20.
//  Copyright © 2020 John Peden. All rights reserved.
//

import SwiftUI

struct WaterInput: View {

    @Binding var amount: String

    var body: some View {
        VStack {
            Text("What ratio?")
                .bold()
                .fixedSize()
                .foregroundColor(Color("Text"))
                .font(.system(size: 24))
            
            HStack(spacing: 30) {

                VStack(alignment: .center) {
                    Text("1")
                        .frame(width: CGFloat(39), height: CGFloat(46))
                        .font(.system(size: 24))

                    Text("coffee")
                        .fixedSize()
                        .foregroundColor(Color("Text"))
                        .font(.system(size: 14))
                }

                Text(":")

                VStack(alignment: .center) {
                    TextField("", text: $amount)
                        .frame(width: CGFloat(39), height: CGFloat(39))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("Primary"), lineWidth: 3)
                            )
                        .multilineTextAlignment(.center)
                        .font(.system(size: 24))

                    Text("water")
                        .fixedSize()
                        .foregroundColor(Color("Text"))
                        .font(.system(size: 14))
                }
            }
        }
    }
}
