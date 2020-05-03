//
//  DetailsViewController.swift
//  Assignment4
//
//  Created by Martin Kuchar on 2020-05-03.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    var countryLabel: UILabel! = {
        let country = UILabel()
        country.attributedText = boldText(text: "Country")
        return country
    }()
    
    var cityLabel: UILabel! = {
       let city = UILabel()
        city.attributedText = boldText(text: "City")
        return city
    }()
    
    var temperatureLabel: UILabel! = {
        let temperature = UILabel()
        temperature.attributedText = boldText(text: "Temperature")
        return temperature
    }()
    var summaryLabel: UILabel! = {
        let summary = UILabel()
        summary.attributedText = boldText(text: "SUMMARY")
        return summary
    }()
    
    var vStackView: UIStackView!
    
    var particularCountryImage: UIImageView! = {
        let country = UIImageView()
        NSLayoutConstraint.activate([country.heightAnchor.constraint(equalToConstant: 50),
         country.widthAnchor.constraint(equalToConstant: 50)])
        return country
    }()
    
    var particularCityLabel: UILabel! = {
       let city = UILabel()
        return city
    }()
    
    var particularTemperatureLabel: UILabel! = {
       let temperature = UILabel()
        return temperature
    }()
    
    var particularSummaryLabel: UILabel! = {
       let summary = UILabel()
        return summary
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vStackView = UIStackView(arrangedSubviews: [countryLabel, particularCountryImage, cityLabel, particularCityLabel, temperatureLabel,particularTemperatureLabel, summaryLabel, particularSummaryLabel])
        view.addSubview(vStackView!)
        setVStack()
        view.backgroundColor = .white
    }
    
    func setVStack() {
        vStackView.translatesAutoresizingMaskIntoConstraints = false
        vStackView.axis = .vertical
        vStackView.alignment = .center
        vStackView.distribution = .equalSpacing
        vStackView.spacing = 50
        NSLayoutConstraint.activate([vStackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
                                    vStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                                    vStackView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)])
    }
    
     static func boldText(text: String) -> NSMutableAttributedString {
        let attrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15)]
        let attributedString = NSMutableAttributedString(string: text, attributes:attrs)
        return attributedString
    }
}
