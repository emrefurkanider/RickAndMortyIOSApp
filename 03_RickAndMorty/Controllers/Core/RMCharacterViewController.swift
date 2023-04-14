//
//  RMCharacterViewController.swift
//  03_RickAndMorty
//
//  Created by Emre Furkan İDER on 10.04.2023.
//

import UIKit

///Controller to show and search for Characters ///Characters göstermek ve aramak için denetleyici
final class RMCharacterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
 
        view.backgroundColor = .systemBackground
        title = "Characters"
        
        let request = RMRequest(
            endpoint: .character,
            queryParameters: [
                URLQueryItem (name: "name", value: "rick"),
                URLQueryItem (name: "status", value: "alive")
            ]
        )
        print(request.url)
        RMService.shared.execute(request, expecting: RMCharacter.self) {result in
            }
        }
    }
