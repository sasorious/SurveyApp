//
//  CustomerInfoView.swift
//  SurveyApp
//
//  Created by Syafiq Sobri on 12/07/2024.
//

import SwiftUI

struct CustomerInfoView: View {
    var survey: Survey
    var merchandiser: Merchandiser
    @StateObject private var viewModel = CustomerInfoViewModel()
    
    var body: some View {
        VStack {
            TextField("Customer Name", text: $viewModel.customerName)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Customer Age", text: $viewModel.customerAge)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
            
            TextField("Customer Location", text: $viewModel.customerLocation)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            NavigationLink(destination: QuestionnaireView(survey: survey, customer: viewModel.createCustomer(), merchandiser: merchandiser)) {
                Text("Start Survey")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
    }
}
