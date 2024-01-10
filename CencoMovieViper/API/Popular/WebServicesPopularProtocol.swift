//
//  WebServicesProtocol.swift
//  CencoMovieViper
//
//  Created by Jose David Bustos H on 09-03-23.
//

import Foundation
import UIKit
protocol WebServicesPopularProtocol {
    func getArticles( completion: @escaping ([Result]?) -> ())
}
class webServicesPopular {
    var urlbase:String = ""
    func getArticles( completion: @escaping ([Result]?) -> ()) {
        
        guard let endpointData = getEndpoint(fromName: "crearIssue") else { return }
        
        print(endpointData.url)
        
        let url = URL(string: endpointData.url.absoluteString)!
        
        URLSession.shared.dataTask(with: url) { [self] data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
                
            } else if let data = data {
              
                let articleList = try? JSONDecoder().decode(MoviesResult.self, from: data)
                print(articleList)
                if let articleList = articleList?.results {
                   
                    completion(articleList)
                }
                
                print(articleList?.results)
                
            }
            
        }.resume()
    }
    
    
    public func getEndpoint(fromName: String) -> APIEndpointModel? {
            var endpointFile = ""
            #if DEBUG
                endpointFile = "endpointsDev"
            #else
                endpointFile = "endpoints"
            #endif
            debugPrint(endpointFile)
            guard let path = Bundle.main.path(forResource: endpointFile, ofType: "plist") else {
                debugPrint("ERROR: No se encontró archivo endpoints.plist")
                return nil
            }
            let myDict = NSDictionary(contentsOfFile: path) as! [String : Any]
            guard let endpoint = myDict[fromName] as? [String : String] else {
                debugPrint("ERROR: No existe endpoint con el nombre \(fromName)")
                return nil
            }
            return APIEndpointModel(url: URL(string: endpoint["url"]!)!, APIKey: endpoint["x-api-key"]!, APIToken: endpoint["x-api-token"])
        }
    
}

