Sections to be Included:
 - R10, separated into it's three parts

# Game Master
The purpose of the Game Master application is to provide a character management system for gamers / dungeon masters for various table top games as well as provide some basic tools for gameplay such as dice rolls, coin flips and damage/healing calculators. The application allows users to create basic characters with customizable statistics and modifiers and import/export those character sets for future use.
 - R10-1
 - R10-2
 - R10-3
## Why use Game Master?
The app attempts to make it easier to play certain games that require frequent calculations and probability roles without the need for a conventional calculator or physical dice. This makes it especially useful when used in an online environment. It will also make the process of creating and editing characters easy as well as allow for the tracking of changes made to those characters and store them in certain states between game sessions.
## Target Audience
The target audience of the application is primarily table top board or card gamers who would benefit most from the character management system and various calculators. Secondary target audiences would also include people seeking to create their own games or stories where a database of characters would also be a useful tool.
## How to use
The use of the application is simple, and consists of a hierarchical set of menus, each with options for the user to select. On start-up, the user will be shown a main menu which will give them access to the character manager menu, which itself will include options to create new characters, edit or delete existing ones as well import or export any previously created characters or character sets. The different calculators will also be displayed from the main menu and each sub-menu will feature a help section which will provide information about what the currently selected menu can do and how to use it, with examples of use and if necessary, links to a more comprehensive tutorial of use. Each menu will have an option to go back to the previous menu, back to the main menu and an exit option for ease of navigation.

## Help
Here you will find information about all the features of game master and how to use them. Simply look for the heading for the feature you need help with and we'll explain how it works and give you some examples.
### Main Menu
This is where you start any time you load up the application. From here you can access the different features of the application by navigating the menu using the up and down arrow keys on your keyboard, or your number keys. Up and down will navigate your selector up and down the numbered list of options, whereas your number keys will instantly move the selector to the coresponding option with that numbered index. When you have your selector hovering over an option you would like to access, simply press enter and it will perform an action based on your selection. Following are all the actions the main menu can complete:

1. Character Manager
    - This option will take you to the character manager menu. You can find more information about this menu under the 'Character Manager' heading further in this document.
2. Damage/Healing Calculator
    - This option will take you to the damage/healing calculator menu. You can find more information about this menu under the 'Damage/Healing Calculator' heading further in this document.
3. Dice Roller, Coin Flipper
    - This option will take you to the dice roller, coin flipper menu. You can find more information about this menu under the 'Dice Roller, Coin Flipper' heading further in this document.
4. Help
    - That's where you are now. Selecting this option in other sub-menus will display help on that menu's particular features.
5. Exit
    - This option will exit the application. Be aware that any characters created during your current session in the application are not saved on exit and must be exported in order to be used in later sessions.

### Character Manager
Selecting the 'Character Manager' brings you to a CHARACTER MANAGER MENU where you will be able to select from the following options; 'New Character', 'Edit Character', 'List Characters', 'Export Characters' and 'Import Characters'. Additionally you are able to access help through the 'Help' option, go back to the main menu with 'Go Back' and exit the program using 'Exit'.
New Character prompts you to enter a name for your new character and then displays options to set various statistics such as race, gender, level, health etc. Once complete, it will store the character in a temporary array for use during the current session of the app.
Edit character will display existing characters and prompt you to choose one to edit, then will display options to edit their stats, allowing you to choose multiple options for what you want to change. The app then prompts you to enter the value for those stats you have chosen to edit and sets those stats accordingly.
List characters will display a list of all characters in the current array and will prompt you to select one to view in further detail, displaying the name and statistics of the character in a table format. From here you can add custom statuses to your character's table of statistics.
Import and export characters will either prompt you to choose a file to import characters from or export current characters into a new or existing file.
After using any of these options (except 'Go Back' or 'Exit'), the app will either prompt you to return to the Character Manager Menu by pressing any key or take you there automatically.

### Damage/Healing Calculator
Selecting the 'Damage/Healing Calculator' from the main menu brings you to a DAMAGE/HEALING CALCULATOR MENU. From there you can choose to access the 'Damage Calculator', 'Healing Calculator', 'Help', 'Go Back' and 'Exit' options.
Choosing either 'Damage Calculator' or 'Healing Calculator' prompts you for a starting value, then a damage or healing value, then optionally any reductions or amplifications of that damage or healing (both integers and percentages). The calculator will then calculate the damage or healing dealt based on the values provided. The program will display the starting value, the ammount of damage or healing done and the end result.
After using any of these options (except 'Go Back' or 'Exit'), the app will either prompt you to return to the Damage/Healing Calculator Menu by pressing any key or take you there automatically.

### Dice Roller, Coin Flipper
Selecting the 'Dice Roller, Coin Flipper' option from the main menu prompts you first for whether you would like to 'Run Simulator', go back with 'Go Back' or exit the app with 'Exit'. If you choose to run the simulator, you will be prompted for the ammount of rolls or flips you want and then the ammount of potential results e.g. 6 for a six-sided die or 2 for a coin flip.
If the entered results number is 2 it will randomly display either heads or tails once for each number of flips requested. If the entered number is larger than 2 it will return a random result between 1 and the entered number (inclusive), and repeat until it has displayed results a number of times equal to the number of rolls you asked for.
After using the simulator, the app will either prompt you to return to the Main Menu by pressing any key or take you there automatically.