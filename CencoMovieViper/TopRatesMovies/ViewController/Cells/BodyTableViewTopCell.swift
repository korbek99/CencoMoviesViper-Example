//
//  BodyTableViewCell.swift
//  CencoMovieViper
//
//  Created by Jose David Bustos H on 09-03-23.
//

import UIKit
struct BodyTableViewModelTop {
    let urlImg: String
    
    init(urlImg: String) {
        self.urlImg = urlImg
    }
}
class BodyTableViewTopCell: UITableViewCell {
 
    override func prepareForReuse() {
    }
    // MARK: - IBOutlets
    lazy var imgMenuDetail: UIImageView = {
        let image: UIImageView = .init()
        image.contentMode = .scaleAspectFit
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 20.0
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    // MARK: - init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUIUX()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(_ model: BodyTableViewModelTop) {
        var baseurl:String = ""
        baseurl = "http://image.tmdb.org/t/p/w500"
        if let imageURL = URL(string: baseurl + model.urlImg) {
       
                let data = try? Data(contentsOf: imageURL)
                if let data = data {
                    let image = UIImage(data: data)
                    imgMenuDetail.image =  image
                }
        }
    }
    
    // MARK: - Functions
    func setupUIUX() {
        self.backgroundColor = .white
        addSubview(imgMenuDetail)
        
        imgMenuDetail.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        imgMenuDetail.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        imgMenuDetail.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
        imgMenuDetail.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 5).isActive = true
        
        imgMenuDetail.heightAnchor.constraint(equalToConstant: 250).isActive = true
        imgMenuDetail.widthAnchor.constraint(equalToConstant: 250).isActive = true
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

