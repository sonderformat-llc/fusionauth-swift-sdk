//
//  HomeView.swift
//  TestApp
//
//  Created by Colin Frick on 15.05.24.
//

import SwiftUI
import FusionAuth

struct HomeView: View {
    @EnvironmentObject var userAuth: FusionAuthState
    @State var userInfo: UserInfo?

    var body: some View {
        if userInfo == nil {
            VStack {
                ProgressView()
                    .padding()
                Text("Retrieving user info")
            }
            .onAppear {
                getUserInfo()
            }
        } else {
            VStack {
                Text("Welcome \(userInfo?.given_name ?? "") \(userInfo?.family_name ?? "")")
                    .padding(.bottom, 20).font(.headline)
                Text("Your balance is:")
                Text("$0.00").font(.largeTitle)
                Button("Log out") {
                    Task {
                        do {
                            try await AuthorizationManager.shared
                                .oauth()
                                .logout(options: OAuthLogoutOptions())
                        } catch let error as NSError {
                            print(error)
                        }
                    }
                }.buttonStyle(SecondaryButtonStyle())
            }
        }
    }

    func getUserInfo() {
        Task {
            do {
                self.userInfo = try await AuthorizationManager.shared
                    .oauth()
                    .userInfo()
            } catch let error as NSError {
                print("JSON decode failed: \(error.localizedDescription)")
            }
        }
    }
}

#Preview {
    HomeView()
}