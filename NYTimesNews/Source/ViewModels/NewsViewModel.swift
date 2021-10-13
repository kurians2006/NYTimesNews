//
//  NewsViewModel.swift
//  NYTimesNews
//
//  Created by Naeem Paracha on 13/10/2021.
//

import Foundation

// MARK: - NewsListingViewModelDelegate

protocol NewsListingViewModelDelegate: AnyObject {
    func didFetchNews(isSuccessFull: Bool)
}

// MARK: - NewsListingViewModel

class NewsListingViewModel {

    var news: [NewsModel]?
    var delegate: NewsListingViewModelDelegate?

    init() {
    }

    //MARK:- Get Cell Models
    func getCellViewModel(at indexPath: IndexPath) -> NewsModel {
        return news![indexPath.row]
    }
    
    func fetchNews() {

        guard let url = Constants.URLForApi() else { return }

        NetworkManager.shared.start(request: url) { [unowned self] (response: Response<NYNews>) in

            news = response.result?.news
            delegate?.didFetchNews(isSuccessFull: response.error == nil)
        }
    }

}
