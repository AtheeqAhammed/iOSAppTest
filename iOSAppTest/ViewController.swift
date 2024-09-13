//
//  ViewController.swift
//  iOSAppTest
//
//  Created by Ateeq Ahmed on 13/09/24.
//

import UIKit
import Foundation


class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    var movies = [MovieModel]()
    var movie: MovieModel?
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
        getRequestFromServer()
       
    }
    
    func getRequestFromServer(){
        let path = Bundle.main.path(forResource: "File", ofType: "json")
        let url = URL(fileURLWithPath: path!)

        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let data = data {
                let url = Bundle.main.url(forResource: "police_stations", withExtension: "json")!
                let data = try Data(contentsOf: url)
            }
        }
        .resume()
        

    }
    
    func updateUI() {
        movie?.title = movies.first!.title
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as! MovieCell
        cell.moviePoster.image = UIImage(named: movies[indexPath.row].imagePortrait)
        return cell
    }
}
