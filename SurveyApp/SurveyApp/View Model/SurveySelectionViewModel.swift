//
//  SurveySelectionViewModel.swift
//  SurveyApp
//
//  Created by Syafiq Sobri on 12/07/2024.
//

import Foundation
import SwiftUI

class SurveySelectionViewModel: ObservableObject {
    @Published var surveys: [Survey] = [
        Survey(id: 1, title: "Customer Satisfaction", questions: [
            Question(id: 1, text: "Do you like to eat chocolate?", answers: ["Yes", "No"]),
            Question(id: 2, text: "How often do you visit the supermarket?", answers: ["Daily", "Weekly", "Monthly", "Rarely"])
        ]),
        Survey(id: 2, title: "Product Preferences", questions: [
            Question(id: 3, text: "Which brand do you prefer?", answers: ["Brand A", "Brand B", "Brand C"]),
            Question(id: 4, text: "How often do you buy organic products?", answers: ["Always", "Sometimes", "Never"])
        ])
    ]
}
