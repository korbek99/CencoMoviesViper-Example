//
//  APIMovieErrorModel.swift
//  CencoMovieViper
//
//  Created by Jose David Bustos H on 09-03-23.
//


import Foundation
typealias APIErrorViewModel = APIMovieErrorModel.ViewModel
typealias APIErrorResponse = APIMovieErrorModel.Response

enum APIMovieErrorModel {
    struct Request {
    }
    struct Response: Equatable {
        let title: String
        let message: String
        let code: Int
    }
    struct ViewModel {
        let title: String
        let message: String
        let icon: String
        let code: String
        var animated: Bool = true
    }
}
