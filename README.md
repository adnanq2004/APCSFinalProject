# APCSFinalProject
[Prototype]
https://docs.google.com/document/d/1k_w6A_P8MXqn3acamZcGMdxRVrvWz1QNINchRI9JinE/edit?usp=sharing

[Group Name]
Two For One Pac-kage

[Group Members]
Adnan Quayyum, Eric Guo

[Brief Description]
The overall project is gonna be mainly a Pacman clone. You start off in the center of the screen, and must navigate through a maze full of collectibles, just like in Pacman, and you must collect all of the collectibles on a level to move on. Enemies will exist that may kill you. If you die, you will be sent back to the center of the maze, and your life counter will tick down by one. Once your life counter reaches 0, a “Game Over” screen will be displayed, and the player will probably have an option to play again from the first level. The player will most likely be able to outspeed the enemies, but will need to perfectly maneuver around the board.

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
[Development Logs]
May 25, 2021
[Adnan] Working on making Pacman level on Processing. I tried to make each tile in Pacman about a 20 by 20 tile on processing, but didn’t make much progress.
[Eric] Created a player object that moves with the WASD keys. When it reaches the edge of the map size, it will stop moving. Currently this player does not work with the first map’s interior.

May 27, 2021
[Adnan] I spent the period continuing to make the level on processing, until Mr. K reminded us of a more efficient way. Finished making the grid on GoogleSheets. Will convert it to a readable file for the program and test out how it might work. I am also expecting that we’re going to need to make a fix on how player class works at the moment.
[Eric]  I spent the period planning out how to make the enemies work without having code that could potentially break, and eventually came up with the plan that was put in RocketChat. I started to code the ghosts however my approach was flawed in many ways and nothing worked as intended. Will need to restart coding ghosts. 

May 28,2021
[Adnan]I finished making the grid of level 1 readable, and it displays all of the correct elements. We will need to add more things for enemies that need to be spawned, and for the player character. I added a simple intro to the game. Just a simple “Welcome to the Game” and a countdown to what will probably be when you can take control of the player character.

May 29,2021
[Adnan] I wrote up a new UML Diagram for us to build on and created a DemoPlayer idea to update our current Player code. 
[Eric]  I realized that the plan I had for the enemies was flawed in many ways in regards to how they interact with the player, as such I decided to look at enemies from a different perspective and started to draw out how I wanted enemies to act

May 30, 2021
[Eric] I created the enemy class and it is now generally working, did not implement into the rest of the code yet to work in conjunction with everything however the idea is to use a Deque to code where it can go
[Adnan] I implemented the enemy class to work with the rest of the code, however the idea of Deque is rather impractical, as such, we now use something similar to the maze where we check possible paths

May 31, 2021
[Adnan] Enemies aren’t being as dumb. They can now walk on blank spaces, and move in one direction for the most part. I also edited the Player method so that they treat safe zones correctly, and can’t step on enemy tiles.
[Eric] The timings of the enemies are not unbearably slow, they can all coexist and move at a reasonable speed however randomly stop moving and might just not move again, I will need to investigate the cause of this in the future. 

June 1, 2021
[Adnan] I added to the interface features a bit. The number of coins to collect, as well as the coins collected are displayed perfectly. There is also a health system, where you can in fact lose the game. There is also a death and victory screen now. The enemy and player movements were also updated/limited. The player is able to move at three times to speed, but can suffer from input delay.
[Eric] Designed new player and enemy sprites. Player looks like a red demon cat head, and enemies look like alien-based tentacle monsters, somewhat loyal to the original design.

June 3, 2021
[Eric] Designed a better UI system to display stats like current level, remaining coins, coins collected, and lives remaining.
[Adnan] Adjusted player and enemy speed and edited some text on the death screen. Also updated the UML Diagram.

June 4, 2021
[Adnan AND Eric] Worked together to design 2nd level for pacman, and also draw ideas for new map traps. 
[Adnan] Imported the map to make sure it worked properly

June 5, 2021
[Eric] Worked on designing the boss, however certain things started to break the entire game. I will have to think of a different approach to make "uninhabitable" ground. 
