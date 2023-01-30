//
//  CoinIcons.swift
//  CryptoCurrency
//
//  Created by anita on 1/30/23.
//

import Foundation

struct CoinIcons {
    
    func getIconWithID(with id: String) -> String {
        switch id {
        case "1e31218a-e44e-4285-820c-8282ee222035":
            return "btc"
        case "21c795f5-1bfd-40c3-858e-e9d7e820c6d0":
            return "eth"
        case "1c077d6e-99c7-491c-b24d-1d359011cd81":
            return "tron"
        case "6beb71d4-1476-4a52-afc4-7a921de087f6":
            return "luna"
        case "da6a0575-ec95-4c47-855d-5fc6a3e22ada":
            return "polkadot"
        case "51f8ea5e-f426-4f40-939a-db7e05495374":
            return "tether"
        case "7c435a77-5be9-4424-b5d1-1c02b968c56f":
            return "stellar"
        case "362f0140-ecdd-4205-b8a0-36f0fd5d8167":
            return "cardano"
        case "97775be0-2608-4720-b7af-f85b24c7eb2d":
            return "xrp"
        case "7d793fa7-5fc6-432a-b26b-d1b10769d42e":
            return "dogecoin"
        default:
            return ""
        }
    }
}
