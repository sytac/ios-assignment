struct MovieList: Codable {
  let page: Int
  let results: [Result]
  let totalPages: Int
  let totalResults: Int

  enum CodingKeys: String, CodingKey {
    case page
    case results
    case totalPages = "total_pages"
    case totalResults = "total_results"
  }

  init(page: Int = 1, results: [Result] = [], totalPages: Int = 1, totalResults: Int = 0) {
    self.page = page
    self.results = results
    self.totalPages = totalPages
    self.totalResults = totalResults
  }
}

// MARK: - Result

struct Result: Codable, Identifiable {
  let adult: Bool
  let backdropPath: String
  let genreIDS: [Int]
  let id: Int
  let originalLanguage: String
  let originalTitle: String
  let overview: String
  let popularity: Double
  let posterPath: String
  let releaseDate: String
  let title: String
  let video: Bool
  let voteAverage: Double
  let voteCount: Int

  enum CodingKeys: String, CodingKey {
    case adult
    case backdropPath = "backdrop_path"
    case genreIDS = "genre_ids"
    case id
    case originalLanguage = "original_language"
    case originalTitle = "original_title"
    case overview
    case popularity
    case posterPath = "poster_path"
    case releaseDate = "release_date"
    case title
    case video
    case voteAverage = "vote_average"
    case voteCount = "vote_count"
  }

  init(title: String, overview: String) {
    self.title = title
    self.overview = overview
    adult = false
    backdropPath = ""
    genreIDS = []
    id = 000
    originalLanguage = ""
    originalTitle = ""
    popularity = 0.0
    posterPath = ""
    releaseDate = ""
    video = false
    voteAverage = 0.0
    voteCount = 0
  }
}
