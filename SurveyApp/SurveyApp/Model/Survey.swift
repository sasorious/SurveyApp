//
//  Survey.swift
//  SurveyApp
//
//  Created by Syafiq Sobri on 12/07/2024.
//

import Foundation

struct Survey: Identifiable {
    var id: Int
    var title: String
    var questions: [Question]
}
