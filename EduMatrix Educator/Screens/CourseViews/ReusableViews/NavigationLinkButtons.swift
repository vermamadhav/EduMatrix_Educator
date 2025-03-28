//
//  NavigationLinkButtons.swift
//  EduMatrix Educator
//
//  Created by Shahiyan Khan on 06/07/24.
//

import Foundation
import SwiftUI

struct NavigationLinkButtons: View {
    @Binding var videos: [Video]
    @Binding var notes: [Note]

    var body: some View {
        Group {
//            Text("Course Content")
//                .font(.headline)

            NavigationLink(destination: VideoUploadView(videos: $videos)) {
                HStack {
                    Text("Upload Videos")
                        .foregroundColor(.black)
                    Spacer()
                    Image(systemName: "chevron.right")
                }
            }
            .padding(.vertical)

            NavigationLink(destination: NoteUploadView(notes: $notes)) {
                HStack {
                    Text("Upload Notes")
                        .foregroundColor(.black)
                    Spacer()
                    Image(systemName: "chevron.right")
                }
            }
            .padding(.vertical)
        }
    }
}

struct NavigationLinkButtons_Previews: PreviewProvider {
    struct Wrapper: View {
        @State private var videos: [Video] = []
        @State private var notes: [Note] = []
        var body: some View {
            NavigationView {
                NavigationLinkButtons(videos: $videos, notes: $notes)
            }
        }
    }

    static var previews: some View {
        Wrapper()
    }
}
