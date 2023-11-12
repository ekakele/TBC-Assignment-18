//
//  MovieCollectionViewCell.swift
//  Assignment-18: Assignment-15 + API
//
//  Created by Eka Kelenjeridze on 03.11.23.
//  Modified by Eka Kelenjeridze on 11.11.23.
//

import UIKit

final class MovieCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MovieCollectionViewCell"
    
    // MARK: - Properties
    private let cellStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let movieImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private var addToFavoritesButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = .red
        button.frame = CGRect(x: 10, y: 5, width: 20, height: 20)
        return button
    }()
    
    private let imdbIDLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        label.layer.cornerRadius = 16
        label.backgroundColor = UIColor(red: 1, green: 0.502, blue: 0.212, alpha: 1)
        label.frame = CGRect(x: 80, y: 4, width: 80, height: 23)
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private let yearLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.textColor = .white
        return label
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSubviews()
        setupAddToFavoritesButtonAction()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - PrepareForReuse
    override func prepareForReuse() {
        super.prepareForReuse()
        
        movieImageView.image = nil
        addToFavoritesButton.tintColor = nil
        imdbIDLabel.text = nil
        titleLabel.text = nil
        yearLabel.text = nil
    }
    
    // MARK: - Configure
    func configure(with movie: Movie) {
        titleLabel.text = movie.title
        yearLabel.text = String(movie.year)
        imdbIDLabel.text = movie.imdbID
        if let url = URL(string: movie.poster) {
            loadImage(from: url)
        }
    }
    
    // MARK: - Private Methods
    private func setupSubviews() {
        setupCellStackView()
        setupMovieImageViewConstraints()
        setupLabelsConstraints()
    }
    
    private func setupCellStackView() {
        contentView.addSubview(cellStackView)
        
        cellStackView.addArrangedSubview(movieImageView)
        cellStackView.addArrangedSubview(titleLabel)
        cellStackView.addArrangedSubview(yearLabel)
        
        cellStackView.addSubview(imdbIDLabel)
        cellStackView.addSubview(addToFavoritesButton)
        
        NSLayoutConstraint.activate([
            // self = UITableViewCell
            cellStackView.topAnchor.constraint(equalTo: self.topAnchor),
            cellStackView.leftAnchor.constraint(equalTo: self.leftAnchor),
            cellStackView.rightAnchor.constraint(equalTo: self.rightAnchor),
            cellStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    private func setupMovieImageViewConstraints() {
        NSLayoutConstraint.activate([
            movieImageView.topAnchor.constraint(equalTo: cellStackView.topAnchor),
            movieImageView.leadingAnchor.constraint(equalTo: cellStackView.leadingAnchor),
            movieImageView.trailingAnchor.constraint(equalTo: cellStackView.trailingAnchor),
            movieImageView.bottomAnchor.constraint(equalTo: cellStackView.bottomAnchor, constant: -48)
        ])
    }
    
    private func setupLabelsConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: movieImageView.bottomAnchor, constant: 8),
            yearLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4)
        ])
    }
    
    private func setupAddToFavoritesButtonAction() {
        addToFavoritesButton.addAction(UIAction(handler: { [weak self] _ in
            self?.addToFavoritesButtonClicked()
        }), for: .touchUpInside)
    }
    
    private func addToFavoritesButtonClicked() {
        if self.isSelected == true {
            self.addToFavoritesButton.setImage(UIImage(systemName: "heart"), for: .normal)
            self.addToFavoritesButton.tintColor = .black
            self.isSelected = false
        } else {
            self.addToFavoritesButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            self.addToFavoritesButton.tintColor = .red
            self.isSelected = true
        }
    }
    
    private func loadImage(from url: URL) {
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self, let data = data, error == nil else {
                return
            }
            DispatchQueue.main.async {
                self.movieImageView.image = UIImage(data: data)
            }
        }.resume()
    }
}
