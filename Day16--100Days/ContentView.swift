//
//  ContentView.swift
//  Day16--100Days
//
//  Created by Anand Narayan on 2022-10-10.
//

import SwiftUI

struct ContentView: View {
    
    
    @State private var billAmount = 0.0
    @State private var numberOfPatrons = 2
    @State private var selectedPercentage=10
    
    
    let tipPercentages = [10, 15, 20, 25,0]
    
    var totalPerPerson: Double {
        let totalTip = billAmount * Double(selectedPercentage)/Double(100)
        let totalBill = billAmount + totalTip
        let perPerson = totalBill / Double(numberOfPatrons)
        return perPerson
    }
    
    var totalBill: Double {
        let totalTip = billAmount * Double(selectedPercentage)/Double(100)
        let totalBill = billAmount + totalTip
        return totalBill
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        TextField("Please enter bill amount", value: $billAmount, format: .currency(code: "USD")).keyboardType(.numberPad)
                        Picker("Number of patrons", selection: $numberOfPatrons) {
                            ForEach(2...100, id:(\.self)) {
                                Text($0, format: .number)
                            }
                        }.pickerStyle(.menu)

                        

                    }
                    Section {
                        NavigationLink(
                            destination: NavigateTo(tipPercentage: $selectedPercentage),
                            label: {
                              Text("Navigation Link")
                            })
                    } header: {
                        Text("Please select tip amount")
                    }
                    
                    Section {
                        Text("\(totalPerPerson)")
                    } header: {
                        Text("This is your total per person")
                    }
                    
                    Section {
                        Text("\(totalBill)").foregroundColor(totalBill == 0 ? Color.red : Color.black)
                    } header: {
                        Text("total amount for the cheque:")
                    }
                }



            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
