import Foundation 
import SwiftUI
import TicketSdk 

@MainActor
final class TicketRequest: ObservableObject {

    let ticketApi = TicketApi.shared 
}