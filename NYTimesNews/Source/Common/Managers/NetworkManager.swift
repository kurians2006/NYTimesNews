//
//  NetworkManager.swift
//  NYTimesNews
//
//  Created by Naeem Paracha on 13/10/2021.
//

import Foundation
import UIKit

// MARK: - Response

public struct Response<Value> {

    /// The URL request sent to the server
    public let requestURL: URL?

    /// The data returned by the server
    public let data: Data?

    /// Decoded Result
    public let result: Value?

    /// Error received
    public let error: Error?
}



// MARK: - BaseResult
public protocol BaseResult: Decodable {}



// MARK: - NetworkManager

open class NetworkManager {

    static let shared = NetworkManager()
    let session  = URLSession.shared

    var imageCache = NSCache<NSURL,AnyObject>()

    func start<T: BaseResult>(request: URL, complition: ((Response<T>) -> Void)?) {

        let dataTask = session.dataTask(
        with: request) { ( data, response, error) in

            if error != nil {
                print(error!.localizedDescription)
            }

            guard let data = data else { return }

            if let model = try? JSONDecoder().decode(T.self, from: data) {
                let result = Response(
                    requestURL: request,
                    data: data,
                    result: model,
                    error: error
                )
                complition?(result)
            }
        }
        dataTask.resume()
    }
}


// MARK: - NetworkManager Extension for download image
extension NetworkManager {

    func downloadImage(with url: URL, imageView: UIImageView) -> URLSessionDataTask {

        let task = URLSession.shared.dataTask(with: url)  { (data, _, _) in
            if let data = data, let image = UIImage(data: data) {
                self.imageCache.setObject(image, forKey: url as NSURL)
                DispatchQueue.main.async {
                    imageView.image = image
                }
            }
        }
        task.resume()
        return task
    }
}
