//
//  Alarm-ios-swift
//
//  Created by Mohammad Saifan on 05/02/21
//
import Foundation

protocol Persistable{
    var ud: UserDefaults {get}
    var persistKey : String {get}
    func persist()
    func unpersist()
}
