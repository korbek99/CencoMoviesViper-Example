//
//  TopRatesMoviesViewController.swift
//  CencoMovieViper
//


import UIKit
struct ViewModelErrorTop {
    let title: String
    let message: String
    let icon: String
    let code: String
    var animated: Bool = true
}
protocol TopRatesMoviesDisplayLogic: AnyObject {
    func displayViewTextsInfo(listaMovies: [Movies])
    func displayDiscountNotFoundError(viewModel: ViewModelErrorTop)
    func displayConnectionError(viewModel: ViewModelErrorTop)
     func startloading()
     func stoploading()
}

class TopRatesMoviesViewController: UIViewController, TopRatesMoviesDisplayLogic {

    var listMenus = [Movies]()
    var searching = false
    var searchedMenu =  [Movies]()
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var interactor: TopRatesMoviesBusinessLogic?
    var router: (NSObjectProtocol & TopRatesMoviesRoutingLogic & TopRatesMoviesDataPassing)?

    // MARK: - Object lifecycle

    init() {
        super.init(nibName: nil, bundle: nil)
        setup()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    // MARK: - Setup

    private func setup() {
        let viewController = self
        let interactor = TopRatesMoviesInteractor()
        let presenter = TopRatesMoviesPresenter()
        let router = TopRatesMoviesRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }

    // MARK: - IBOutlets
    lazy var tableView: UITableView = {
        let table: UITableView = .init()
        table.delegate = self
        table.dataSource = self
        table.register(TopRatesViewCell.self, forCellReuseIdentifier: "TopRatesViewCell")
        table.rowHeight = 200.0
        table.separatorColor = UIColor.orange
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

    // MARK: - Attributes
    public var listMovies: [Movies] = []
    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        startloading()
        interactor?.getInfoMoviesTopInteractor()
        configureSearchController()
    }

    func configureSearchController(){
        
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.enablesReturnKeyAutomatically  = false
        searchController.searchBar.returnKeyType = UIReturnKeyType.done
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
        searchController.searchBar.placeholder = "Buscar por nombre"
        
    }
    
    // MARK: - Private
    private func setUpTableView() {
         view.addSubview(tableView)
         tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
         tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
         tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
         tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
     }
    // MARK: - Public
    public func startloading(){
        let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.gray
        loadingIndicator.startAnimating();
        alert.view.addSubview(loadingIndicator)
        self.present(alert, animated: true, completion: nil)
    }
    
    public func stoploading(){
        self.dismiss(animated: false, completion: nil)
    }
    // MARK: - Actions

    // MARK: - TopRatesMoviesDisplayLogic
    func displayViewTextsInfo(listaMovies: [Movies]) {
        for items in listaMovies {
            listMovies.append(Movies(adult: items.adult,
            backdropPath: items.backdropPath,
            genreIDS: items.genreIDS,
            id: items.id,
            originalLanguage: items.originalLanguage,
            originalTitle: items.originalTitle,
            overview: items.overview,
            popularity: items.popularity,
            posterPath: items.posterPath,
            releaseDate: items.releaseDate,
            title: items.title,
            video: items.video,
            voteAverage: items.voteAverage,
            voteCount: items.voteCount))
        }
        DispatchQueue.main.async { [self] in
            self.tableView.reloadData()
            stoploading()
        }
    }
    
    func displayDiscountNotFoundError(viewModel: ViewModelErrorTop) {

    }
    func displayConnectionError(viewModel: ViewModelErrorTop) {

    }
}
extension TopRatesMoviesViewController:  UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating, UISearchBarDelegate {
    
    func updateSearchResults(for searchController: UISearchController) {
       let searchText = searchController.searchBar.text!
       if !searchText.isEmpty {
           searching = true
           searchedMenu.removeAll()
           for item in listMovies {
               if item.originalTitle.lowercased().contains(searchText.lowercased())
               {
                   searchedMenu.append(item)
               }
           }
       }else{
           searching = false
           searchedMenu.removeAll()
           searchedMenu = listMovies
       }
       
       tableView.reloadData()
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar)
    {
       searching = false
       searchedMenu.removeAll()
       tableView.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching{
            return searchedMenu.count
        }else{
            return listMovies.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TopRatesViewCell") as? TopRatesViewCell else { return UITableViewCell() }
        
        if searching {
            cell.configure(TopRatesViewCellModel(name: searchedMenu[indexPath.row].title, title: searchedMenu[indexPath.row].overview, lang: String(searchedMenu[indexPath.row].originalLanguage), imagen: searchedMenu[indexPath.row].posterPath))
        } else {
            cell.configure(TopRatesViewCellModel(name: listMovies[indexPath.row].title, title: listMovies[indexPath.row].overview, lang: String(listMovies[indexPath.row].originalLanguage), imagen: listMovies[indexPath.row].posterPath))
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if searching {
            router?.routeToDetailsTop(name:searchedMenu[indexPath.row].title ,desc:searchedMenu[indexPath.row].overview ,images:String(searchedMenu[indexPath.row].posterPath),lang: searchedMenu[indexPath.row].originalLanguage)
        } else {
            router?.routeToDetailsTop(name:listMovies[indexPath.row].title ,desc:listMovies[indexPath.row].overview ,images:String(listMovies[indexPath.row].posterPath),lang: listMovies[indexPath.row].originalLanguage)
            
        }
        
    }
}
