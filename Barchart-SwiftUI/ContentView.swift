//
//  ContentView.swift
//  Barchart-SwiftUI
//
//  Created by Keerthi on 17/08/20.
//  Copyright © 2020 Hxtreme. All rights reserved.
//

import SwiftUI

struct BarItem: Identifiable {
    var id = UUID()
    var name: String
    var value: Double
}

enum BarStyle: Int {
    case rect
    case round
}

enum BarType {
    case horizontal
    case vertical
}

struct ContentView: View {
    @State var pickerSelection = 0
    @State var styleSelection = 0
    @State var colorSelection = 0
    @State var marks: [[BarItem]] = [
        [BarItem(name: "Tamil", value: 80), BarItem(name: "English", value: 45), BarItem(name: "Maths", value: 85), BarItem(name: "Science", value: 70), BarItem(name: "History", value: 50)], [BarItem(name: "Tamil", value: 45), BarItem(name: "English", value: 70), BarItem(name: "Maths", value: 50), BarItem(name: "Science", value: 87), BarItem(name: "History", value: 98)],
        [BarItem(name: "Tamil", value: 75), BarItem(name: "English", value: 30), BarItem(name: "Maths", value: 95), BarItem(name: "Science", value: 45), BarItem(name: "History", value: 50)]]
    var body: some View {
        NavigationView {
            HStack {
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        Text("Style: ")
                        Picker(selection: $styleSelection, label: Text("Stats")) {
                            Text("Round").tag(0)
                            Text("Rect").tag(1)
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    HStack {
                        Text("Color: ")
                        Picker(selection: $colorSelection, label: Text("Stats")) {
                            Text("Red").tag(0)
                            Text("Green").tag(1)
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    HStack {
                        Text("Marks: ")
                        Picker(selection: $pickerSelection, label: Text("Stats")) {
                            Text("Student1").tag(0)
                            Text("Student2").tag(1)
                            Text("Student3").tag(2)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    BarChartView(data: marks[pickerSelection], barChartColor: (colorSelection == 0) ? Color.red : Color.green, barColor: (colorSelection == 0) ? Color.black : Color(UIColor.darkGray).opacity(0.8), barStyle: (styleSelection == 0) ? .round:.rect, barType: (pickerSelection == 2) ? .vertical : .horizontal)
                        .frame(height: 300)
                }
                .padding(.horizontal, 20)
                .navigationBarTitle("Bar Chart")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

