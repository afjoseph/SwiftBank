//
//  main.swift
//  SwiftBank
//
//  Created by Abdullah Joseph on 3/29/16.
//

import Foundation

var users: [User] = [
    User(username: "one", password: "123", name: "Gordon")!,
    User(username: "two", password: "123", name: "Jim")!,
    User(username: "three", password: "123", name: "Phil")!
]

var currentUser: User?

func enterUserMenu() {
    while true {
        Utils.clearScreen()
        print(">>>>>>> USER MENU")
        print("1. View Account")
        print("2. Deposit Amount")
        print("3. Withdraw amount")
        print("0. Sign out")
    
        let response_str = Utils.readInput()
        let response = Int(response_str) ?? -1
        
        switch response {
        case 1:
            viewAccount()
        case 2:
            depositMoney()
        case 3:
            withdrawMoney()
        case 0:
            currentUser = nil
            return
        default:
            continue
        }
    }
}

func viewAccount() {
    guard
        let currentUser = currentUser
        else {
            fatalError("currentUser is nil")
    }
    
    currentUser.outputDetails()
    Utils.pause()
}

func depositMoney() {
    guard
        let currentUser = currentUser
        else {
            fatalError("currentUser is nil")
    }
    
    let amount_str = Utils.readInput("Amount to deposit: ")
    guard let amount = Double(amount_str)
        where amount > 0
        else {
            print("number is not valid")
            return
    }
    
    currentUser.deposit(amount)
    print("\(amount) depositied successfully")
    Utils.pause()
}

func withdrawMoney() {
    guard
        let currentUser = currentUser
        else {
            fatalError("currentUser is nil")
    }
    
    let amount_str = Utils.readInput("Amount to withdraw: ")
    guard let amount = Double(amount_str)
        where amount > 0
        else {
            print("number is not valid")
            return
    }
    
    if currentUser.withdraw(amount) {
        print("\(amount) withdrew successfully")
    } else {
        print("Not enough balance")
    }
    
    Utils.pause()
}

func login() {
    Utils.clearScreen()
    
    print(">>>>>>> LOGIN")
    let username = Utils.readInput("Username: ")
    let password = Utils.readInput("Password: ")
    
    var foundUser = false
    
    for user in users {
        if username == user.username
            && password == user.password {
                foundUser = true
                currentUser = user
        }
    }
    
    if !foundUser {
        print("Invalid credentials")
        return
    }
    
    print("Access Granted!")
    Utils.pause()
    
    enterUserMenu()
}

func signup() {
    Utils.clearScreen()
    
    print(">>>>>>> SIGNUP")
    let username = Utils.readInput("Username: ")
    let password = Utils.readInput("Password: ")
    let name = Utils.readInput("Name: ")
    
    users.append(User(username: username, password: password, name: name)! )
    
    print("Signup successful")
    Utils.pause()
}

func main() {
    repeat {
        Utils.clearScreen()
        print("Welcome to Swift Bank")
        print("1. Login")
        print("2. Signup")
        print("0. Exit")
    
        let response_str = Utils.readInput()
        let response = Int(response_str) ?? -1
        
        switch response {
        case 1:
            login()
        case 2:
            signup()
        case 0:
            return
        default:
            continue
        }
    } while true
}

//____ENTRY_POINT_____
main()
