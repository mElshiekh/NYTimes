//
//  Article.swift
//  NYTimes app
//
//  Created by Mohamed on 02/09/2022.
//

import Foundation

class Article: NSObject, Codable {
    var uri: String?
    var url: String?
    var id, assetID: Int?
    var publishedDate, section, title: String?
    var media: [Media]?
    var abstract: String?

    enum CodingKeys: String, CodingKey {
        case uri, url, id
        case assetID = "asset_id"
        case publishedDate = "published_date"
        case section, title, media
        case abstract
    }

    init(uri: String?, url: String?, id: Int?, assetID: Int?, publishedDate: String?, section: String?, title: String?, media: [Media]?, abstract: String?) {
        self.uri = uri
        self.url = url
        self.id = id
        self.assetID = assetID
        self.publishedDate = publishedDate
        self.section = section
        self.title = title
        self.media = media
        self.abstract = abstract
    }
}

// MARK: - Media

class Media: Codable {
    var type, subtype, caption, copyright: String?
    var approvedForSyndication: Int?
    var mediaMetadata: [MediaMetadatum]?

    enum CodingKeys: String, CodingKey {
        case type, subtype, caption, copyright
        case approvedForSyndication = "approved_for_syndication"
        case mediaMetadata = "media-metadata"
    }

    init(type: String?, subtype: String?, caption: String?, copyright: String?, approvedForSyndication: Int?, mediaMetadata: [MediaMetadatum]?) {
        self.type = type
        self.subtype = subtype
        self.caption = caption
        self.copyright = copyright
        self.approvedForSyndication = approvedForSyndication
        self.mediaMetadata = mediaMetadata
    }
}

// MARK: - MediaMetadatum

class MediaMetadatum: Codable {
    var url: String?
    var format: String?
    var height, width: Int?

    init(url: String?, format: String?, height: Int?, width: Int?) {
        self.url = url
        self.format = format
        self.height = height
        self.width = width
    }
}
