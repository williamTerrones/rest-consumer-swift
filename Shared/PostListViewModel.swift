//
//  PostListViewModel.swift
//  rest-consumer (iOS)
//
//  Created by William Terrones on 22/12/20.
//

import Foundation
import Combine

class PostListViewModel: ObservableObject {
    
    init(){
        getPosts()
    }
    
    @Published var posts = [Post] () {
        willSet {
            didChange.send(self)
        }
    }
    
    let didChange = PassthroughSubject<PostListViewModel,Never>()
    
    func getPosts() {
        
        NetworkManager().getPosts {
            self.posts = $0
        }
        
    } 
    
}
