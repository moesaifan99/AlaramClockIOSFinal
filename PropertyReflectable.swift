//
//  Alarm-ios-swift
//
//  Created by Mohammad Saifan on 05/02/21
//
import Foundation

protocol PropertyReflectable{
    typealias RepresentationType = [String:Any]
    typealias ValuesType = [Any]
    typealias NamesType = [String]
    var propertyDictRepresentation: RepresentationType {get}
    var propertyValues: ValuesType {get}
    var propertyNames: NamesType {get}
    static var propertyCount: Int {get}
    init(_ r:RepresentationType)
}


extension PropertyReflectable{
    
    var propertyDictRepresentation: RepresentationType {
        var ret: [String:Any] = [:]
        for case let (label, value) in Mirror(reflecting: self).children {
            guard let l = label else{
                continue
            }
            ret.updateValue(value, forKey: l)
        }
        return ret
    }
    
    var propertyValues: ValuesType {
        return Array(propertyDictRepresentation.values)
    }
    
    var propertyNames: NamesType {
        return Array(propertyDictRepresentation.keys)
    }
}
