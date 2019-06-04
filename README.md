# MKS22X-FinalProject
# Welcome and Intro
DownGradius: <br /> a harder version of Everwing but not quite up to Gradius Nes <br /> <br />

# Development Log

***Monday 5/20/19*** (here we go!!!) <br />
*Rachel* 🐦: <br />
* Made classes, nothing works so far tho :( <br />

*Elizabeth*: <br />
* Wrote Player class methods: shoot, move, display(interim), and constructor. <br /> <br />

***Tuesday 5/21/19***  <br />
*Rachel* 🐦: <br />
* Bullet can now display! No more issues with class doesn't exist errors <br />
* Note to self: setup and draw are outside of classes <br />

*Elizabeth*: <br />
* move & shoot weren't working and I couldn't find out why <br /> <br />

***Wednesday 5/22/19*** (time to cram bois) <br />
*Rachel* 🐦: <br />
* Created the Game constructor and started work on a new helper function "inRadius" to help with "inContact" <br />

*Elizabeth*: <br />
* move works!! The cause was because the game kept resetting. Created the abstract monster class. <br /> <br />

***Thursday 5/23/19*** (APUSH exam aghhhhhh) <br />
*Rachel* 🐦: <br />
* Worked on Bullet's inRadius, distanceTo, and inContact <br />
* Need to work on figuring out how to make the code less repetitive: <br /> maybe make a new abstract class

*Elizabeth*: <br />
* Created Stan and worked on Stan methods (move, display, constructor, etc) <br />
* Edited the game variables for more suitable names <br />
* Made player move slower so that when the user presses the keys it doesn't fly out of the board immediately <br /> <br />

***Friday 5/24/2019*** (AP CALC BC exam dkjgogiafhdk) <br />
*Rachel* 🐦: <br />
* Starting to implement a Collider class: inRadius, inContact, distanceTo <br />
* Added an ArrayList print method, helpful to see what is in the ArrayList<Collidable>
* Trying to work on die by adding to ArrayList<Killable> (list of dead things) and removing from ArrayList<Collidable> (list of alive things)<br />
* Changed parameters for die function, takes both killedList and collideList<br/>
* Had an issue with repeating Bullets in move, put adding the Bullet and Monster in setup rather than draw <br />
* Implemented polymorphism and inheritance: began using super methods <br />
* Made the README look better<br />

*Elizabeth*: <br />
* Fixed Stan methods so stan would die outside of the board <br />
* Created Tanky and its methods (move, display, constructor)<br /> <br />

***Saturday 5/25/2019***<br />
*Rachel* 🐦:<br />
* Didn't do much today: had a wedding banquet to go to and errands to run :(<br />

*Elizabeth*:<br />
* Didn't do anything either, on vacay without laptop

***Sunday 5/26/2019***<br />
*Rachel* 🐦:<br />
* Updated parameters for methods in Collider
* Added Collider constructor
* Worked on distance, distanceTo, inRadius, and inContact in Collider
* Had a ConcurrentModificationException: lesson to be learned: don't use enhanced for loops when editing the ArrayList
* die is now a boolean method, still needs work
* Implemented inheritance with calls to super in Monster child classes <br />

*Elizabeth*:<br />
* Created player shooting so it wouldn't shoot multiple bullets at once when you press space
* Edited the Stan and Tanky classes so there wouldn't be double methods of the same thing
* Worked on spawning the monsters and in the midst of creating a formation for the monster
* Tried to make the player move diagonally but wouldn't work: tried ArrayList and LinkedList but ended up getting NullPointerExceptions even when if I put (if != null) so I gave up and commented that out

***Monday 5/27/2019***<br />
*Rachel* 🐦: <br />
* Fixed distance
* Worked on die: issue is that only one dies when both should die
* Player can now shoot

*Elizabeth*: <br />
* Trying to add diagonal movement for player, failed
* Coding formation for monster (Stan and Tanky) and was failing, nothing was spawning


***Tuesday 5/28/2019*** <br />
*Rachel* 🐦: <br />
* die now kills both objects and changes HP and checks it before killing
* Updated parameters for move
* changeHP added: returns new HP given the number to change it by
* Fixed constructors for classes
* inContact returns a Collider or null

*Elizabeth*: <br />
* Worked on formation: tested out different ways like forming the top then bottom first but still didn't display and adding the list to the function as a variable and adding monster directly but it created an error
* Deleted the species section of the constructor in monster, stan, and tanky, rachel and i agreed that it would be unecessary 

***Wednesday 5/29/2019*** <br />
*Rachel* 🐦: <br />
* die works with Bullet and Stan
* Noticed a bug. Monster always waits for Bullet to move first, so if there is more than one Bullet, Monster will seemingly disappear, but it is actually still there, just stagnant

*Elizabeth*: <br />
* I thought it wasn't working even though the code had no errors and I found out why tomorrow
* So the error from yesterday was a cause of directly add monster, instead I added stan/tanky (the monster's constructor) in order to add

***Thursday 5/30/2019*** <br />
*Rachel* 🐦: <br />
* die works with Tanky now
* formation fixed
* Optimized move and die
* Added Tiny
* Out of bounds dying boolean statements changed so that it'll only die when the whole object disappears from screen

*Elizabeth*: <br />
* the bug was that IT WAS SPAWNING IN THE WRONG SPOT bc I mixed up the input when constructing the monsters
* editing the player to move diagonally, finally working, I created an arraylist to track movement


***Friday 5/31/2019*** <br />
*Rachel* 🐦: <br />
* Fixed up README to look nicer
* Edited out of bounds dying boolean for Bullet: dies when whole thing disappears
* Updated formation to handle different sizes
* Played with speeds and sizes of Monsters
* Found and fixed issue with inRadius: bug with killing square shaped Monsters
* Starting to put everything together: update is a method that spawns different monsters randomly, but in the same locations and at specific time intervals

*Elizabeth*: <br />
* Worked on spawning and timing (added seconds to the game variable and random spawning)
* Trying to smooth out player but couldn't
* SAT subject tomorrow so I didn't work on it at home

***Saturday 6/1/2019*** <br />
*Rachel* 🐦: <br />
* Removed y bounds from die: mostly so Tiny doesn't die after oscilating too high
* Began randomizing ycor for spawning monsters
* Updated formations so it looks more interesting
* Took Mr. K's advice and added an angle parameter, movement is smoother now
* Added counters for spawning monsters

*Elizabeth*: <br />
* PLAYER IS NOW SMOOTH but also kinda choppy when going in opposite directions
* Also added monsters shooting 

***Sunday 6/2/2019*** <br />
*Rachel*🐦: <br />
* Adjusted frequency of monster spawning and better spread out their locations
* Cleaned up the code: update format and remove old comments
* Tried to get smooth movement... only got diagonal

*Elizabeth*: <br />
* Added menu, mouse guided: click start to start, guide for instructions, and exit to exit with fancy buttons that change color when hovered over
* the menu background is from google image (idk if it's copyrighted or not)
* avatar doesn't lead anywhere bc we haven't implemented that yet
* Cleaned up player movement, now it is no longer choppy when going in opposite directions, i just chose whatever the player clicked last

***Monday 6/3/2019*** <br />
*Rachel*🐦: <br />
* Fixed the blinking error: extra move was deleted
* Added Itemdrop, Coin, Shield, and DoubleBullet class
* Powerups work with time limits on when to collect and how long powers last

*Elizabeth*: <br />
* Fixed monster spawn as they spawned outside of board
* Added images for monsters, player, and itemdrop found online (idk if it's copyrighted or not)
* Shield generates around player when collected, imgs are really tiny for item drop and certain monsters


***Tuesday 6/4/2019*** <br />
*Rachel*🐦: <br />
* fill in later

*Elizabeth*
* fill in later
