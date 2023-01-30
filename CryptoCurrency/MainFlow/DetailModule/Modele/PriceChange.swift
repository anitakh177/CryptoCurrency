//
//  PriceChange.swift
//  CryptoCurrency
//
//  Created by anita on 1/30/23.
//

import Foundation

// MARK: - PriceChange
struct PriceChange: Codable {
    let status: Status
    let data: DataStruct
}

// MARK: - DataClass
struct DataStruct: Codable, Identifiable {
    let id: String
    let serialID: Int
    let symbol, name, slug: String
    let internalTempAgoraID: String
    let parameters: Parameters
    let schema: Schema
    let values: [[Double]]

    enum CodingKeys: String, CodingKey {
        case id
        case serialID = "serial_id"
        case symbol, name, slug
        case internalTempAgoraID = "_internal_temp_agora_id"
        case parameters, schema, values
    }
}

// MARK: - Parameters
struct Parameters: Codable {
    let assetKey, assetID, start, end: String
    let interval, order, format, timestampFormat: String
    let columns: [String]

    enum CodingKeys: String, CodingKey {
        case assetKey = "asset_key"
        case assetID = "asset_id"
        case start, end, interval, order, format
        case timestampFormat = "timestamp_format"
        case columns
    }
}

// MARK: - Schema
struct Schema: Codable {
    let metricID, name, schemaDescription: String
    let valuesSchema: ValuesSchema
    let minimumInterval: String
    let sourceAttribution: [SourceAttribution]

    enum CodingKeys: String, CodingKey {
        case metricID = "metric_id"
        case name
        case schemaDescription = "description"
        case valuesSchema = "values_schema"
        case minimumInterval = "minimum_interval"
        case sourceAttribution = "source_attribution"
    }
}

// MARK: - SourceAttribution
struct SourceAttribution: Codable {
    let name: String
    let url: String
}

// MARK: - ValuesSchema
struct ValuesSchema: Codable {
    let timestamp, valuesSchemaOpen, high, low: String
    let close, volume: String

    enum CodingKeys: String, CodingKey {
        case timestamp
        case valuesSchemaOpen = "open"
        case high, low, close, volume
    }
}

