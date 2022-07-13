//
//  ContentView.swift
//  EYChallenge2SwiftUI
//
//  Created by Stephen on 7/11/22.
//

import SwiftUI

enum SegmentColors: String, CaseIterable {
    
    case blue = "Blue"
    case red = "Red"
    case yellow = "Yellow"
    case purple = "Purple"
    case teal = "Teal"
    case cyan = "Cyan"
    
    func findColor() -> Color {
        switch self {
        case .blue:
            return .blue
        case .red:
            return .red
        case .yellow:
            return .yellow
        case .purple:
            return .purple
        case .teal:
            return .teal
        case .cyan:
            return .cyan
        }
    }

}


struct ContentView: View {
    
    @State var selectedSegment = SegmentColors.blue
    
    var body: some View {
        Picker(selection: $selectedSegment) {
            ForEach(SegmentColors.allCases, id: \.self) { color in
                
                Text(color.rawValue)
            }
        } label: {
            Text("Colors")
        }
        .pickerStyle(.segmented)
        .padding(8)
        .colorMultiply(selectedSegment.findColor())


    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
