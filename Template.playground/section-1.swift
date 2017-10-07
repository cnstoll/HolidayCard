// Playground - noun: a place where people can play

import UIKit
import XCPlayground
import PlaygroundSupport

// This helps you build cards
import


CardBuilder


// Color Options
let blueSky = Color.blueSky
let hollyGreen = Color.hollyGreen
let lightBlue = Color.lightBlue
let lightGreen = Color.lightGreen
let lightOrange = Color.lightOrange
let lightRed = Color.lightRed
let lightYellow = Color.lightYellow
let snowWhite = Color.snowWhite


// Font Options
let abrilFatFace = Font.abrilFatFace
let handlee = Font.handlee
let markerFelt = Font.markerFelt
let pacifico = Font.pacifico
let satisfy = Font.satisfy
let savoye = Font.savoye
let zapfino = Font.zapfino


// Clip Art Options
let dradle = ClipArt.dradle
let garland = ClipArt.garland
let holly = ClipArt.holly
let menorah = ClipArt.menorah
let present = ClipArt.present
let snowflake1 = ClipArt.snowflake1
let snowflake2 = ClipArt.snowflake2
let snowman = ClipArt.snowman
let star = ClipArt.star
let christmasTree = ClipArt.tree


// This is your card
var card = Card()


// Set the color of your card
card.backgroundColor = lightYellow

// Set the greeting of your card
card.greetingText = "Happy Holidays!"

// Pick a font for your greeting
card.greetingFont = satisfy

// Set the message of your card
card.messageText = "From Everyone!"

// Pick a font for your message
card.messageFont = handlee

// Add pictures to your card
card.addClipArtImage(dradle)
card.addClipArtImage(garland)
card.addClipArtImage(holly)
card.addClipArtImage(menorah)
card.addClipArtImage(present)
card.addClipArtImage(snowman)
card.addClipArtImage(snowflake1)
card.addClipArtImage(snowflake2)
card.addClipArtImage(star)
card.addClipArtImage(christmasTree)


// Move your pictures where you want them
//card.moveClipArtImageDown(menorah)
//card.moveClipArtImageRight(snowflake1)
//card.moveClipArtImageUp(star)
//card.moveClipArtImageRight(star)
//card.moveClipArtImageRight(star)
card.moveClipArtImageLeft(christmasTree)


// Print your card!
printCard(card)

// Use this to find your printed card in the Finder
printDocumentsDirectory()

// Show card preview in Timeline view
let imageView = UIImageView(image: printCard(card))
//XCPlaygroundPage.currentPage.liveView = imageView



PlaygroundPage.current.liveView = imageView









