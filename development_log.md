# Day 2
Decided to create a game called 21. I knew the first thing I needed to do was create a class for a deck of cards. To do so I listed each and every card and stored them in an array. The same was done for each possible suit. Unfortunately I wasn't able to figure out how to program the app to give two alternative values for Ace when the user recieves the card. So that's why I came to the conclusion of giving it a single fixed value just like the rest of the cards. 

# Day 8
Created a class for Bank in which user can access data using an instance method for the amount of cash in hand and the minimum betting required for the user to play the game. Before anything to work I had to list all the possible outcomes in the game using an if/elsif/else statement. Simple addition and subtraction functions were applied to each optional statement. For instance, if player won the bettings made would be added to players cash on hand and if player lost bettings would be substracted out of cash on hand. If there was one problem that I noticed in the game was that even when the player had less than the required bettings the game would still run and cash on hand values would increase negatively every time player continuely lost. To prevent that from happening I created a function where if "money.cash_on_hand" is less than "money.betting" the user will no longer be able to play the game. Hence the app will close and user will be prompted to restart the game.  



