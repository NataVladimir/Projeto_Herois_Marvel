//
//  HomeView.swift
//  ProjComicsMarvel
//
//  Created by test on 28/02/23.
//

import UIKit

class HomeView: UIView {
    
    
    lazy var loadingIndicator: UIActivityIndicatorView = {
        let loading = UIActivityIndicatorView()
        loading.translatesAutoresizingMaskIntoConstraints = false
        loading.color = .yellow
        loading.style = .large
        return loading
    }()
    
    // Barra de navegação
    lazy var navView: BarraNavegaView = {
        let view = BarraNavegaView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // Table view
    lazy var tableViewComics: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .black
        table.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.identifier)
        table.register(SaveHeroTableViewCell.self, forCellReuseIdentifier: SaveHeroTableViewCell.identifier)
        return table
    }()
    
    public func configTableViewDelegate(delegate: UITableViewDelegate, dataSource: UITableViewDataSource){
        self.tableViewComics.delegate = delegate
        self.tableViewComics.dataSource = dataSource
    }
    
    public func reloadTableView(){
        self.tableViewComics.reloadData()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addElementos()
        self.setUpConstraints()
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addElementos(){
        self.addSubview(self.tableViewComics)
        self.addSubview(self.navView)
        //self.tableViewComics.backgroundView = self.loadingIndicator
        self.addSubview(self.loadingIndicator)
    }
    
    
    private func setUpConstraints(){
        NSLayoutConstraint.activate([
            
            self.navView.topAnchor.constraint(equalTo: self.topAnchor),
            self.navView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.navView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.navView.heightAnchor.constraint(equalToConstant: 140),
            
            self.tableViewComics.topAnchor.constraint(equalTo: self.navView.bottomAnchor),
            self.tableViewComics.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.tableViewComics.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.tableViewComics.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            self.loadingIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.loadingIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
}
