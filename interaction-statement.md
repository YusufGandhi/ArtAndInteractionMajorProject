# Interaction statement

## Opening

The sketch begins with an explanation about Indonesia. This initial scene consists of 3 different `SceneWithDialogBoxAndTimer` instances. Users are expected to do nothing but wait until the scenes does the transition. Additionally, each scene will last for 2 seconds, 6 seconds as the total for the 3 scenes.

After the initial explanation, the main title is displayed. The sketch is entitled `Ghost Stories`, reflecting the theme of this year's Art-And-Interaction-In-New-Media-course final project. This title scene, furthermore, lasts for 3 minutes. Users are expected to do nothing until the scene proceeds to the next one.

The last scene before the Indonesia map scene is the instruction of what users need to do during the rest of the sketch. Users need to explore different parts of Indonesia and memorize information about the ghosts for 1 minute. One minute should be adequate; it is long enough to visit various parts, but short enough to make it challenging.

Finally, to proceed to the Indonesia map, users need to click anywhere on the scene.

## Middle part of the sketch - Indonesia Map

The middle part is about the map of Indonesia. It is separated into 7 different parts: Sumatra, Java, Kalimantan, Sulawesi, Bali - Nusa Tenggara, Maluku, and Papua. These are the major islands of Indonesia. On top of the screen, a countdown timer is displayed to notify users how many seconds left before the quiz.

Each of the islands is clickable. Furthermore, when users put the mouse pointer on the island, the island's colour turns into red (the original colour is blue). This hover capability is to ensure users get a feedback that the mouse pointer hovers over which island.

Additionally, the name of the island is displayed at the bottom of the screen as the mouse hovers over it. This makes users familiar to the island's name as well.

After clicking one of the islands, the description of the ghost and its picture are shown. This makes use of the `SceneWithDialogBoxAndImage` class. When users finish reading the description, they can return to the main map by pressing `B` or `left-arrow` button on the keyboard.

In the Suanggi scene, when the users visit it for the first time, they will need to finish a mini game. Users need to kill 10 Suanggis by clicking on them for 3 times. Each Suanggi has its own life meter to show how much life it gets.

## Quiz

When the time is up on the Indonesia map scene, users will automatically proceed to the quiz scene. The transition scenes from the map to quiz questions last for 4 seconds.

On top left of the screen, five circles are displayed to indicate correct and incorrect answers to the five questions. Users are required to click either `A`, `B`, or `C` to answer.

After working on the quiz, users will have 3 different alternate endings. They are safe if they have answered all question correctly, a Suanggi is sent to them if they answered some questions incorrectly, and all the ghosts will visit them if they answered all incorrectly.