//
//  NavigateTo.swift
//  Day16--100Days
//
//  Created by Anand Narayan on 2022-10-10.
//

import SwiftUI

struct NavigateTo: View {
    @Binding var tipPercentage: Int
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Picker("Number of patrons", selection: $tipPercentage) {
            ForEach(0..<101, id:(\.self)) {
                Text($0, format: .number)
            }
        }.pickerStyle(.menu)
    }
}


