//
//  ContentView.swift
//  Shared
//
//  Created by William Terrones on 22/12/20.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var model = PostListViewModel()
    
    var body: some View {
        List(model.posts) {
            Text($0.title)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
