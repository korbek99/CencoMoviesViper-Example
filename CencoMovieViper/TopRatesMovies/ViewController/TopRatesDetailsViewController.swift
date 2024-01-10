//
//  TopRatesDetailsViewController.swift
//  CencoMovieViper
//
//  Created by Jose David Bustos H on 09-03-23.
//

import UIKit

class TopRatesDetailsViewController: UIViewController {

    // MARK: - IBOutlets

    lazy var tableView: UITableView = {
        let table: UITableView = .init()
        table.delegate = self
        table.dataSource = self
        table.separatorColor = UIColor.orange
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    // MARK: - Attributes
    
    var nombreString:String?
    var decripString:String?
    var imageString:String?
    var language:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        setUpTableViewregister()

        // Do any additional setup after loading the view.
    }
    
    private func setUpTableViewregister() {
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.register(HeaderTableViewTopCell.self, forCellReuseIdentifier: "HeaderTableViewTopCell")
        tableView.register(BodyTableViewTopCell.self, forCellReuseIdentifier: "BodyTableViewTopCell")
        tableView.register(FooterTableViewTopCell.self, forCellReuseIdentifier: "FooterTableViewTopCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setUpTableView() {
         view.addSubview(tableView)
         tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
         tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
         tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
         tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
     }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension TopRatesDetailsViewController:  UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
            return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderTableViewTopCell") as! HeaderTableViewTopCell
            cell.heightAnchor.constraint(equalToConstant: 200.0).isActive = true
            cell.configure(HeaderTableViewModelTop(name: String(nombreString!), title: String(decripString!), lang: String(language!)))
                    return cell
                }
        else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "BodyTableViewTopCell") as! BodyTableViewTopCell
            cell.heightAnchor.constraint(equalToConstant: 280.0).isActive = true
            cell.isUserInteractionEnabled = false
            cell.configure(BodyTableViewModelTop(urlImg: imageString!))

            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FooterTableViewTopCell") as! FooterTableViewTopCell
            cell.isUserInteractionEnabled = false
            cell.heightAnchor.constraint(equalToConstant: 120.0).isActive = true
            return cell
        }
//        let cell = UITableViewCell()
//        return cell
    }
}

