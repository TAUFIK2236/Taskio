import Foundation

struct UserData: Codable {
    let _id: String
    let username: String
    let email: String
}

struct LoginResponse: Codable {
    let message: String
    let user: UserData
}

struct RegisterResponse: Codable {
    let message: String
    let user: UserData
}

struct ResetPasswordResponse: Codable {
    let message: String
    let user: UserData
}

struct UpdateUsernameResponse: Codable {
    let message: String
    let user: UserData
}

