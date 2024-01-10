//
//  PopularMoviesInteractor.swift
//  CencoMovieViper
//




protocol PopularMoviesBusinessLogic {
    func getInfoMoviesPopularInteractor()
}

protocol PopularMoviesDataStore {

}

class PopularMoviesInteractor: PopularMoviesBusinessLogic, PopularMoviesDataStore {

    // MARK: - Attributes

    var presenter: PopularMoviesPresentationLogic?
    var worker: PopularMoviesWorkerProtocol?
   // var analyticsService: GoogleAnalyticsInteractor?

    // MARK: - PopularMoviesDataStore

//    init(
//        analyticsService: GoogleAnalyticsInteractor = GoogleAnalyticsServiceInteractor()
//        ) {
//        worker = PopularMoviesWorker()
//        self.analyticsService = analyticsService
//    }

    // MARK: - PopularMoviesBusinessLogic
    
    func getInfoMoviesPopularInteractor(){
        webServicesPopular().getArticles() { [self] articles in
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
