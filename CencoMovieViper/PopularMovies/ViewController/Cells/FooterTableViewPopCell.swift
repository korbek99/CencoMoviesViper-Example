//
//  FooterTableViewCell.swift
//  CencoMovieViper
//
//  Created by Jose David Bustos H on 09-03-23.
//
import UIKit

class FooterTableViewPopCell: UITableViewCell {
    override func prepareForReuse() {
    }
    // MARK: - IBOutlets
    lazy var btnContinuar: UIButton = {
        let button: UIButton = .init()
        button.backgroundColor = .white
        button.setTitle("Continuar", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.layer.cornerRadius = 25
        button.layer.borderWidth = 1
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configButton()
        setupUIUX()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Functions
    func configButton(){
        
    }
    func setupUIUX() {
        self.backgroundColor = .white
        addSubview(btnContinuar)
        btnContinuar.topAnchor.constraint(equalTo: topAnchor, constant: 30).isActive = true
        btnContinuar.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        btnContinuar.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        btnContinuar.heightAnchor.constraint(equalToConstant: 50).isActive = true
        btnContinuar.widthAnchor.constraint(equalToConstant: 250).isActive = true
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

