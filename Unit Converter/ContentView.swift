//
//  ContentView.swift
//  Unit Converter
//
//  Created by Alex Cannizzo on 20/09/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var convertFrom = ""
    @State private var selectedTemp = 0
    @State private var outputTemp = 1
    
    let temperatures = ["Celsius", "Fahrenheit", "Kelvin"]
    
    var convertValue: Double {
        let amount = Double(convertFrom) ?? 0
        
        if outputTemp == 1 && selectedTemp == 0 {
            let fahrenheit = (amount * 9/5) + 32
            return fahrenheit
        } else if outputTemp == 2 && selectedTemp == 0 {
            let kelvin = amount + 273.15
            return kelvin
        } else if outputTemp == 0 && selectedTemp == 0 {
            return amount
        } else if selectedTemp == 1 && outputTemp == 0 {
            let celsius = (amount - 32) * 5/9
            return celsius
        } else if selectedTemp == 1 && outputTemp == 2 {
            let kelvin = (amount - 32) * 5/9 + 273.15
            return kelvin
        } else if selectedTemp == 1 && outputTemp == 1 {
            return amount
        } else if selectedTemp == 2 && outputTemp == 0 {
            let celsius = amount - 273.15
            return celsius
        } else if selectedTemp == 2 && outputTemp == 1 {
            let fahrenheit = (amount - 273.15) * 9/5 + 32
            return fahrenheit
        } else if selectedTemp == 2 && outputTemp == 2 {
            return amount
        } else {
            return 0
        }
        
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Choose unit")) {
                    Picker("Temp", selection: $selectedTemp) {
                        ForEach(0 ..< temperatures.count) {
                            Text("\(self.temperatures[$0])")
                        }
                        
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    TextField("Amount", text: $convertFrom)
                        .keyboardType(.decimalPad)
                }
                .padding()
                
                Section(header: Text("Convert to")) {
                    Picker("Temp", selection: $outputTemp) {
                        ForEach(0 ..< temperatures.count) {
                            Text("\(self.temperatures[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    Text("\(convertValue, specifier: "%.2f")")
                }
                .padding()
            }
            .navigationBarTitle("Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
