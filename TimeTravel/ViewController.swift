//
//  ViewController.swift
//  TimeTravel
//
//  Created by James Campagno on 10/4/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var screenImage: UIImageView!
    
    @IBOutlet weak var currentPlanet: UILabel!
    @IBOutlet weak var speedButtons: UISegmentedControl!
    
    //segmentedControl planetButtons don't work in this case
    @IBOutlet weak var planetButtons: UISegmentedControl!
    
    var lastPlanet:Int = 0
    
    @IBAction func chooseSpeed(_ sender: UISegmentedControl) {
        //set speed for spaceship
        switch sender.selectedSegmentIndex {
            //none
        case 0 :
            spaceship.speed = .none
            //slow
        case 1: spaceship.speed = .slow
            //Med
        case 2: spaceship.speed = .medium
            //Fast
        case 3: spaceship.speed = .fast
            //lightspeed
        case 4: spaceship.speed = .lightSpeed
            
        default:
            spaceship.speed = .none
            
        }
        //??
        //set planet button to galaxy if speed is changed
        planetButtons.setEnabled(true, forSegmentAt: 0 )
        
        setSpaceShipLabel()
    }
    
    
    @IBAction func choosePlanet(_ sender: UISegmentedControl) {
        //clear last button
        planetButtons.subviews[lastPlanet].backgroundColor = UIColor.white
        
        switch sender.selectedSegmentIndex {
            //galaxy
        case 0:
            if !spaceship.travel(to: Planet.galaxy) {
                //clear button pressed
                planetButtons.subviews[planetButtons.selectedSegmentIndex].backgroundColor = UIColor.white
                //find & set spaceship planet
                self.findPlanet(speed: spaceship.speed)
                //set planet button
                //planetButtons.setEnabled(true, forSegmentAt: spaceship.currentPlanet.rawValue )
                //set highlighted button
                planetButtons.selectedSegmentIndex = spaceship.currentPlanet.rawValue
                //planetButtons.subviews[spaceship.currentPlanet.rawValue].backgroundColor = UIColor.cyan
            }
            
        case 1:   //mercury
            if !spaceship.travel(to: Planet.mercury) {
                //clear button pressed
                planetButtons.subviews[planetButtons.selectedSegmentIndex].backgroundColor = UIColor.white
                //find & set spaceship planet
                self.findPlanet(speed: spaceship.speed)
                //set planet button
                //planetButtons.setEnabled(true, forSegmentAt: spaceship.currentPlanet.rawValue )
                //set highlighted button
                planetButtons.selectedSegmentIndex = spaceship.currentPlanet.rawValue
                //planetButtons.subviews[spaceship.currentPlanet.rawValue].backgroundColor = UIColor.cyan
            }

        case 2:  //venus
            if !spaceship.travel(to: .venus ) {
                //find & set spaceship planet
                //clear button pressed
                planetButtons.subviews[planetButtons.selectedSegmentIndex].backgroundColor = UIColor.white
                self.findPlanet(speed: spaceship.speed)
                //set planet button
                //planetButtons.setEnabled(true, forSegmentAt: spaceship.currentPlanet.rawValue )
                planetButtons.selectedSegmentIndex = spaceship.currentPlanet.rawValue
                //planetButtons.subviews[spaceship.currentPlanet.rawValue].backgroundColor = UIColor.cyan
            }

        case 3:  //earth
            if !spaceship.travel(to: Planet.earth) {
                print("choosePlanet:traveltoEarth:selectedSegmentIndex:\(planetButtons.selectedSegmentIndex)")
                //clear button pressed
                (planetButtons.subviews[planetButtons.selectedSegmentIndex] as UIView).backgroundColor = UIColor.white
                //find & set spaceship planet
                self.findPlanet(speed: spaceship.speed)
                //set planet button
                //planetButtons.setEnabled(true, forSegmentAt: spaceship.currentPlanet.rawValue )
                planetButtons.selectedSegmentIndex = spaceship.currentPlanet.rawValue
        //planetButtons.subviews[spaceship.currentPlanet.rawValue].backgroundColor = UIColor.cyan
            }

        case 4:  //mars
            if !spaceship.travel(to: .mars) {
                //clear button pressed
                planetButtons.subviews[planetButtons.selectedSegmentIndex].backgroundColor = UIColor.white
                //find & set spaceship planet
                self.findPlanet(speed: spaceship.speed)
                //set planet button
                //planetButtons.setEnabled(true, forSegmentAt: spaceship.currentPlanet.rawValue )
                //set highlighted button
                planetButtons.selectedSegmentIndex = spaceship.currentPlanet.rawValue
                //planetButtons.subviews[spaceship.currentPlanet.rawValue].backgroundColor = UIColor.cyan
            }
            
        case 5:   //jupiter
            if !spaceship.travel(to: .jupiter) {
                //clear button pressed
                planetButtons.subviews[planetButtons.selectedSegmentIndex].backgroundColor = UIColor.white
               //find & set spaceship planet
                self.findPlanet(speed: spaceship.speed)
                //set planet button
                //planetButtons.setEnabled(true, forSegmentAt: spaceship.currentPlanet.rawValue )
                //set highlighted button
                planetButtons.selectedSegmentIndex = spaceship.currentPlanet.rawValue
                //planetButtons.subviews[spaceship.currentPlanet.rawValue].backgroundColor = UIColor.cyan
            }
            
        case 6:    //saturn
            if !spaceship.travel(to: .saturn) {
                //clear button pressed
                planetButtons.subviews[planetButtons.selectedSegmentIndex].backgroundColor = UIColor.white
                //find & set spaceship planet
                self.findPlanet(speed: spaceship.speed)
                //set planet button
                //planetButtons.setEnabled(true, forSegmentAt: spaceship.currentPlanet.rawValue )
                //set highlighted button
                planetButtons.selectedSegmentIndex = spaceship.currentPlanet.rawValue
                //planetButtons.subviews[spaceship.currentPlanet.rawValue].backgroundColor = UIColor.cyan
            }
            
        case 7:  //uranus
            if !spaceship.travel(to: Planet.uranus) {
                //clear button pressed
                planetButtons.subviews[planetButtons.selectedSegmentIndex].backgroundColor = UIColor.white
                //find & set spaceship planet
                self.findPlanet(speed: spaceship.speed)
                //set planet button
                //planetButtons.setEnabled(true, forSegmentAt: spaceship.currentPlanet.rawValue )
                //set highlighted button
                planetButtons.selectedSegmentIndex = spaceship.currentPlanet.rawValue
                //planetButtons.subviews[spaceship.currentPlanet.rawValue].backgroundColor = UIColor.cyan
            }

        case 8:   //neptune
            if !spaceship.travel(to: .neptune) {
                //clear button pressed
                planetButtons.subviews[planetButtons.selectedSegmentIndex].backgroundColor = UIColor.white
                //find & set spaceship planet
                self.findPlanet(speed: spaceship.speed)
                //set planet button
                //planetButtons.setEnabled(true, forSegmentAt: spaceship.currentPlanet.rawValue )
                //set highlighted button
                planetButtons.selectedSegmentIndex = spaceship.currentPlanet.rawValue
                //planetButtons.subviews[spaceship.currentPlanet.rawValue].backgroundColor = UIColor.cyan
            }
        default: break
        } //switch
        setSpaceShipLabel()
        //note to change backgrd on next touch
        lastPlanet = spaceship.currentPlanet.rawValue
        print("choosePlanet:currentPlanet.rawValue:\(lastPlanet) planetButtons.selectedSegmentIndex:\(planetButtons.selectedSegmentIndex)")
    } //func
    
    var spaceship = SpaceShip(name: "Voyager X", planet: .galaxy  )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //reduce font size of text in segment
        let font = UIFont.systemFont(ofSize: 9)
        planetButtons.setTitleTextAttributes([NSFontAttributeName: font],
                                                for: .normal)
        /*speedButtons.setTitleTextAttributes([NSFontAttributeName: font],
                                            for: .normal) */
        
        setSpaceShipLabel()
    }

    func setSpaceShipLabel(){
        //loadImage()
        screenImage.image = UIImage(named:"\(spaceship.currentPlanet).jpg")
        currentPlanet.text = "\(spaceship.name) is on planet \(spaceship.currentPlanet)"
    }
    
    enum Speed:Double {
        case none = 0
        case slow = 50
        case medium = 150
        case fast = 1000
        case lightSpeed = 1000000
        
        init(spaceSpeed:Double){
            switch spaceSpeed {
            case 0 : self = .none
            case 1...49 : self = .slow
            case 150...999: self = .medium
            case 1000...999999: self = .fast
            default: self = .lightSpeed
            }
        }
        var topSpeed:Bool {
            return self == Speed.lightSpeed
        }

        func isFaster(than speed:Speed)->Bool {
            return self.rawValue > speed.rawValue
        }
    
        
    }
    
    enum Weather {
        case cold, warm, hot, superDuperHot
    }
    
    enum Planet:Int {
        case galaxy ,mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
        
        var hasLife:Bool {
            return self == .earth || self == .mars
        }
        
        var weather:Weather {
            var _weather:Weather = .warm
            switch self {
                case .earth : _weather = .warm
                case .mercury, .venus : _weather = .superDuperHot
                case .mars, .saturn, .uranus, .neptune : _weather = .cold
                case .jupiter : _weather = .hot
            default: break
            }
            return _weather
        }
    }
    
    func findPlanet(speed:Speed) {
        switch speed {
        case .none: spaceship.currentPlanet = .galaxy
        case .slow: spaceship.currentPlanet = .jupiter
        case .medium: spaceship.currentPlanet = .saturn
        case .fast: spaceship.currentPlanet = .earth
        case .lightSpeed: spaceship.currentPlanet = .mars
        }
        print("findPlanet gives currentPlanet:\(spaceship.currentPlanet) rawValue:\(spaceship.currentPlanet.rawValue)")
    }

    
}

