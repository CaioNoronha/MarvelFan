import Foundation
import UIKit

public struct MockedData {
    
    static func getCharacters() -> [HomeCell.ViewModel] {
        [
            HomeCell.ViewModel(title: "Black Widow", image: UIImage(named: "black_widow"), suggestions: getSuggestions()),
            HomeCell.ViewModel(title: "Captain America", image: UIImage(named: "captain_america"), suggestions: getSuggestions()),
            HomeCell.ViewModel(title: "Hawkeye", image: UIImage(named: "hawkeye"), suggestions: getSuggestions()),
            HomeCell.ViewModel(title: "Hulk", image: UIImage(named: "hulk"), suggestions: getSuggestions()),
            HomeCell.ViewModel(title: "Iron Man", image: UIImage(named: "iron_man"), suggestions: getSuggestions()),
            HomeCell.ViewModel(title: "Thor", image: UIImage(named: "thor"), suggestions: getSuggestions())
        ]
    }
    
    static func getSuggestions() -> [SuggestionCell.ViewModel] {
        [
            SuggestionCell.ViewModel(title: "Movie", image: UIImage(named: "movie_avengers")),
            SuggestionCell.ViewModel(title: "Movie", image: UIImage(named: "movie_avengers_age_of_ultron")),
            SuggestionCell.ViewModel(title: "Movie", image: UIImage(named: "movie_avengers_infinity_war")),
            SuggestionCell.ViewModel(title: "Movie", image: UIImage(named: "movie_avengers_endgame")),
            SuggestionCell.ViewModel(title: "Game", image: UIImage(named: "game_avengers")),
            SuggestionCell.ViewModel(title: "Comics", image: UIImage(named: "comics_civil_war"))
        ]
    }
    
    static func getFilter() -> [FilterCell.ViewModel] {
        [
            FilterCell.ViewModel(title: "Avengers"),
            FilterCell.ViewModel(title: "MCU"),
            FilterCell.ViewModel(title: "HQ's"),
            FilterCell.ViewModel(title: "Spiderverse"),
            FilterCell.ViewModel(title: "X-men"),
            FilterCell.ViewModel(title: "Fantastic Four"),
            FilterCell.ViewModel(title: "Heros"),
            FilterCell.ViewModel(title: "Villains"),
            FilterCell.ViewModel(title: "Sony")
        ]
    }
    
}
