//
//  ViewController.swift
//  CaringCollection
//
//  Created by Denis Evdokimov on 11/27/23.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var collectionView: UICollectionView = {
          let layout = CollectionFlowLayout()
          layout.scrollDirection = .horizontal
          layout.itemSize = CGSize(width: 280, height: 480)
          let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
          collection.backgroundColor = .clear
          collection.showsHorizontalScrollIndicator = false
          collection.translatesAutoresizingMaskIntoConstraints = false
    
          return collection
      }()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .automatic
        title = "Collection"
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CollectionCell.self, forCellWithReuseIdentifier: CollectionCell.identifier)
        setupConstraint()
    }

    private func  setupConstraint() {
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionCell.identifier,
                                                            for: indexPath) as? CollectionCell
        else { return UICollectionViewCell() }

        return cell
    }
}


