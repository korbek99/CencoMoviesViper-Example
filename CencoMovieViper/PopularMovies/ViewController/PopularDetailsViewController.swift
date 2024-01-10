//
//  PopularDetailsViewController.swift
//  CencoMovieViper
//
//  Created by Jose David Bustos H on 09-03-23.
//

import UIKit

class PopularDetailsViewController: UIViewController {
    
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
//    var latitud:String?
//    var lontitud:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        setUpTableViewregister()

        // Do any additional setup after loading the view.
    }
    
    private func setUpTableViewregister() {
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.register(HeaderTableViewPopCell.self, forCellReuseIdentifier: "HeaderTableViewPopCell")
        tableView.register(BodyTableViewPopCell.self, forCellReuseIdentifier: "BodyTableViewPopCell")
        tableView.register(FooterTableViewPopCell.self, forCellReuseIdentifier: "FooterTableViewPopCell")
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


extension PopularDetailsViewController:  UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
            return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderTableViewPopCell") as! HeaderTableViewPopCell
            cell.heightAnchor.constraint(equalToConstant: 300.0).isActive = true
            cell.configure(HeaderTableViewModelPop(name: String(nombreString!), title: String(decripString!), lang: String(language!)))
                    return cell
                }
        else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "BodyTableViewPopCell") as! BodyTableViewPopCell
            cell.heightAnchor.constraint(equalToConstant: 380.0).isActive = true
            cell.isUserInteractionEnabled = false
            cell.configure(BodyTableViewModelPop(urlImg: imageString!))

            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FooterTableViewPopCell") as! FooterTableViewPopCell
            cell.isUserInteractionEnabled = false
            cell.heightAnchor.constraint(equalToConstant: 120.0).isActive = true
            return cell
        }
//        let cell = UITableViewCell()
//        return cell
    }
}

