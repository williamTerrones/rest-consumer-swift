//
//  NetworkManager.swift
//  rest-consumer (iOS)
//
//  Created by William Terrones on 22/12/20.
//

import Foundation

class NetworkManager: DispatchObject {
    
    func getPosts(completion: @escaping([Post]) -> () ){
        
        guard let url = URL(
            string:"https://jsonplaceholder.typicode.com/posts/"
        ) else {
            fatalError("La url no se ha podido acceder")
        }
        
        URLSession.shared.dataTask(with: url) {datos, respuesta, error in
            
            guard let data = datos, error == nil,
                  let response = respuesta as? HTTPURLResponse else {
                return
            }
            
            if(response.statusCode==200){
                
                do {
                    
                    let posts = try JSONDecoder().decode([Post].self, from: data )
                    
                    print("Posts")
                    print(posts)
                    
                    
                    //DispatchQueue.main.async {
                        completion(posts)
                    //}
                    
                } catch let error {
                    
                    print(error.localizedDescription)
                    
                }
                
            }
            
        }.resume()
        
        
        
    }
    
}
