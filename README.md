# Tempo

Tempo is an app designed to offer a new way of keeping time when playing music.

## Motivation

As a drummer, it is crucial to be able to keep time. Metronomes help with this, but either impair what you hear by beeping at you obnoxiously, or stop you being able to look around your kit or the rest of the stage/band because you need to keep an eye on a tiny flashing LED.

## Solution
Buy an Apple Watch, d’uh! With the haptic feedback, we have an opportunity to provide a pulse to the wearer that doesn’t limit them in any way!

This app lets you set a tempo either on the watch itself, or on the paired iPhone. You can then have the tempo flash if you should so wish, or you can have the haptic feedback sensor on the watch pulse in time with the entered tempo.

## To Do
* Add in the pulse of the haptic feedback sensor. At the time of beginning to write this app, developers didn’t have access to the haptic feedback sensor - something I didn’t realise until I was well down the rabbit hole!
* Upgrade the code. It is written (I think) in Swift 1.2, meaning it doesn’t compile anymore. The code should be updated to Swift 2.
* Upgrade the app architecture. This app was written back before apps could be run natively on the watch, so is merely an extension. This should be rectified.