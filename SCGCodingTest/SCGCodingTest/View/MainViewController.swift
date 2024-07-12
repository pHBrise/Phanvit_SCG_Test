//
//  ViewController.swift
//  SCGCodingTest
//
//  Created by Phanvit Chevamongkolnimit on 6/7/2567 BE.
//

import UIKit
import SDWebImage

class MainViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel = NewsViewModel()
    private var selectedArticle:Article?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        viewModel.fetchNews {[weak self] success in
            if success {
                self?.tableView.reloadData()
            } else {
                
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailViewController = segue.destination as? DetailViewController, let selectedArticle = selectedArticle else {
            return
        }
        detailViewController.article = selectedArticle
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as! ListCell
        cell.selectionStyle = .none
        let article = viewModel.articles[indexPath.row]
        if let urlImage = article.urlToImage {
            cell.newsImageView.sd_setImage(with: URL(string: urlImage), placeholderImage: nil)
        }
        cell.newsTitle.text = article.title
        cell.newsDetail.text = article.description
        cell.newsDate.text = article.publishedAt
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 128
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
      selectedArticle = viewModel.articles[indexPath.row]
      return indexPath
    }
}
