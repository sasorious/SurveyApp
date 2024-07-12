//
//  QuestionnaireView.swift
//  SurveyApp
//
//  Created by Syafiq Sobri on 12/07/2024.
//

import SwiftUI

struct QuestionnaireView: View {
    var survey: Survey
    var customer: Customer
    var merchandiser: Merchandiser
    @StateObject private var viewModel = QuestionnaireViewModel()
    
    var body: some View {
        VStack {
            ForEach(survey.questions) { question in
                Text(question.text)
                    .font(.headline)
                
                ForEach(question.answers, id: \.self) { answer in
                    Button(action: {
                        viewModel.responses[question.id] = answer
                    }) {
                        Text(answer)
                            .padding()
                            .background(viewModel.responses[question.id] == answer ? Color.blue : Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .padding(.vertical, 4)
                }
            }
            Button(action: {
                viewModel.submitSurvey(customer: customer, merchandiser: merchandiser, survey: survey)
            }) {
                Text("Submit")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            
            if let submissionStatus = viewModel.submissionStatus {
                Text(submissionStatus)
                    .padding()
                    .foregroundColor(submissionStatus == "Survey submitted successfully" ? .green : .red)
            }
        }
        .padding()
    }
}
