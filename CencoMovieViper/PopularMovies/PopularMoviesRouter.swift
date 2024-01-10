//
//  PopularMoviesRouter.swift
//  CencoMovieViper
//


import UIKit

@objc protocol PopularMoviesRoutingLogic {
    func routeToDetails(name:String ,desc:String ,images:String, lang:String)
}

protocol PopularMoviesDataPassing {
    var dataStore: PopularMoviesDataStore? { get }
}

class PopularMoviesRouter: NSObject, PopularMoviesRoutingLogic, PopularMoviesDataPassing {

    weak var viewController: PopularMoviesViewController?
    var dataStore: PopularMoviesDataStore?

    // MARK: - Routing
    func routeToDetails(name:String ,desc:String ,images:String, lang:String) {
        let ViewController = TopRatesDetailsViewController()
        ViewController.nombreString = name
        ViewController.decripString = desc
        ViewController.imageString = images
        ViewController.language = lang
        self.viewController?.navigationController?.pushViewController(ViewController, animated: true)
    }
    // MARK: - Passing data

    //func passDataToSomewhere(source: PopularMoviesDataStore, destination: inout SomewhereDataStore) {
    //  destination.name = source.name
    //}
}
