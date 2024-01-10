//
//  TopRatesMoviesPresenter.swift
//  CencoMovieViper
//


import UIKit
struct ViewModelErrorTopPresent {
    let title: String
    let message: String
    let icon: String
    let code: String
    var animated: Bool = true
}
protocol TopRatesMoviesPresentationLogic {
    func presentViewInfoMenuInfo(_ response: [Movies])
    func presentServiceError(response: APIErrorResponse)
    func presentConnectionError()
}

class TopRatesMoviesPresenter: TopRatesMoviesPresentationLogic {

    weak var viewController: TopRatesMoviesDisplayLogic?

    // MARK: - TopRatesMoviesPresentationLogic
    func presentViewInfoMenuInfo(_ response: [Movies]) {
        if response.isEmpty{
            let viewModel = ViewModelErrorTopPresent(
                title: "hubo un error",
                message: "ocurrio un error de servicio",
                icon: "icp_service_problem",
                code: "service_problem",
                animated: true
            )
           // viewController?.displayConnectionError(viewModel: viewModel)
        }else{
            viewController?.displayViewTextsInfo(listaMovies: response)
        }
        
    }
    func presentServiceError(response: APIErrorResponse) {
        
        let viewModel = ViewModelErrorTopPresent(
            title: response.title,
            message: response.message,
            icon: "icp_service_problem",
            code: "service_problem",
            animated: true
        )
       // viewController?.displayDiscountNotFoundError(viewModel: viewModel)
    }
    func presentConnectionError() {
        let viewModel = ViewModelErrorTopPresent(
            title: "NO_INTERNET_TITLE",
            message: "PROBLEM_SORRY",
            icon: "error",
            code: "unknown",
            animated: true
        )
       // viewController?.displayConnectionError(viewModel: viewModel)
    }
}
