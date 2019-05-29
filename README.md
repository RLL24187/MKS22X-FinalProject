# MKS22X-FinalProject
DownGradius: <br /> a harder version of Everwing but not quite up to Gradius Nes <br /> <br />

***Monday 5/20/19*** (here we go!!!) <br />
*Rachel*: <br />
* Made classes, nothing works so far tho :( <br />
*Elizabeth*: <br /> wrote player class methods: shoot, move, display(interim), and constructor. <br /> <br />

***Tuesday 5/21/19***  <br />
*Rachel*: <br />
* Bullet can now display! No more issues with class doesn't exist errors <br />
* Note to self: setup and draw are outside of classes <br /> <br />
*Elizabeth*: <br />
* move & shoot weren't working and I couldn't find out why <br /> <br />

***Wednesday 5/22/19*** (time to cram bois) <br />
*Rachel*: <br />
* Created the Game constructor and started work on a new helper function "inRadius" to help with "inContact" <br />
*Elizabeth*: <br />
* move works!! The cause was because the game kept resetting. Created the abstract monster class. <br /> <br />

***Thursday 5/23/19*** (APUSH exam aghhhhhh) <br />
*Rachel*: <br />
* Worked on Bullet's inRadius, distanceTo, and inContact <br />
* Need to work on figuring out how to make the code less repetitive: <br /> maybe make a new abstract class
*Elizabeth*: <br />
* Created Stan and worked on Stan methods (move, display, constructor, etc) <br />
* Edited the game variables for more suitable names <br />
* Made player move slower so that when the user presses the keys it doesn't fly out of the board immediately <br /> <br />

***Friday 5/24/2019*** (AP CALC BC exam dkjgogiafhdk) <br />
*Rachel*: <br />
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
*Rachel*:<br />
* Didn't do much today: had a wedding banquet to go to and errands to run :(<br />
*Elizabeth*:<br />
* Didn't do anything either, on vacay without laptop

***Sunday 5/26/2019***<br />
*Rachel*:<br />
*Elizabeth*:<br />
*Created player shooting so it wouldn't shoot multiple bullets at once when you press space
*Edited the Stan and Tanky classes so there wouldn't be double methods of the same thing
*Worked on spawning the monsters and in the midst of creating a formation for the monster
*Tried to make the player move diagonally but wouldn't work: tried ArrayList and LinkedList but ended up getting NullPointerExceptions even when if I put (if != null) so I gave up and commented that out
