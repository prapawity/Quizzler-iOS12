//
//  listQuestion.swift
//  Quizzler
//
//  Created by Prapawit Patthasirivichot on 6/6/2562 BE.
//  Copyright © 2562 London App Brewery. All rights reserved.
//

import Foundation
class AllQuestion{
    var listQuestion:[Question] = []
    init() {
        let question_all = [["name":"Question 1",
                              "ans":false],["name":"Question 2",
                                            "ans":true],["name":"Question 3",
                                                          "ans":false]]
        for i in question_all{
            var simple = Question(question: i["name"] as! String, ans: i["ans"]! as! Bool)
            listQuestion.append(simple)
        }
        
        
        
        
    }
}
