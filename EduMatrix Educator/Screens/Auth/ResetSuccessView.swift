//
//  ResetSuccessView.swift
//  EduMatrix Educator
//
//  Created by Madhav Verma on 05/07/24.
//

import SwiftUI

struct ResetSuccessView: View {
    @State private var navigateToLoginView: Bool = false
    //@AppStorage("isDarkMode") private var isDarkMode = false
   // @StateObject var userViewModel = UserViewModel()

    var body: some View {
        VStack {
            Spacer().frame(height: 50)

            Image("Group 513888") // Use a system image or replace with your own image name
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200) // Adjust the size as needed
                    .padding(.top, 60) //

            Spacer().frame(height: 30)

            Text("Password changed")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 16)

            Text("Your password has been changed successfully.")
                .font(.subheadline)
                .padding(.top, 8)

            Spacer().frame(height: 30)

            Button(action: {
                navigateToLoginView = true
            }) {
                Text("Back to Login Page")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(8)
                    .padding(.horizontal, 4)
            }

            NavigationLink(destination: LoginView(), isActive: $navigateToLoginView) {
                EmptyView()
            }

            Spacer()
        }
        .padding()
        //.navigationBarBackButtonHidden(true)
    }
}

struct ResetSuccessView_Previews: PreviewProvider {
    static var previews: some View {
        ResetSuccessView()
    }
}
