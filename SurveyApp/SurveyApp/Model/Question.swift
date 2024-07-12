//
//  Question.swift
//  SurveyApp
//
//  Created by Syafiq Sobri on 12/07/2024.
//

import Foundation

struct Question: Identifiable {
    var id: Int
    var text: String
    var answers: [String]
}
