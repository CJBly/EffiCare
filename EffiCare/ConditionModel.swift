//
//  ConditionModel.swift
//  FinalProject
//
//  Created by Connor Bly on 11/22/25.
//
import SwiftData

@Model
final class Condition{
    var name: String
    //Stored variable can't be name description
    var descriptionText: String
    var severity: Double
    @Relationship(deleteRule: .cascade) var conditionMessages: [Message] = []
    
    init(name: String, descriptionText: String, severity: Double){
        self.name = name
        self.descriptionText = descriptionText
        self.severity = severity
    }
}
