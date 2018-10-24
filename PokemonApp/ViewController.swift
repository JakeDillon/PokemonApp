//
//  ViewController.swift
//  PokemonApp
//
//  Created by Jake Dillon on 10/24/18.
//  Copyright © 2018 Jake Dillon. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    let baseURL = "https://pokeapi.co/api/v2/"

    @IBOutlet weak var pokemonTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    
    @IBAction func submitButton(_ sender: Any) {
        guard let pokemonNameOrID = pokemonTextField.text, pokemonNameOrID != "" else {
            return
        }
    // URL that we will use for our request
        let requestURL = baseURL + pokemonNameOrID.lowercased().replacingOccurrences(of: " ", with: "+")
    // making our request
        let request = Alamofire.request(requestURL)
    // carry out the request
        request.responseJSON { response in
            switch response.result {
            case.success(let value):
                let json = JSON(value)
                if let speciesName = json["species"]["name"].string {
                    print(speciesName)
                }
                
                if let firstStatName = json["stats"][0]["stat"]["name"].string {
                print(firstStatName)
                }
                if let abilitiesJSON = json["abilities"].array {
                    for ability in abilitiesJSON {
                        if let abilityName = ability["ability"]["name"].string {
                            print(abilityName)
                        }
                    }
                }
                
                
                
                
                
            case.failure(let error):
                print(error)
            }
        }
    }
    
    
    

}

