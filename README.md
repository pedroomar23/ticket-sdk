<p align="center"> 
    <img src="https://github.com/pedroomar23/ticket-sdk/blob/main/Resources/tickets-light.jpg" alt="https://qvapay.com" width="250">
</p>
<p align="center">
     <img src="https://img.shields.io/badge/release 1.0.0-blue.svg" alt="release 1.0.0" />
    <img src="https://img.shields.io/badge/Swift-6.2-orange.svg" alt="Swift 6.2" />
    <a href="https://qvapay.com"><img src="https://img.shields.io/badge/documentation-web-blue.svg" alt="Documentation" /></a>
    <a href="[https://github.com/pedroomar23/qvapaysdk-swift/blob/main/LICENSE](https://github.com/pedroomar23/qvapaysdk-swift/blob/main/LICENSE.md)"><img src="https://img.shields.io/github/license/danielsaidi/SwiftUIKit" alt="MIT License" /></a>
</p>

# ⚡️ TicketSdk 
`TicketSdk` es una librería escrita en Swift que trabaja con el portal [Ticket](https://ticket.xutil.net)
## Instalación
```swift
dependencies: [
    .package(url: "https://github.com/pocl1998/ticket-sdk", from: "1.0.0")
]
```
## Uso
```swift
import TicketSdk

let ticket = TicketSdk.shared 

// Logins
func login() async {
    await ticket.login(username: "username", password: "password", pass: "pass", scope: "scope", grand_type: "grand_type") { result in
        switch result {
            case let .success(model):
                print("✅ DEBUG: JSON RESPONSE \(model)")
            case .failure(let error):
                print("❌ DEBUG: JSON FAILURE RESPONSE \(error)")
        }
    }
}

// Registro 
func register() async {
    await ticket.register(mail: "mail", dni: "dni", name: "name", lastname: "lastname", password: "password", username: "username", uid: "uid", aplication: "aplication") { result in
        switch result {
            case let .success(model):
                print("✅ DEBUG: JSON RESPONSE \(model)")
            case .failure(let error):
                print("❌ DEBUG: JSON FAILURE RESPONSE \(error)")
        }
    }
}

// Cambiar Contraseña 
func changePass() async {
    await ticket.changePass(email: "email") { result in
        switch result {
            case let .success(model):
                print("✅ DEBUG: JSON RESPONSE \(model)")
            case .failure(let error):
                print("❌ DEBUG: JSON FAILURE RESPONSE \(error)")
        }
    }
}

// Servicios 
func services() async {
    await ticket.services { result in
        switch result {
            case let .success(model):
                print("✅ DEBUG: JSON RESPONSE \(model)")
            case .failure(let error):
                print("❌ DEBUG: JSON FAILURE RESPONSE \(error)")
        }
    }
}
```
## Funcionalidades
- Login
- Registro
- Cambiar Contraseña
- Servicios 
## Contribuciones
- Si encuentras algún error, por favor abre un issue.
- Si quieres contribuir, por favor abre un pull request.
## Licencia
`TicketSdk` es una librería de código abierto bajo la licencia MIT.
