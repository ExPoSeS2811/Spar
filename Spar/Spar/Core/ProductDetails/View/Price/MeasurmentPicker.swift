//
//  MeasurmentPicker.swift
//  Spar
//
//  Created by Gleb Rasskazov on 04.02.2024.
//

import SwiftUI

struct MeasurementPicker: View {
    @Binding var selectedMeasurement: Measurement
    
    var body: some View {
        Picker("Выберите единицу", selection: $selectedMeasurement) {
            ForEach(Measurement.allCases) { measurement in
                Text(measurement.rawValue).tag(measurement)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
    }
}

