const movieListResponse = """
{
  "page": 1,
  "results": [
    {
      "adult": false,
      "backdrop_path": "/hdHIjZxq3SWFqpAz4NFhdbud0iz.jpg",
      "genre_ids": [
        27,
        878
      ],
      "id": 348,
      "original_language": "en",
      "original_title": "Alien",
      "overview": "During its return to the earth, commercial spaceship Nostromo intercepts a distress signal from a distant planet. When a three-member team of the crew discovers a chamber containing thousands of eggs on the planet, a creature inside one of the eggs attacks an explorer. The entire crew is unaware of the impending nightmare set to descend upon them when the alien parasite planted inside its unfortunate host is birthed.",
      "popularity": 105.105,
      "poster_path": "/vfrQk5IPloGg1v9Rzbh2Eg3VGyM.jpg",
      "release_date": "1979-05-25",
      "title": "Alien",
      "video": false,
      "vote_average": 8.149,
      "vote_count": 13681
    },
    {
      "adult": false,
      "backdrop_path": "/psYeKwKclG4XaIop5suj1J0Kg2C.jpg",
      "genre_ids": [
        12,
        28,
        878
      ],
      "id": 1892,
      "original_language": "en",
      "original_title": "Return of the Jedi",
      "overview": "Luke Skywalker leads a mission to rescue his friend Han Solo from the clutches of Jabba the Hutt, while the Emperor seeks to destroy the Rebellion once and for all with a second dreaded Death Star.",
      "popularity": 49.512,
      "poster_path": "/40HKwFzsPoukpQVYcM1bSWQWNkX.jpg",
      "release_date": "1983-05-25",
      "title": "Return of the Jedi",
      "video": false,
      "vote_average": 7.896,
      "vote_count": 14992
    },
    {
      "adult": false,
      "backdrop_path": "/owiT3FUjdQ2LEj4YxiT6vjPVcS4.jpg",
      "genre_ids": [
        878,
        28,
        27
      ],
      "id": 8077,
      "original_language": "en",
      "original_title": "Alien³",
      "overview": "After escaping with Newt and Hicks from the alien planet, Ripley crash lands on Fiorina 161, a prison planet and host to a correctional facility. Unfortunately, although Newt and Hicks do not survive the crash, a more unwelcome visitor does. The prison does not allow weapons of any kind, and with aid being a long time away, the prisoners must simply survive in any way they can.",
      "popularity": 43.046,
      "poster_path": "/xh5wI0UoW7DfS1IyLy3d2CgrCEP.jpg",
      "release_date": "1992-05-22",
      "title": "Alien³",
      "video": false,
      "vote_average": 6.4,
      "vote_count": 5247
    },
    {
      "adult": false,
      "backdrop_path": "/g90Hlbaj8OofowG9hDg9ScD5fqG.jpg",
      "genre_ids": [
        12,
        35,
        878
      ],
      "id": 27275,
      "original_language": "tr",
      "original_title": "G.O.R.A.",
      "overview": "Carpet dealer and UFO photo forger Arif is abducted by aliens and must outwit the evil commander-in-chief of G.O.R.A., the planet where he is being held.",
      "popularity": 12.86,
      "poster_path": "/e73adWbjLnPW2rzmG7lLYv1qxvp.jpg",
      "release_date": "2004-11-12",
      "title": "G.O.R.A.",
      "video": false,
      "vote_average": 7.322,
      "vote_count": 298
    }
  ],
  "total_pages": 1,
  "total_results": 4
}
""";

const errorResponse = """
{
  "success": false,
  "status_code": 6,
  "status_message": "Invalid id: The pre-requisite id is invalid or not found."
}
""";

const movieDetailsResponse = """
{
  "adult": false,
  "backdrop_path": "/vsjuHP9RQZJgYUvvSlO3mjJpXkq.jpg",
  "belongs_to_collection": {
    "id": 115570,
    "name": "Star Trek: The Next Generation Collection",
    "poster_path": "/jYtNUfMbU6DBbmd4LUS19u4hF4p.jpg",
    "backdrop_path": "/r7MMQenUURHhAVHFymtOb8AX4Bm.jpg"
  },
  "budget": 70000000,
  "genres": [
    {
      "id": 878,
      "name": "Science Fiction"
    },
    {
      "id": 28,
      "name": "Action"
    }
  ],
  "homepage": "https://www.paramountmovies.com/movies/star-trek-ix-insurrection",
  "id": 200,
  "imdb_id": "tt0120844",
  "original_language": "en",
  "original_title": "Star Trek: Insurrection",
  "overview": "abcdefghj",
  "popularity": 26.633,
  "poster_path": "/xQCMAHeg5M9HpDIqanYbWdr4brB.jpg",
  "production_companies": [
    {
      "id": 4,
      "logo_path": "/gz66EfNoYPqHTYI4q9UEN4CbHRc.png",
      "name": "Paramount",
      "origin_country": "US"
    }
  ],
  "production_countries": [
    {
      "iso_3166_1": "US",
      "name": "United States of America"
    }
  ],
  "release_date": "1998-12-11",
  "revenue": 118000000,
  "runtime": 102,
  "spoken_languages": [
    {
      "english_name": "English",
      "iso_639_1": "en",
      "name": "English"
    }
  ],
  "status": "Released",
  "tagline": "The battle for paradise has begun.",
  "title": "Star Trek: Insurrection",
  "video": false,
  "vote_average": 6.4,
  "vote_count": 1134
}
""";

const movieReviewsResponse = """
{
  "id": 200,
  "page": 1,
  "results": [
    {
      "author": "TheTenth",
      "author_details": {
        "name": "",
        "username": "TheTenth",
        "avatar_path": null,
        "rating": 10
      },
      "content": "abcdeffgh",
      "created_at": "2018-04-18T14:11:05.407Z",
      "id": "5ad751f99251413b2500f0bc",
      "updated_at": "2021-06-23T15:58:07.750Z",
      "url": "https://www.themoviedb.org/review/5ad751f99251413b2500f0bc"
    },
    {
      "author": "Wuchak",
      "author_details": {
        "name": "",
        "username": "Wuchak",
        "avatar_path": "/4KVM1VkqmXLOuwj1jjaSdxbvBDk.jpg",
        "rating": 6
      },
      "content": "abcdeffgh",
      "created_at": "2018-08-27T01:30:26.028Z",
      "id": "5b835432c3a3686560031333",
      "updated_at": "2021-06-23T15:58:11.799Z",
      "url": "https://www.themoviedb.org/review/5b835432c3a3686560031333"
    }
  ],
  "total_pages": 1,
  "total_results": 2
}
""";

const genreListResponse = """
{
  "genres": [
    {
      "id": 28,
      "name": "Action"
    },
    {
      "id": 12,
      "name": "Adventure"
    }
  ]
}
""";
