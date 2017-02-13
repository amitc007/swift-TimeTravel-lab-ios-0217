//
//  SpaceShip.swift
//  TimeTravel
//
//  Created by ac on 2/11/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import Foundation

class SpaceShip {
    var name:String
    var speed:ViewController.Speed = .none
    var currentPlanet:ViewController.Planet
    
    var description:String {
        return ("\(name) is on \(currentPlanet) travelling at \(speed) speed")
    }

    init(name:String, planet:ViewController.Planet) {
        self.name = name
        self.currentPlanet = planet
    }
    
    func timeTravel()->Bool {
        return speed.topSpeed
    }
    
    func isFaster(than spaceship:SpaceShip)->Bool {
        return self.speed.rawValue > spaceship.speed.rawValue
    }
    
    func travel(to planet:ViewController.Planet)->Bool {
        print("In travel to:\(planet) ")
        if self.currentPlanet == .mercury { return false }
        
        switch planet {
        case .mercury : return false
        case .venus, .earth, .neptune : if self.speed == .fast
            {  self.currentPlanet = planet; return true } else {
            return false }
        case .jupiter, .uranus : if self.speed == .slow
            {  self.currentPlanet = planet; return true } else {
             return false }
        case .mars : if self.speed == .lightSpeed
            { self.currentPlanet = planet; return true } else {
             return false }
        case .saturn : if self.speed == .medium
            {  self.currentPlanet = planet; return true } else {
              return false }
          
        default: self.currentPlanet = .galaxy ; return false
        }
        
        
    }
}
