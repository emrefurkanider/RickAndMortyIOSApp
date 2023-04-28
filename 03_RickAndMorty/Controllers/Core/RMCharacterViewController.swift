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
        
        RMService.shared.execute(.listCharacterRequests, expecting: RMGetAllCharactersResponse.self) { result in
            switch result {
            case .success(let model):
                print("Total: " + String(model.info.pages))
                print("Page result count: " + String(model.results.count))
            case .failure(let error):
                print(String(describing: error))
            }
        } 
    }
}
