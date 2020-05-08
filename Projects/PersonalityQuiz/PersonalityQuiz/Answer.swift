//
//  Answer.swift
//  PersonalityQuiz
//
//  Created by Martin Kuchar on 2020-05-07.
//  Copyright © 2020 Martin Kuchar. All rights reserved.
//

import Foundation
import UIKit

struct Answer {
    var text: String
    var type: CountryType
    
    enum CountryType {
        case slovakia, brazil, japan, canada
        var image: UIImage {
           switch self {
               case .slovakia: return UIImage(named: "Slovakia")!
               case .brazil: return UIImage(named: "Brazil")!
               case .japan: return UIImage(named: "Japan")!
               case .canada: return UIImage(named: "Canada")!
            }
        }
        
        var definition: String {
            switch self {
                case .slovakia:
                    return "A landlocked country of central Europe. Slovakia's territory spans about 49,000 square kilometres and is mostly mountainous. Today Slovakia has become increasingly infiltrated by modern industrial infrastructure, but it still offers breathtaking views of wine-growing valleys, picturesque castles, and historical cities."
                case .brazil:
                    return "Brazil, officially the Federative Republic of Brazil, is the largest country in both South America and Latin America. At 8.5 million square kilometers and with over 211 million people, Brazil is the world's fifth-largest country by area and the sixth most populous."
                case .japan:
                    return "It is a group of many islands close to the east coast of Korea, China and Russia. The Pacific Ocean is to the east of Japan and the Sea of Japan is to the west."
                case .canada:
                    return "Canada is a country in the northern part of North America. Its ten provinces and three territories extend from the Atlantic to the Pacific and northward into the Arctic Ocean, covering 9.98 million square kilometres, making it the world's second-largest country by total area."
                    
            }
        }
    }
}
