////
////  CourseView.swift
////  EduMatrix Educator
////
////  Created by Shahiyan Khan on 05/07/24.
////
//
//import SwiftUI
//
//
//
//struct CourseView : View {
//    @State private var isShowingCourseDetailView = false
//    @EnvironmentObject var courseStore: CourseStore
//
//    @State var courses = [
////        Course(title: "Fronted Web Development", author: "Prakash Sharma", rating: 4, price: "$259", imageName: "course1"),
////        Course(title: "Fronted Web Development", author: "Prakash Sharma", rating: 4, price: "$259", imageName: "course2"),
////        Course(title: "Full Stack Development", author: "Prakash Sharma", rating: 4, price: "$259", imageName: "course1"),
////        Course(title: "Go Full Stack", author: "Prakash Sharma", rating: 4, price: "$259", imageName: "course1"),
////        Course(title: "Fronted Web Development", author: "Prakash Sharma", rating: 4, price: "$259", imageName: "course2")
//    ]
//    
//    var body: some View {
//        NavigationView {
//            VStack {
//                HStack {
//                    Text("My Courses")
//                        .font(.largeTitle)
//                        .fontWeight(.bold)
//                        .padding(.leading, 20
//                        )
//                    Spacer()
//                    Button(action: {
//                        isShowingCourseDetailView.toggle()
//                    }) {
//                        Image(systemName: "plus")
//                            .font(.title)
//                            .padding(.trailing, 20)
//                    }
//                    NavigationLink(destination: CourseDetailsView(/*courses: $courses*/courses: ), isActive: $isShowingCourseDetailView) {
//                         EmptyView()
//                     }
//                }
//                List(courses) { course in
//                        CourseRow(course: course)
//                    }
//                .listStyle(PlainListStyle())
//            }
////            .navigationBarItems(trailing: Button(action: {
////                // Add new course action
////            }) {
////                Image(systemName: "plus")
////            })
//        }
//    }
//}
//
//struct CourseRow: View {
//    var course: Course
//    
//    var body: some View {
//        HStack {
//            Image(course.imageName)
//                .resizable()
//                .frame(width: 50, height: 50)
//                .clipShape(RoundedRectangle(cornerRadius: 10))
//                .padding(.trailing, 10)
//            VStack(alignment: .leading) {
//                Text(course.title)
//                    .font(.headline)
//                Text(course.author)
//                    .font(.subheadline)
//                    .foregroundColor(.gray)
//                HStack {
//                    ForEach(0..<5) { index in
//                        Image(systemName: index < course.rating ? "star.fill" : "star")
//                            .foregroundColor(.orange)
//                    }
//                }
//            }
//            Spacer()
//            Text(course.price)
//                .font(.headline)
//        }
//        .padding(.vertical, 10)
//    }
//}
//
//#Preview {
//    CourseView()
//}
import SwiftUI

struct CourseView: View {
    @State private var isShowingCourseDetailView = false
    @EnvironmentObject var courseStore: CourseStore

    @State var courses: [Course] = []
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("My Courses")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.leading, 20)
                    Spacer()
                    Button(action: {
                        isShowingCourseDetailView.toggle()
                    }) {
                        Image(systemName: "plus")
                            .font(.title)
                            .padding(.trailing, 20)
                    }
                    NavigationLink(destination: CourseDetailsView(courses: $courses), isActive: $isShowingCourseDetailView) {
                        EmptyView()
                    }
                }
                List(courses) { course in
                    CourseRow(course: course)
                }
                .listStyle(PlainListStyle())
            }
        }
    }
}

struct CourseRow: View {
    var course: Course
    
    var body: some View {
        HStack {
            if let imageUrl = course.imageUrl, let uiImage = UIImage(contentsOfFile: imageUrl.path) {
                Image(uiImage: uiImage)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.trailing, 10)
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.trailing, 10)
            }
            VStack(alignment: .leading) {
                Text(course.name)
                    .font(.headline)
                Text(course.description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                HStack {
                    ForEach(0..<5) { index in
                        Image(systemName: index < course.keywords.count ? "star.fill" : "star")
                            .foregroundColor(.orange)
                    }
                }
            }
            Spacer()
            Text(course.price)
                .font(.headline)
        }
        .padding(.vertical, 10)
    }
}

#Preview {
    CourseView()
}
