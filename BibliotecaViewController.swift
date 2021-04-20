//
//  BibliotecaViewController.swift
//  Biblioteca
//
//  Created by aluno on 13/04/21.
//  Copyright © 2021 Cesar School. All rights reserved.
//

import UIKit
import Nuke

class BibliotecaViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!

    let reuseIdentifier = "LivroCell"
    let biblioteca = Biblioteca.shared
    let prefetcher = ImagePrefetcher()
    
    let arrayOfSongsURL : [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "LivroCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.dataSource = self
        collectionView.prefetchDataSource = self
    
    }
}

extension BibliotecaViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        biblioteca.livros.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! LivroCell

        let livro = biblioteca.livros[indexPath.row]
        cell.titleLabel.text = livro.title

        let gestureRecognizer = MyTapGesture(target: self, action: #selector(tap(_:)))
        gestureRecognizer.livro = livro
        cell.addGestureRecognizer(gestureRecognizer)
        
        //utilizando cache para imagens
        if let url = livro.thumbnailUrl {
            Nuke.loadImage(with: url, into: cell.imageView)
        }
        return cell
    }
    
    @objc func tap(_ sender: MyTapGesture) {
        let detailsView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BookDetailView") as! DetalhesViewController
        
        detailsView.livro = sender.livro
        
        navigationController?.pushViewController(detailsView, animated: true)
    }
}

class MyTapGesture: UITapGestureRecognizer {
    var livro = Livro()
}

extension BibliotecaViewController: UICollectionViewDataSourcePrefetching {
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        let urls = indexPaths.compactMap { indexPath in
            Biblioteca.shared.livros[indexPath.row].thumbnailUrl
        }
        prefetcher.startPrefetching(with: urls)
    }

    func collectionView(_ collectionView: UICollectionView, cancelPrefetchingForItemsAt indexPaths: [IndexPath]) {

        let urls = indexPaths.compactMap { indexPath in
            Biblioteca.shared.livros[indexPath.row].thumbnailUrl
        }
        prefetcher.stopPrefetching(with: urls)
    }
}
