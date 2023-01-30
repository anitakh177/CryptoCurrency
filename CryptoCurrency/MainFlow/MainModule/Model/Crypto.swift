//
//  Crypto.swift
//  CryptoCurrency
//
//  Created by anita on 1/30/23.
//

import Foundation

// MARK: - Crypto
struct Crypto: Codable {
    let status: Status
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let id: String
    let serialID: Int
    let symbol, name, slug: String
    let internalTempAgoraID: String
    let marketData: MarketData
    let marketcap: Marketcap
    let supply: Supply
    let allTimeHigh: AllTimeHigh
    let cycleLow: CycleLow
    let roiData, roiByYear: [String: Double?]
    
    enum CodingKeys: String, CodingKey {
        case id
        case serialID = "serial_id"
        case symbol, name, slug
        case internalTempAgoraID = "_internal_temp_agora_id"
        case marketData = "market_data"
        case marketcap, supply
        case allTimeHigh = "all_time_high"
        case cycleLow = "cycle_low"
        case roiData = "roi_data"
        case roiByYear = "roi_by_year"
       
    }
}

// MARK: - AllTimeHigh
struct AllTimeHigh: Codable {
    let price: Double?
    let at: String?
    let daysSince: Int?
    let percentDown, breakevenMultiple: Double?

    enum CodingKeys: String, CodingKey {
        case price, at
        case daysSince = "days_since"
        case percentDown = "percent_down"
        case breakevenMultiple = "breakeven_multiple"
    }
}

// MARK: - CycleLow
struct CycleLow: Codable {
    let price: Double?
    let at: String?
    let percentUp: Double?
    let daysSince: Int?

    enum CodingKeys: String, CodingKey {
        case price, at
        case percentUp = "percent_up"
        case daysSince = "days_since"
    }
}

// MARK: - MarketData
struct MarketData: Codable {
    let priceUsd: Double?
    let priceBtc: Double?
    let priceEth, volumeLast24_Hours, realVolumeLast24_Hours, volumeLast24_HoursOverstatementMultiple: Double?
    let percentChangeUsdLast1_Hour, percentChangeBtcLast1_Hour, percentChangeEthLast1_Hour: Double?
    let percentChangeUsdLast24_Hours, percentChangeBtcLast24_Hours, percentChangeEthLast24_Hours: Double?
    let ohlcvLast1_Hour, ohlcvLast24_Hour: OhlcvLastHour?
    let lastTradeAt: String?

    enum CodingKeys: String, CodingKey {
        case priceUsd = "price_usd"
        case priceBtc = "price_btc"
        case priceEth = "price_eth"
        case volumeLast24_Hours = "volume_last_24_hours"
        case realVolumeLast24_Hours = "real_volume_last_24_hours"
        case volumeLast24_HoursOverstatementMultiple = "volume_last_24_hours_overstatement_multiple"
        case percentChangeUsdLast1_Hour = "percent_change_usd_last_1_hour"
        case percentChangeBtcLast1_Hour = "percent_change_btc_last_1_hour"
        case percentChangeEthLast1_Hour = "percent_change_eth_last_1_hour"
        case percentChangeUsdLast24_Hours = "percent_change_usd_last_24_hours"
        case percentChangeBtcLast24_Hours = "percent_change_btc_last_24_hours"
        case percentChangeEthLast24_Hours = "percent_change_eth_last_24_hours"
        case ohlcvLast1_Hour = "ohlcv_last_1_hour"
        case ohlcvLast24_Hour = "ohlcv_last_24_hour"
        case lastTradeAt = "last_trade_at"
    }
}

// MARK: - OhlcvLastHour
struct OhlcvLastHour: Codable {
    let ohlcvLastHourOpen, high, low, close: Double
    let volume: Double

    enum CodingKeys: String, CodingKey {
        case ohlcvLastHourOpen = "open"
        case high, low, close, volume
    }
}

// MARK: - Marketcap
struct Marketcap: Codable {
    let rank: Int?
    let marketcapDominancePercent, currentMarketcapUsd, y2050_MarketcapUsd, yPlus10MarketcapUsd: Double?
    let liquidMarketcapUsd, volumeTurnoverLast24_HoursPercent, realizedMarketcapUsd, outstandingMarketcapUsd: Double?

    enum CodingKeys: String, CodingKey {
        case rank
        case marketcapDominancePercent = "marketcap_dominance_percent"
        case currentMarketcapUsd = "current_marketcap_usd"
        case y2050_MarketcapUsd = "y_2050_marketcap_usd"
        case yPlus10MarketcapUsd = "y_plus10_marketcap_usd"
        case liquidMarketcapUsd = "liquid_marketcap_usd"
        case volumeTurnoverLast24_HoursPercent = "volume_turnover_last_24_hours_percent"
        case realizedMarketcapUsd = "realized_marketcap_usd"
        case outstandingMarketcapUsd = "outstanding_marketcap_usd"
    }
}




// MARK: - Supply
struct Supply: Codable {
    let y2050, yPlus10, liquid: Double?
    let circulating: Double?
    let y2050_IssuedPercent, annualInflationPercent, stockToFlow, yPlus10IssuedPercent: Double?
    let supplyRevived90D: Double?

    enum CodingKeys: String, CodingKey {
        case y2050 = "y_2050"
        case yPlus10 = "y_plus10"
        case liquid, circulating
        case y2050_IssuedPercent = "y_2050_issued_percent"
        case annualInflationPercent = "annual_inflation_percent"
        case stockToFlow = "stock_to_flow"
        case yPlus10IssuedPercent = "y_plus10_issued_percent"
        case supplyRevived90D = "supply_revived_90d"
    }
}

// MARK: - Status
struct Status: Codable {
    let elapsed: Int
    let timestamp: String
}
