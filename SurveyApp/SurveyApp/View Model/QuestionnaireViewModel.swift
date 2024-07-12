//
//  QuestionnaireViewModel.swift
//  SurveyApp
//
//  Created by Syafiq Sobri on 12/07/2024.
//

import Foundation

class QuestionnaireViewModel: ObservableObject {
    @Published var responses: [Int: String] = [:]
    @Published var submissionStatus: String?
    
    func submitSurvey(customer: Customer, merchandiser: Merchandiser, survey: Survey) {
        let surveyData: [String: Any] = [
            "customer": [
                "name": customer.name,
                "age": customer.age,
                "location": customer.location,
                "dateOfSurvey": iso8601String(from: customer.dateOfSurvey)
            ],
            "merchandiser": [
                "name": merchandiser.name,
                "age": merchandiser.age,
                "outletAssigned": merchandiser.outletAssigned
            ],
            "survey": [
                "title": survey.title,
                "responses": responses.map { ["questionId": $0.key, "answer": $0.value] }
            ]
        ]
        
        guard let url = URL(string: "https://your-backend-service.com/api/surveys") else {
            print("Invalid URL")
            submissionStatus = "Invalid URL"
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: surveyData, options: .prettyPrinted)
            request.httpBody = jsonData
        } catch {
            print("Failed to serialize JSON: \(error)")
            submissionStatus = "Failed to serialize JSON"
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    print("Failed to submit survey: \(error.localizedDescription)")
                    self.submissionStatus = "Failed to submit survey: \(error.localizedDescription)"
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse else {
                    print("Invalid response from server")
                    self.submissionStatus = "Invalid response from server"
                    return
                }
                
                if httpResponse.statusCode == 200 {
                    print("Survey submitted successfully")
                    self.submissionStatus = "Survey submitted successfully"
                } else {
                    print("Failed to submit survey: HTTP \(httpResponse.statusCode)")
                    self.submissionStatus = "Failed to submit survey: HTTP \(httpResponse.statusCode)"
                    
                    if let data = data, let responseBody = String(data: data, encoding: .utf8) {
                        print("Response body: \(responseBody)")
                    }
                }
            }
        }
        
        task.resume()
    }
    
    private func iso8601String(from date: Date) -> String {
        let formatter = ISO8601DateFormatter()
        return formatter.string(from: date)
    }
}
