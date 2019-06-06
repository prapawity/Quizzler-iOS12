//
//  Question.swift
//  Quizzler
//
//  Created by Prapawit Patthasirivichot on 6/6/2562 BE.
//  Copyright © 2562 London App Brewery. All rights reserved.
//

import Foundation
class Question{
    let question_name: String?
    let ans: Bool?
    init(question: String,ans: Bool) {
        self.question_name = question
        self.ans = ans
    }
}
