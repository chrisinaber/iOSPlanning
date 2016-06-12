/*:
# Deck of Cards
A playground to explore enums, structs and random numbers

Lets start with by making ranks for the cards
*/

import UIKit   // Needed for random function

enum Rank: Int {
    case Ace = 1, Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen, King
    func name() -> String {
        switch self {
        case .Jack:
            return "Jack"
        case .Queen:
            return "Queen"
        case .King:
            return "King"
        case .Ace:
            return "Ace"
        default:
            return String(self.rawValue)
        }
    }
    func shortName() -> String {
        switch self {
        case .Jack:
            return "J"
        case .Queen:
            return "Q"
        case .King:
            return "K"
        case .Ace:
            return "A"
        default:
            return String(self.rawValue)
        }
    }

}


/*:
Now we declare the four suits in Bridge value order, least first
*/
enum Suit: Int { // Suits in Bridge order
    case Clubs=1, Diamonds, Hearts, Spades
    func name() -> String {
        switch self {
        case .Clubs:
            return "Clubs"
        case .Diamonds:
            return "Diamonds"
        case .Hearts:
            return  "Hearts"
        case .Spades:
            return "Spades"
        }
    }
    func emoji() -> String {
        switch self {
        case .Clubs:
            return "♣️"
        case .Diamonds:
            return "♦️"
        case .Hearts:
            return  "♥️"
        case .Spades:
            return "♠️"
        }
        
    }
}

/*:
Now a `struct` can be used for each card.

Create a struct called "Card" that has a rank of type `Rank` and a suit of type `Suit`

Make Card printable so we can provide a description of each card to routines like println

*/

struct Card: Printable {
    var rank: Rank
    var suit: Suit
    var longDesc: String {
        return "The \(rank.name()) of \(suit.name())"
    }
    var description: String {
        return "\(rank.shortName())\(suit.emoji())"
    }
}

/*:
Now we can have a pack of cards. We will make this via a Pack class.
*/

class Pack {
    var cardPack: [Card] = []
    
    init() {
        for suit in [Suit.Clubs, .Diamonds, .Hearts, .Spades] {
            for cardValue in (1...13) {
                let cardRank = Rank(rawValue: cardValue)
                var newCard = Card(rank: cardRank!, suit: suit)
                self.cardPack.append(newCard)
            }
        }
    }
    
    func drawAnyCard() -> Card {
        // To get a random number `arc4random()` is used.
        var tmpNum = Int(arc4random_uniform(UInt32(cardPack.count)))
        return cardPack.removeAtIndex(tmpNum)
    }
    
    func dealCard() -> Card {
        // take the first card
        return cardPack.removeAtIndex(0)
    }
    
    func returnHand( cards: [Card] ){
        // returns to bottom of pack
        for card in cards {
            cardPack.append( card )
        }
    }
    
    func shuffleDeck() {
        // Swap two random cards 100 times
        var tmpNum1:Int
        var tmpNum2:Int
        var tmpCard:Card
        for i in (1...100) {
            tmpNum1 = Int(arc4random_uniform(UInt32(cardPack.count)))
            tmpNum2 = Int(arc4random_uniform(UInt32(cardPack.count)))
            tmpCard = cardPack[tmpNum2]
            cardPack[tmpNum2] = cardPack[tmpNum1]
            cardPack[tmpNum1] = tmpCard
        }
    }
}

var p = Pack()
p.shuffleDeck()

for card in p.cardPack {
    println(card)
}

for i in (1...5){
println( "Now deal: \(p.dealCard())" )
}

println("================")
for card in p.cardPack {
    println(card)
}



