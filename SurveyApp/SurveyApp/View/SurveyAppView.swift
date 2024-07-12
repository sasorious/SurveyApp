//
//  SurveyAppView.swift
//  SurveyApp
//
//  Created by Syafiq Sobri on 12/07/2024.
//

import SwiftUI

struct SurveyAppView: View {
    @StateObject private var loginViewModel = LoginViewModel()

    var body: some View {
        if loginViewModel.isLoggedIn, let merchandiser = loginViewModel.merchandiser {
            SurveySelectionView(merchandiser: merchandiser)
                .environmentObject(SurveySelectionViewModel())
        } else {
            LoginView()
                .environmentObject(loginViewModel)
        }
    }
}

struct SurveyAppView_Previews: PreviewProvider {
    static var previews: some View {
        SurveyAppView()
    }
}
