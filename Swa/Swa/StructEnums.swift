//
//  StructEnums.swift
//  Swa
//
//  Created by Kuldeep Swapnil on 28/04/20.
//  Copyright © 2020 Kuldeep Swapnil. All rights reserved.
//


import Foundation

enum Operator: String {
    case add = "+"
    case subtract = "-"
    case times = "*"
    case divide = "/"
    case nothing = ""
}

enum CalculationState: String {
    case enteringNum = "enteringNum"
    case newNumStarted = "newNumStarted"
}
