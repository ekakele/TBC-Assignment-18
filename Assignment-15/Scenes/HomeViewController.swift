//
//  HomeViewController.swift
//  Assignment-18: Assignment-15 + API
//
//  Created by Eka Kelenjeridze on 03.11.23.
//  Modified by Eka Kelenjeridze on 11.11.23.
//

import UIKit

final class HomeViewController: UIViewController {
    
    // MARK: - Properties
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Logo")
        imageView.frame = CGRect(x: 0, y: 0, width: 48, height: 48)
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let profileButton: UIButton = {
        let button = UIButton()
        button.setTitle("Profile", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 1, green: 0.502, blue: 0.212, alpha: 1)
        button.layer.cornerRadius = 8
        button.frame = CGRect(x: 0, y: 0, width: 77, height: 40)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.shadowColor = CGColor(red: 1, green: 0.502, blue: 0.212, alpha: 0.25)
        button.layer.shadowOpacity = 1
        button.layer.shadowRadius = 16
        button.clipsToBounds = false
        button.layer.shadowOffset = CGSize(width: 0, height: 4)
        button.contentEdgeInsets = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        return button
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Now in cinemas"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let moviesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    private var searchedMovies = [Movie]()
    
    // MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackground()
        setupSubviews()
        setupNavigationBar()
        setupLabelConstraints()
        setupCollectionView()
        setupCollectionViewConstraints()
        fetchMovies()
    }
    
    // MARK: - Private Methods
    private func setupBackground() {
        view.backgroundColor = UIColor(red: 0.1, green: 0.13, blue: 0.2, alpha: 1)
    }
    
    private func setupNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            customView: logoImageView
        )
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            customView: profileButton
        )
    }
    
    private func setupSubviews() {
        view.addSubview(titleLabel)
        setupCollectionView()
    }
    
    private func setupLabelConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.widthAnchor.constraint(equalToConstant: 342),
            titleLabel.heightAnchor.constraint(equalToConstant: 29),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
    }
    
    private func setupCollectionView() {
        view.addSubview(moviesCollectionView)
        
        moviesCollectionView.dataSource = self
        moviesCollectionView.delegate = self
        
        moviesCollectionView.register(
            MovieCollectionViewCell.self,
            forCellWithReuseIdentifier: MovieCollectionViewCell.identifier
        )
    }
    
    private func setupCollectionViewConstraints() {
        NSLayoutConstraint.activate([
            moviesCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 61),
            moviesCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            moviesCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            moviesCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func fetchMovies() {
        APIService.fetchMovies { [weak self] searchedMovies in
            guard let self = self, let searchedMovies = searchedMovies else { return }
            DispatchQueue.main.async {
                self.searchedMovies = searchedMovies
                self.moviesCollectionView.reloadData()
            }
        }
    }
}

// MARK: - CollectionView DataSource
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchedMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath) as? MovieCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.configure(with: searchedMovies[indexPath.row])
        return cell
    }
}
// MARK: - CollectionView Delegate
extension HomeViewController: UICollectionViewDelegate {
    //    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    //        let movieDetailsPage = MovieDetailViewController()
    //        movieDetailsPage.configure(with: movies[indexPath.row])
    //        navigationController?.pushViewController(movieDetailsPage, animated: true)
    //    }
}

// MARK: - CollectionView DelegateFlowLayout
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = Int((view.frame.width / 2) - 24)
        let height = 278
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 32, right: 16)
    }
}
