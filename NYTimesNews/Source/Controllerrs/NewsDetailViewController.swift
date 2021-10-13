//
//  NewsDetailViewController.swift
//  NYTimesNews
//
//  Created by Naeem Paracha on 13/10/2021.
//

import Foundation
import UIKit

class NewsDetailViewController: UIViewController {
    //MARK:- IBOutlets
    @IBOutlet weak var articleImage:   UIImageView!
    @IBOutlet weak var byLabel:        UILabel!
    @IBOutlet weak var publishedLabel: UILabel!
    @IBOutlet weak var content:        UILabel!
    //MARK:- Let & Var
    var article:NewsModel?
    //MARK:- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupArticleData(article: article)
    }
    func setupArticleData(article:NewsModel?){
        if let articleDetails = article {
            content.text         = articleDetails.title
            byLabel.text         = articleDetails.byline
            publishedLabel.text  = articleDetails.publishedDate
            let imageURLString: String? = articleDetails.media?.first?.mediaMetadata?.first(
                where: {$0.format == .large}
            )?.url

            if let imageURL = imageURLString,
                let url = URL(string: imageURL) {
                _ = articleImage?.setImage(from: url)
            }
        }
    }
}
