//
//  BookDetailView.swift
//  SwiftUI-Assignment-3
//
//  Created by NikoDanelia on 21/09/2026.
//

import SwiftUI

struct AuthorSheetView: View {
    let authorName: String
    let about: String
    
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(spacing: 20) {
            Text("ავტორის შესახებ")
                .font(.headline)
                .foregroundColor(.secondary)
            
            Text(authorName)
                .font(.title)
                .bold()
                .multilineTextAlignment(.center)
            
            
            Text(about)
                .font(.body)
                .foregroundColor(.primary)
                .multilineTextAlignment(.leading)
                .padding(.horizontal)
            
            Spacer()
            
            Button("დახურვა") {
                dismiss()
            }
            .buttonStyle(.borderedProminent)
            .tint(.red)
        }
        .padding(.top, 30)
        .padding(.bottom, 20)
    }
}


struct BookDetailView: View {
    let book: Book
    @State private var showAuthor: Bool = false
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // ემოჯი
                Text(book.emoji)
                    .font(.system(size: 90))
                    .padding(.top, 20)
                
                // სათაური
                Text(book.title)
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)
                
                // ავტორი
                Text("ავტორი: \(book.author)")
                    .font(.title2)
                    .foregroundColor(.secondary)
                
                Divider()
                    .padding(.vertical, 10)
                
                // აღწერა
                Text(book.about)
                    .font(.body)
                    .lineSpacing(6)
                    .multilineTextAlignment(.leading)
                
                Spacer()
                
                Button("Avtoris Sesaxeb"){
                    showAuthor = true
                }
            }
            .padding()
        }
        .navigationTitle(book.title)
        .navigationBarTitleDisplayMode(.inline)
        
        .sheet(isPresented: $showAuthor) {
            AuthorSheetView(authorName: book.author,
                            about: book.about)
                .presentationDetents([.medium])
        }


    }
}

#Preview {
    NavigationStack {
        BookDetailView(book: sampleBooks[0])
    }
}
