//
//  ContentView.swift
//  MVVM_Architecture
//
//  Created by Devolper.Scorpio on 21/02/2022.
//

import SwiftUI

//Model
struct User: Identifiable {
    let id: Int
    let name: String
}

//View
struct UsersView: View {
    
    @StateObject var viewModel: ViewModel
    
    init(viewModel: ViewModel = .init()) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        List(viewModel.users) { user in
            Text(user.name)
        }
        .onAppear(perform: viewModel.getUsers)
    }
}

//View Controller
extension UsersView {
    class ViewModel: ObservableObject {
        @Published var users = [User]()
        
        let dataService: DataService
        
        init(dataService: DataService = AppDataService()) {
            self.dataService = dataService
        }
        
        func configure(with something: Any) {
            
        }
        
        func getUsers() {
            dataService.getUsers { [weak self] users in
                self?.users = users
            }
        }
    }
}

//Preview
struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        let user = User(id: 0, name: "Dummy")
        let viewModel = UsersView.ViewModel()
        viewModel.users = [user]
        
        return UsersView(viewModel: viewModel)
    }
}

