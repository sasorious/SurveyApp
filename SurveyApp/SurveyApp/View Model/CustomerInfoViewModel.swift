//
//  CustomerInfoViewModel.swift
//  SurveyApp
//
//  Created by Syafiq Sobri on 12/07/2024.
//

import Foundation
import SwiftUI

class CustomerInfoViewModel: ObservableObject {
    @Published var customerName = ""
    @Published var customerAge = ""
    @Published var customerLocation = ""
    
    func createCustomer() -> Customer {
        return Customer(name: customerName, age: customerAge, location: customerLocation, dateOfSurvey: Date())
    }
}
