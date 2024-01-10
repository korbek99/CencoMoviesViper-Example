//
//  TopRatesViewCell.swift
//  CencoMovieViper
//
//  Created by Jose David Bustos H on 09-03-23.
//

import UIKit

struct TopRatesViewCellModel {
    let name: String
    let title: String
    let lang: String
    let imagen: String
    init(name: String, title: String, lang: String, imagen: String) {
        self.name = name
        self.title = title
        self.lang = lang
        self.imagen = imagen
    }
}
class TopRatesViewCell: UITableViewCell {
    
    lazy var lblName: UILabel = {
        let label: UILabel = .init()
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var lbldescrip: UILabel = {
        let label: UILabel = .init()
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var lblLang: UILabel = {
        let label: UILabel = .init()
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var imgMovie: UIImageView = {
        let image: UIImageView = .init()
        image.contentMode = .scaleAspectFit
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 15.0
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configLabels()
        setupUIUX()
    }
    func setupUIUX() {
        self.backgroundColor = .white
        addSubview(lblName)
        addSubview(lbldescrip)
        addSubview(lblLang)
        addSubview(imgMovie)
        
        imgMovie.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
        imgMovie.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        imgMovie.heightAnchor.constraint(equalToConstant: 150).isActive = true
        imgMovie.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        lblName.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
        lblName.leadingAnchor.constraint(equalTo: imgMovie.trailingAnchor, constant: 10).isActive = true
        lblName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        lblName.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        
        lbldescrip.topAnchor.constraint(equalTo: lblName.bottomAnchor, constant: 10).isActive = true
        lbldescrip.leadingAnchor.constraint(equalTo: imgMovie.trailingAnchor, constant: 10).isActive = true
        lbldescrip.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        lbldescrip.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        lblLang.topAnchor.constraint(equalTo: lbldescrip.bottomAnchor, constant: 10).isActive = true
        lblLang.leadingAnchor.constraint(equalTo: imgMovie.trailingAnchor, constant: 10).isActive = true
        lblLang.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    func configLabels() {
        
        lblName.font = UIFont.boldSystemFont(ofSize: 20.0)
        lblName.textColor = UIColor.black
        lblName.numberOfLines = 0
        
        lbldescrip.font = UIFont.systemFont(ofSize: 15.0)
        lbldescrip.textColor = UIColor.gray
        lbldescrip.numberOfLines = 0
        
        lblLang.font = UIFont.boldSystemFont(ofSize: 20.0)
        lblLang.textColor = UIColor.orange
        lblLang.numberOfLines = 0
     
    }
    func configure(_ model: TopRatesViewCellModel) {
        var baseurl:String = ""
        baseurl = "http://image.tmdb.org/t/p/w500"
        DispatchQueue.main.async { [self] in
            print(baseurl + model.imagen)
            if let imageURL = URL(string: baseurl + model.imagen) {
           
                    let data = try? Data(contentsOf: imageURL)
                    if let data = data {
                        let image = UIImage(data: data)
                        imgMovie.image =  image
                    }
            }
        }
        
        lblName.text = model.name
        lbldescrip.text = model.title
        lblLang.text = "Language : " +  model.lang
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
