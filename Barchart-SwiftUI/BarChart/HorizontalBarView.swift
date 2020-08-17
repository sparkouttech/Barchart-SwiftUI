//
//  HorizontalBarView.swift
//  Barchart-SwiftUI
//
//  Created by Keerthi on 17/08/20.
//  Copyright © 2020 Hxtreme. All rights reserved.
//

import SwiftUI

struct HorizontalBarView: View {
    var barColor: Color
    var cornerRadius: CGFloat
    var markDetails: BarItem
    var body: some View {
        HStack(spacing: 4) {
            Text(self.markDetails.name)
                .font(.caption)
                .frame(width: 45)
                .padding(.horizontal, 2.0)
                .rotationEffect(.degrees(330))
            GeometryReader { g in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: self.cornerRadius)
                        .foregroundColor(Color.gray.opacity(0.15))
                        .frame(width: g.size.width * 0.9, height: g.size.height * 0.5)
                    RoundedRectangle(cornerRadius: self.cornerRadius)
                        .foregroundColor(self.barColor)
                        .frame(width: g.size.width * 0.9 * (CGFloat(self.markDetails.value) / 100), height: (g.size.height * 0.5))
                        .animation(Animation.easeInOut)
                }
                .animation(Animation.spring().delay(  Double(1) * 0.04 ))
            }
            Text("\(Int(self.markDetails.value))")
                .font(.caption)
        }
    }
}
