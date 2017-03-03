# Artist statement

## Inspiration

Indonesia is a country consisting of 17,000+ islands. There are more than 700 local dialects. This richness of Indonesia is also reflected in the variety of local ghost stories. As this year's Art and Interaction In New Media project theme is `ghost stories`, I decided to create a sketch based on Indonesia's mythologies.

From Sabang, the west most island of Indonesia, to Merauke, Indonesia's east most district, there are various myths to be told. Three minutes are definitely insufficient to finish all ghost tales, thus I chose a few of the most well known ones. They are:

- Kuntilanak, the renowned female ghost in white,
- Mariaban, the jungle monster of Kalimantan,
- Begu Ganjang, the tall ghost,
- Sundel Bolong, the female undead with a big hollow on her back,
- Pocong, the Muslim undead,
- Suanggi, the fire ghost of Papua, and
- Leak, the Balinese legendary half-human.


## Method

I am using the `Scene` class, provided in the 5th assignment as the foundation of the sketch. I modified the `Scene` class into an abstract class and used it to create several concrete subclasses. There are 6 different class that inherits the `Scene` abstract class: `SceneWithDialogBox`, `SceneWithDialogBoxAndImage`, `SceneWithDialoBoxAndTimer`, `SceneGame`, `SceneIndonesiaMap`, and `SceneQuizQuestion`.

Each of the sub-class has its own functionality. For example, `SceneWithDialogBoxAndImage` contains mainly two components: a dialog box to show texts and an image.

Users will spend majority of their time on the `SceneIndonesiaMap` instance to explore different ghost stories. The ghost stories are mapped into different parts of Indonesia. The different parts are the major islands of Indonesia.

There are three ghosts / monsters that have signatures that can be told to in the sketch: Kuntilanak, Suanggi, and Pocong. For Kuntilanak, users can listen to her distinctive laugh by clicking on the scene.

Furthermore, the users will be surprised in the Suanggi scene when the users press the keyboard button to return to the main map. Users need to kill all suanggis before proceeding to the intended scene. Lastly, in the Pocong scene, users can see the animated Pocong jumping back and forth as it is the way Pocong moves.

After spending 1 minute on the Indonesia's map, users will take a 5-question quiz. The questions are about ghosts in the previous section of the sketch. After taking the quiz, there will be 3 alternate endings based on the number of correct answers.

The first one is when the users answer all questions correctly. The second one is when only a few answers are correct. And the last one is when all answers are incorrect.

## Reflection

Creating this sketch is the most challenging of all (as expected). I wanted to create deeper insights about the ghosts by creating additional description, but had inadequate information about some of them. Thus, only 3 ghost scenes have additional information, i.e. Kuntilanak, Pocong, and Suanggi.

If I have more time, I would love to add more animation to give a richer experience to the user.