//
//  View.swift
//  MarvelFan
//
//  Created by Caio Noronha on 10/09/21.
//
import Cartography
import UIKit

public typealias ViewOwner = UITableViewDelegate & UICollectionViewDelegate & UITableViewDataSource & UICollectionViewDataSource

final class HomeView: UIView {
    
    //MARK: - Attributes
    
    private lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.text = "Marvel Characters"
        title.textAlignment = .left
        title.font = UIFont.boldSystemFont(ofSize: 24)
        title.textColor = .white
        return title
    }()
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.barTintColor = Color.darkBlue
        searchBar.searchTextField.textColor = .white
        searchBar.placeholder = "Pesquisar"
        return searchBar
    }()
    
    private lazy var filterCarousel: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
                
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)       
        collectionView.register(FilterCell.self, forCellWithReuseIdentifier: "FilterCell")
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        
        return collectionView
    }()
    
    private lazy var characterCarousel: UITableView = {
        let tableView = UITableView()
        tableView.register(HomeCell.self, forCellReuseIdentifier: "HomeCell")
        //tableView.rowHeight = 70
        tableView.rowHeight = 200
        tableView.backgroundColor = Color.darkBlue
        tableView.separatorColor = Color.lightBlue
        return tableView
    }()
    
    //MARK: - Initializer
    
    init(viewOwner: ViewOwner) {
        super.init(frame: .zero)
        setup()
        register(viewOwner: viewOwner)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        nil
    }
    
    //MARK: - Methods
    
    private func register(viewOwner: ViewOwner) {
        characterCarousel.dataSource = viewOwner
        characterCarousel.delegate = viewOwner
        
        filterCarousel.dataSource = viewOwner
        filterCarousel.delegate = viewOwner
    }
    
    private func setup() {
        addSubview(titleLabel)
        addSubview(searchBar)
        addSubview(filterCarousel)
        addSubview(characterCarousel)
        
        self.backgroundColor = Color.darkBlue
        setupConstrains()
    }
    
    private func setupConstrains() {
        
        ///leading = left
        ///trailing = right
        ///Botton = Under/BaseLine
        
        constrain(titleLabel, self) { title, view in
            title.top == view.topMargin
            title.leading == view.leadingMargin
        }
        
        constrain(searchBar, titleLabel, self) { searchBar, title, view in
            searchBar.leading == view.leading
            searchBar.trailing == view.trailing
            searchBar.top == title.bottom + 20
        }
        
        constrain(filterCarousel, searchBar, self) { collectionView, searchBar, view in
            collectionView.leading == view.leading
            collectionView.trailing == view.trailing
            collectionView.height == 40
            collectionView.top == searchBar.bottom
        }
            
        constrain(characterCarousel, filterCarousel, self) { tableView, filter, view in
            tableView.leading == view.leading
            tableView.trailing == view.trailing
            tableView.bottom == view.bottom
            tableView.top == filter.bottom + 10
        }
    }
}

