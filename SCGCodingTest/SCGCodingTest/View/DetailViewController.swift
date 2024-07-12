//
//  DetailViewController.swift
//  SCGCodingTest
//
//  Created by Phanvit Chevamongkolnimit on 12/7/2567 BE.
//

import UIKit
import SDWebImage

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleNews: UILabel!
    @IBOutlet weak var detailNews: UITextView!
    var article:Article?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let article = article else {
            return
        }
        if let urlImage = article.urlToImage {
            imageView.sd_setImage(with: URL(string: urlImage))
        }
        titleNews.text = article.title
        detailNews.text = article.content
    }
    
}
