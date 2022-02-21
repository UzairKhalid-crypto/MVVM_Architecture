//
//  AppDataService.swift
//  MVVM_Architecture
//
//  Created by Devolper.Scorpio on 21/02/2022.
//

import Foundation
//protocol
protocol DataService {
    func getUsers(completion: @escaping ([User]) -> Void)
}

//Services Class
class AppDataService: DataService {
    func getUsers(completion: @escaping ([User]) -> Void) {
        DispatchQueue.main.async {
            completion([
                User(id: 1, name: "Uzair"),
                User(id: 2, name: "Ahmed"),
                User(id: 3, name: "Ali")
            ])
        }
    }
}
