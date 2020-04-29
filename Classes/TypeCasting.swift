//
//  main.swift
//  Casting
//
//  Created by Derrick Park on 4/27/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import Foundation

class MediaItem {
  var name: String
  init(name: String) {
    self.name = name
  }
}

class Movie: MediaItem {
  var director: String
  init(name: String, director: String) {
    self.director = director
    super.init(name: name)
  }
}

class Song: MediaItem {
  var artist: String
  init(name: String, artist: String) {
    self.artist = artist
    super.init(name: name)
  }
}

let library: [MediaItem] = [
  Movie(name: "Avengers", director: "Joss Whedon"),
  Movie(name: "The Shawshank Redemption", director: "Frank Darabont"),
  Movie(name: "Toy Story", director: "John Lasseter"),
  Song(name: "Shake it off", artist: "Taylor Swift"),
  Song(name: "Wherever I may roam", artist: "Metallica"),
  Song(name: "Blidning Lights", artist: "The Weeknd"),
]

var movieCount = 0
var songCount = 0
for item in library {
  if item is Movie {
    movieCount += 1
  } else {
    songCount += 1
  }
}


func getDirector(_ movie: Movie) -> String {
  return movie.director
}

// Down Casting

// as? (safe casting)
if let movie = library[3] as? Movie {
  print(getDirector(movie))
}

// as! (force cast, if wrong -> crash!)
//let m = library[3] as! Movie
//print(getDirector(m))


// Up Casting
// as
let mov = library[0] as! Movie
let media = mov as MediaItem
print(media.name)

// Switch Statement (as)
let item = library[0]
switch item { // by default, switch has to be exhaustive (cover all cases)
  case let movie as Movie:
    print("\(movie.name), directed by \(movie.director)")
  case let song as Song:
    print("\(song.name), sung by \(song.artist)")
  default:
    print("unknown type")
}
