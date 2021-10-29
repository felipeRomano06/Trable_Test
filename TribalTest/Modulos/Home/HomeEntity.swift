//
//  HomeEntity.swift
//  TribalTest
//
//  Created by Azteca on 28/10/21.
//


import Foundation

// MARK: - UnSplashEntity
struct UnSplashEntity: Codable {
    var photos: Photos?
}

// MARK: - Photos
struct Photos: Codable {
    
    var results: [Result]?

    
}

// MARK: - Result
struct Result: Codable {
    
    var width, height: Int?
    var color, blurHash: String?
    var alt_description: String?
    var urls: Urls?
    var links: ResultLinks?
    var likedByUser: Bool?
    var sponsorship: Sponsorship?
    var user: User?
    var tags: [Tag]?
    var likes: Int?

    
}

// MARK: - ResultLinks
struct ResultLinks: Codable {
    var linksSelf, html, download, downloadLocation: String?

}

// MARK: - Sponsorship
struct Sponsorship: Codable {
    var impressionUrls: [String]?
    var tagline: String?
    var taglineURL: String?
    var sponsor: User?

}

// MARK: - User
struct User: Codable {
    var id: String?
    var updatedAt: Date?
    var username, name, firstName: String?
    var lastName: String?
    var twitterUsername: String?
    var portfolioURL: String?
    var bio: String?
    var location: String?
    var links: UserLinks?
    var profileImage: ProfileImage?
    var instagramUsername: String?
    var totalCollections, totalLikes, totalPhotos: Int?
    var acceptedTos, forHire: Bool?

}

// MARK: - UserLinks
struct UserLinks: Codable {
    var linksSelf, html, photos, likes: String?
    var portfolio, following, followers: String?

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case html, photos, likes, portfolio, following, followers
    }
}

// MARK: - ProfileImage
struct ProfileImage: Codable {
    var small, medium, large: String?
}


// MARK: - Tag
struct Tag: Codable {
    var type, title: String?
    var source: Source?
}

// MARK: - Source
struct Source: Codable {
    var ancestry: Ancestry?
    var title, subtitle, sourceDescription, metaTitle: String?
    var metaDescription: String?

}

// MARK: - Ancestry
struct Ancestry: Codable {
    var type, category, subcategory: Category?
}

// MARK: - Category
struct Category: Codable {
    var slug, prettySlug: String?

    enum CodingKeys: String, CodingKey {
        case slug
        case prettySlug = "pretty_slug"
    }
}


// MARK: - CoverPhotoTopicSubmissions
struct CoverPhotoTopicSubmissions: Codable {
    var nature, wallpapers: Nature?
}

// MARK: - Nature
struct Nature: Codable {
    var status: String?
    var approvedOn: Date?

}

// MARK: - Urls
struct Urls: Codable {
    var raw, full, regular, small: String?
    var thumb: String?
}
