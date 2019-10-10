//
//  AnimeDetailVC.swift
//  AnimeListStarter
//
//  Created by C4Q on 10/10/19.
//  Copyright © 2019 Iram Fattah. All rights reserved.
//

import UIKit

class AnimeDetailVC: UIViewController {

    lazy var detailImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.backgroundColor = .red
        return iv
    }()
    
    
    
    lazy var showNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    lazy var showRatingLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    lazy var faveButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.blue, for: .normal)
        button.setTitle("Favorite", for: .normal)
        button.isEnabled = true
        button.addTarget(self, action: #selector(faveButtonPressed), for: .touchUpInside)
        return button
    }()
    
    
    
    
    
    
    
    var anime: Anime!
    
    
     public enum Saved {
        case yes
        case no
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureDetailImageView()
        configureStackView()
        configureButton()
        loadDetails()

       
    }
    
    
//MARK: - Private functions
    
    
    @objc func faveButtonPressed() {
        if let existsInFaves = anime.existsInFavorites() {
            switch existsInFaves {
            case false:
                do {
                    try AnimePersistenceManager.manager.saveAnime(anime: anime)
                    showAlert(if: .no)
                }
                    catch {
                        print(error)
                    }
                    default:
                    showAlert(if: .yes)
                }
            }
        }
    

    
    private func showAlert(if saved: Saved) {
        switch saved {
            
        case .yes:
            let alert = UIAlertController(title: "Sorry", message: "This is already in your favorites", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        case .no:
            let alert = UIAlertController(title: "YES!", message: "You have saved to favorites", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
       
    }
        
    }
    
    private func loadDetails() {
        showRatingLabel.text = "Score \(anime.score)/10.0"
        showNameLabel.text = anime.title
        let url = anime.imageUrl
        
        
        if let image = ImageHelper.shared.image(forKey: (url as NSString)) {
            detailImageView.image = image
        } else {
            ImageHelper.shared.getImage(urlStr:url) { (result) in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let image):
                        self.detailImageView.image = image
                    case .failure(let error):
                        print(error)
                    }
                }
            }
        }
    }

 //MARK: - constraint Functions
    
    private func configureDetailImageView() {
        view.addSubview(detailImageView)
        detailImageView.translatesAutoresizingMaskIntoConstraints = false
        detailImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        detailImageView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.4).isActive = true
        detailImageView.widthAnchor.constraint(equalTo: detailImageView.heightAnchor, multiplier: 0.75).isActive = true
        detailImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
    }
    
    
    private func configureStackView() {
        let stackView = UIStackView(arrangedSubviews: [showNameLabel, showRatingLabel])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        view.addSubview(stackView)
        
        
        
        stackView.topAnchor.constraint(equalTo: detailImageView.bottomAnchor, constant: 40).isActive = true
        
        stackView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8).isActive = true
        
        stackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        stackView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.15).isActive = true
    }
    
    
    private func configureButton() {
        view.addSubview(faveButton)
        faveButton.translatesAutoresizingMaskIntoConstraints = false
        faveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        faveButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40).isActive = true
        faveButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        faveButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
    }

}
