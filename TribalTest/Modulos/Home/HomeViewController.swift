//
//  HomeViewController.swift
//  TribalTest
//
//  Created by Azteca on 28/10/21.
//

import UIKit
import SDWebImage

class HomeViewController: UIViewController, HomeViewProtocol {
    
    
    @IBOutlet weak var mTableView: UITableView!
    
    var presenter: HomePresenterProtocol?
    var photos:[Result] = []
    var paginas = 1
    var isUpdating = false
    override func viewDidLoad() {
        super.viewDidLoad()

        self.initTableView()
        self.presenter?.callImages(page: paginas)
        
        
    }
    
    /// metodo para inicializar la tabla y registrar la celda
    private func initTableView(){
        self.mTableView.register(UINib.init(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeTableViewCell")
        self.mTableView.rowHeight = 100
        self.mTableView.dataSource = self
        self.mTableView.delegate = self
    }
    
    /// metodo para cargar las imagenes y actualizar la tabla
    func loadImages(result: [Result]) {
        self.photos = photos + result
        self.mTableView.reloadData()
        self.isUpdating = false
    }
    
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.photos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        cell.loadInfo(info: photos[indexPath.row])
        
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let height = scrollView.frame.size.height
        let contentYoffset = scrollView.contentOffset.y
        let distanceFromBottom = scrollView.contentSize.height - contentYoffset
        if distanceFromBottom < height {
            if !isUpdating {
                self.isUpdating = true
                self.paginas += 1
                self.presenter?.callImages(page: paginas )
            }
        }
    }
    
    
}
