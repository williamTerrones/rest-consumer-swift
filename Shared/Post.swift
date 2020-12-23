//
//  Post.swift
//  rest-consumer (iOS)
//
//  Created by William Terrones on 22/12/20.
//

import Foundation

struct Post: Codable, Hashable, Identifiable {
    
    let id = UUID()
    let title:String
    let body:String
}
