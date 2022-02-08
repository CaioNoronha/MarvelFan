//
//  ViewController.swift
//  MarvelFan
//
//  Created by Caio Noronha on 27/07/21.
//

import UIKit
import Cartography

class ViewController: UIViewController, ViewCode {

    let characters = MockedData.getCharacters()
    let filters = MockedData.getFilter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        view = HomeView(viewOwner: self)
    }
    
    //MARK: Methods
    func build() {
    }
    
    func setupConstrains() {
    }
    
    func configure() {
    }
}

/*
 -> Enviar ações por modelos de "Requests" para o Interactor
 -> Mostrar em uma view a "ViewModel" recebida do Presenter
 */



extension ViewController: UITableViewDelegate, UICollectionViewDelegate {
    
    //tableView
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? HomeCell else { return }
        
        cell.backgroundView?.backgroundColor = Color.darkBlue
        cell.selectedBackgroundView?.backgroundColor = Color.lightBlue
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
    }
    
    //Collection
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? FilterCell else { return }
        cell.backgroundColor = Color.lightPurple
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? FilterCell else { return }
        cell.backgroundColor = Color.lightBlue

    }
}

extension ViewController: UITableViewDataSource, UICollectionViewDataSource {
    
    //TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as? HomeCell else { return UITableViewCell() }
        
        cell.configure(with: characters[indexPath.row])
        
        return cell
    }

    //Collection
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return filters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FilterCell", for: indexPath) as? FilterCell else { return UICollectionViewCell() }
        
        cell.configure(with: filters[indexPath.row])
        
        return cell
    }
}

