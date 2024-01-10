//
//  TopRatesMoviesRouter.swift
//  CencoMovieViper
//


import UIKit

@objc protocol TopRatesMoviesRoutingLogic {
    func routeToDetailsTop(name:String ,desc:String ,images:String,lang:String)
}

protocol TopRatesMoviesDataPassing {
    var dataStore: TopRatesMoviesDataStore? { get }
}

class TopRatesMoviesRouter: NSObject, TopRatesMoviesRoutingLogic, TopRatesMoviesDataPassing {

    weak var viewController: TopRatesMoviesViewController?
    var dataStore: TopRatesMoviesDataStore?

    // MARK: - Routing
    func routeToDetailsTop(name:String ,desc:String ,images:String ,lang:String) {
        let ViewController = TopRatesDetailsViewController()
        ViewController.nombreString = name
        ViewController.decripString = desc
        ViewController.imageString = images
        ViewController.language = lang
        self.viewController?.navigationController?.pushViewController(ViewController, animated: true)
    }
    // MARK: - Passing data

    //func passDataToSomewhere(source: TopRatesMoviesDataStore, destination: inout SomewhereDataStore) {
    //  destination.name = source.name
    //}
}
