//
//  VerticalBarView.swift
//  Barchart-SwiftUI
//
//  Created by Keerthi on 17/08/20.
//  Copyright © 2020 Hxtreme. All rights reserved.
//

import SwiftUI

struct VerticalBarView: View {
    var barColor: Color
    var cornerRadius: CGFloat
    var markDetails: BarItem
    var body: some View {
        VStack(spacing: 4) {
            Text("\(Int(self.markDetails.value))")
                .font(.caption)
            GeometryReader { g in
                ZStack(alignment: .bottom) {
                    RoundedRectangle(cornerRadius: self.cornerRadius)
                        .foregroundColor(Color.gray.opacity(0.15))
                        .frame(width: g.size.width * 0.45, height: g.size.height * 0.8)
                    RoundedRectangle(cornerRadius: self.cornerRadius)
                        .foregroundColor(self.barColor)
                        .frame(width: g.size.width * 0.45, height: (g.size.height * 0.8) * (CGFloat(self.markDetails.value) / 100))
                        .animation(Animation.easeInOut)
                }
                .animation(Animation.spring().delay(  Double(1) * 0.04 ))
            }
            Text(self.markDetails.name)
                .font(.footnote)
                .padding(.horizontal, 2.0)
                .rotationEffect(.degrees(330))
        }
    }
}
