//
//  QuestionData.swift
//  PersonalityQuiz
//
//  Created by Martin Kuchar on 2020-05-07.
//  Copyright © 2020 Martin Kuchar. All rights reserved.
//

import Foundation

struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
    
    enum ResponseType {
        case single, multiple, ranged
    }
}
