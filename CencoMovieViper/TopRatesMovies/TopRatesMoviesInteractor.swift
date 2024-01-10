//
//  TopRatesMoviesInteractor.swift
//  CencoMovieViper
//




protocol TopRatesMoviesBusinessLogic {
    func getInfoMoviesTopInteractor()
}

protocol TopRatesMoviesDataStore {

}

class TopRatesMoviesInteractor: TopRatesMoviesBusinessLogic, TopRatesMoviesDataStore {

    // MARK: - Attributes

    var presenter: TopRatesMoviesPresentationLogic?
    var worker: TopRatesMoviesWorkerProtocol?
   // var analyticsService: GoogleAnalyticsInteractor?

    // MARK: - TopRatesMoviesDataStore

//    init(
//        analyticsService: GoogleAnalyticsInteractor = GoogleAnalyticsServiceInteractor()
//        ) {
//        worker = TopRatesMoviesWorker()
//        self.analyticsService = analyticsService
//    }

    // MARK: - TopRatesMoviesBusinessLogic
    
    func getInfoMoviesTopInteractor(){
        webServicesTopRates().getArticles() { [self] articles in
            if let articles = articles {
                print(articles)
                var moviesLista: [Movies]=[]
                for item in articles {
                    print(item.id)
                    moviesLista.append(Movies(adult: item.adult,
                                                    backdropPath: item.backdropPath,
                                                    genreIDS: item.genreIDS,
                                                    id: item.id,
                                                    originalLanguage: item.originalLanguage,
                                                    originalTitle: item.originalTitle,
                                                    overview: item.overview,
                                                    popularity: item.popularity,
                                                    posterPath: item.posterPath,
                                                    releaseDate: item.releaseDate,
                                                    title: item.title,
                                                    video: item.video,
                                                    voteAverage: item.voteAverage,
                                                    voteCount: item.voteCount))
                }
                presenter?.presentViewInfoMenuInfo(moviesLista)
            }
        }
    }
}
