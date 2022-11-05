//
//  ConversionProject.swift
//  Day16--100Days
//
//  Created by Anand Narayan on 2022-11-05.
//

import SwiftUI

struct ConversionProject: View {
    
    @State var fromUnits = "Celsius"
    @State var toUnits = "Fahrenheit"
    @State var numberEntered = 0.0
    var temperatureUnits = ["Celsius", "Fahrenheit", "Kelvin"]
    
    var convertCelciusToFahrenheit: Double {
        return numberEntered * 1.8 + 32
    }
    
    var convertCelciusToKelvin: Double {
        return numberEntered + 273.15
    }
    
    var convertKelvinToCelcius: Double {
        return numberEntered - 273.15
    }
    
    var convertKelvinToFahrenheit: Double {
        return ((numberEntered - 273.15)*1.8) + 32
    }
    
    var convertFahrenheitToCelcius: Double {
        return (numberEntered - 32)*5/9
    }
    
    var convertFahrenheitToKelvin: Double {
        return ((numberEntered - 32)*5/9 + 273.15)
    }
    
    
    var body: some View {
        Form {
            Section{
                Picker(selection: $fromUnits) {
                    ForEach(temperatureUnits, id:\.self) { temp in
                        Text(temp)
                    }
                } label: {
                    Text("Pick from units")
                }.pickerStyle(.menu)

                Picker(selection: $toUnits) {
                    ForEach(temperatureUnits, id:\.self) { temp in
                        Text(temp)
                    }
                } label: {
                    Text("Pick to units")
                }.pickerStyle(.menu)
            }

            Section {
                HStack {
                    Text("Enter your number:")
                    TextField("What value do you want to convert?", value: $numberEntered, format: .number)
                }
            }
            
            Section {
                VStack(alignment: .leading) {
                    Text("Here is your converted number in \(toUnits):")
                    if (fromUnits == "Celsius") {
                        if (toUnits == "Fahrenheit") {
                            Text("\(convertCelciusToFahrenheit)")
                        }
                        if (toUnits == "Kelvin") {
                            Text("\(convertCelciusToKelvin)")
                        }
                    }
                    if (fromUnits == "Fahrenheit") {
                        if (toUnits == "Celsius") {
                            Text("\(convertFahrenheitToCelcius)")
                        }
                        if (toUnits == "Kelvin") {
                            Text("\(convertFahrenheitToKelvin)")
                        }
                    }
                    if (fromUnits == "Kelvin") {
                        if (toUnits == "Celsius") {
                            Text("\(convertKelvinToCelcius)")
                        }
                        if (toUnits == "Fahrenheit") {
                            Text("\(convertKelvinToFahrenheit)")
                        }
                    }
                    
                    
                }
            }
            

            

            
        }
        

        
        
    }
}

struct ConversionProject_Previews: PreviewProvider {
    static var previews: some View {
        ConversionProject()
    }
}
