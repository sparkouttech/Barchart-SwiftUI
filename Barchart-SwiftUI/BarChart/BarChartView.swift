//
//  BarChartView.swift
//  Barchart-SwiftUI
//
//  Created by Keerthi on 17/08/20.
//  Copyright © 2020 Hxtreme. All rights reserved.
//

import SwiftUI

struct BarChartView: View {
    var barChartColor: Color
    var barColor: Color
    var barStyle: BarStyle
    var barType: BarType
    var data: [BarItem]
    
    init(data: [BarItem], barChartColor: Color? = nil, barColor: Color? = nil, barStyle: BarStyle? = nil, barType: BarType? = nil) {
        self.data = data
        self.barChartColor = barChartColor ?? Color.red
        self.barColor = barColor ?? Color.black
        self.barStyle = barStyle ?? BarStyle.round
        self.barType = barType ?? BarType.vertical
    }
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(barChartColor.opacity(0.25))
            if self.barType == .vertical {
                VStack(spacing: 0) {
                    ForEach((data)) {item in
                        HorizontalBarView(barColor: self.barColor, cornerRadius: CGFloat(20 * self.barStyle.rawValue), markDetails: item)
                            .animation(.spring())
                    }
                }
                .padding()
            }
            else {
                HStack(spacing: 0) {
                    ForEach((data)) {item in
                        VerticalBarView(barColor: self.barColor, cornerRadius: CGFloat(20 * self.barStyle.rawValue), markDetails: item)
                            .animation(.spring())
                    }
                }
                .padding()
            }
        }
    }
}
