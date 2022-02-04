
import Foundation

struct MovieResult: Decodable {
    let results: [Movie]
}

struct Movie: Identifiable, Codable {
    let id: Int
    let imdb_id: String?
    let title: String
    let overview: String?
    let poster_path: String
    let release_date: String
    let popularity: Double
    let vote_count: Int
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case imdb_id
        case title
        case overview
        case poster_path
        case release_date
        case popularity
        case vote_count
    }
}






