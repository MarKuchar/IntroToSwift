//
//  ViewController.swift
//  HTTPandURLSession1Demo
//
//  Created by Derrick Park on 5/21/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import UIKit
import SDWebImage

extension URL {
  func withQueries(_ queries: [String: String]) -> URL? {
    var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
    components?.queryItems = queries.map { URLQueryItem(name: $0.key, value: $0.value) }
    return components?.url
  }
}

class ViewController: UIViewController {
  
  @IBOutlet var titleLabel: UILabel!
  @IBOutlet var imageView: UIImageView!
  @IBOutlet var copyrightLabel: UILabel!
  @IBOutlet var indicator: UIActivityIndicatorView!
  
  // @escaping keyword tells the compiler that the code in the closure will be executed after
  // the function has returned, or has finished executing all the code.
  fileprivate func fetchPhotoInfo(queries: [String: String], completion: @escaping (PhotoInfo) -> Void) {
    // 1. create url
    let baseURL = URL(string: "https://api.nasa.gov/planetary/apod")!
    
    let url = baseURL.withQueries(queries)!
    
    // 2. create a data task
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
      if let err = error {
        print(err.localizedDescription)
        return
      }
      
      let decoder = JSONDecoder()
      if let data = data, let photoInfo = try? decoder.decode(PhotoInfo.self, from: data) {
        completion(photoInfo)
      }
    }
    indicator.startAnimating()
    // 3. resume
    task.resume()
    print("Done")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    titleLabel.text = ""
    copyrightLabel.text = ""
    
    let queries = [
      "date": "2020-5-21",
      "api_key": "DEMO_KEY"
    ]
    
    fetchPhotoInfo(queries: queries) { (photoInfo) in
      self.updateUI(with: photoInfo)
    }
    
    indicator.hidesWhenStopped = true
  }
  
  func updateUI(with photoInfo: PhotoInfo) {
    DispatchQueue.main.async {
      self.titleLabel.text = photoInfo.title
      self.imageView.sd_setImage(with: photoInfo.url, placeholderImage: nil)
      if let copyright = photoInfo.copyright {
        self.copyrightLabel.text = "Copyright ©\(copyright)"
      } else {
        self.copyrightLabel.isHidden = true
      }
      self.indicator.stopAnimating()
    }
  }
  
  //  func updateUI(with photoInfo: PhotoInfo) {
  //    let task = URLSession.shared.dataTask(with: photoInfo.url) { (data, response, error) in
  //      guard let data = data, let image = UIImage(data: data) else { return }
  //      DispatchQueue.main.async {
  //        self.titleLabel.text = photoInfo.title
  //        self.imageView.image = image
  //        if let copyright = photoInfo.copyright {
  //          self.copyrightLabel.text = "Copyright ©\(copyright)"
  //        } else {
  //          self.copyrightLabel.isHidden = true
  //        }
  //        self.indicator.stopAnimating()
  //      }
  //    }
  //    task.resume()
  //  }
  
}

