//
//  SurveySelectionView.swift
//  SurveyApp
//
//  Created by Syafiq Sobri on 12/07/2024.
//

import SwiftUI

struct SurveySelectionView: View {
    var merchandiser: Merchandiser
    @EnvironmentObject var viewModel: SurveySelectionViewModel
    
    var body: some View {
        NavigationView {
            List(viewModel.surveys) { survey in
                NavigationLink(destination: CustomerInfoView(survey: survey, merchandiser: merchandiser)) {
                    Text(survey.title)
                }
            }
            .navigationTitle("Select a Survey")
        }
    }
}
