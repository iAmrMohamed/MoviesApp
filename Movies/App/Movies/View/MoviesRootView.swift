//
//  MoviesRootView.swift
//  Movies
//
//  Created by Amr Mohamed on 10/11/2023.
//

import UIKit
import Combine

class MoviesRootView: UIView {
    enum Section {
        case main
    }
    
    private let collectionView: UICollectionView
    
    private var observers = Set<AnyCancellable>()
    private var dataSource: UICollectionViewDiffableDataSource<Section, Movie>?
    
    private var imageCache = [String: UIImage]()
    
    private(set) var viewModel: MoviesViewModel?
    
    override init(frame: CGRect) {
        collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: Self.collectionViewLayout()
        )
        
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        addCollectionView()
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        backgroundColor = .white
        collectionView.delegate = self
        
        let cellRegistration = UICollectionView.CellRegistration<MovieCell, Movie>(
            cellNib: UINib(nibName: MovieCell.reuseIdentifier, bundle: nil)
        ) { [weak self] cell, indexPath, movie in
            self?.configureCell(cell: cell, with: movie)
        }
        
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView) { collectionView, indexPath, item in
            collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: item)
        }
    }
    
    public func setupViewModel(_ viewModel: MoviesViewModel) {
        self.viewModel = viewModel
        
        viewModel.$movies.removeDuplicates().sink { [weak self] movies in
            guard let self = self else { return }
            updateMoviesSnapshot(movies: movies)
        }.store(in: &observers)
    }
    
    private func updateMoviesSnapshot(movies: [Movie]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Movie>()
        
        snapshot.appendSections([.main])
        snapshot.appendItems(movies)
        
        dataSource?.apply(snapshot)
    }
}

extension MoviesRootView {
    func configureCell(cell: MovieCell, with movie: Movie) {
        cell.titleLabel.text = movie.title
        cell.dateLabel.text = movie.date
    }
}

extension MoviesRootView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let movie = dataSource?.itemIdentifier(for: indexPath) else {
            return
        }
        
        viewModel?.select(movie: movie)
    }
}

extension MoviesRootView {
    private func addCollectionView() {
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}

extension MoviesRootView {
    static func collectionViewLayout() -> UICollectionViewCompositionalLayout {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        ))
        
        item.contentInsets = .init(top: 10, leading: 10, bottom: 10, trailing: 10)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.6))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        return UICollectionViewCompositionalLayout(section: section)
    }
}
