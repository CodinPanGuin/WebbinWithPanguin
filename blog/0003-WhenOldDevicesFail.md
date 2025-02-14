---
layout: post
title: "When Old Devices Fail"
title2: "Tale of Attempted Recovery of Data from a 19-Year-Old Phone"
loc: blog
latex: false
date: 2025-02-13
---
# Table of contents
1. [Introduction](#introduction)
2. [The Phone](#chapter-1---the-phone)
3. [The Diagnostics](#chapter-2---the-diagnostics)
4. [The Procedure](#chapter-3---the-procedure)
- [First Attempt](#first-attempt)
- [Success](#success)
5. [The End of the Journey](#chapter-4---the-end-of-the-journey)


# Introduction
A friend of mine recently shared the story of an old phone she had purchased during a trip to Japan. Unfortunately, shortly after returning home, the phone stopped working when she plugged the charger into the wall. She was understandably upset, as the device contained most of the contacts she’d made while abroad, along with photos and videos she had taken during her trip. Knowing how important those memories were, I offered to take a look at the phone and see if there was anything I could do to recover the data.

# Chapter 1 - The Phone
<div style="margin-top: -7%; margin-bottom: -7%;">
<img src="/res/blogRes/V302SH.png" alt="V302SH.png" style="width: 10%; transform: rotate(90deg); margin-left: 40%; margin-right: 40%;">
</div>
The phone in question was a [V302SH](https://www.softbank.jp/en/-/media/sb/sjp/en/corp/set/data/group/sbm/news/press/vodafone/pdf/050818e.pdf), a [flip phone, also known as a clamshell design phone](https://en.wikipedia.org/wiki/Clamshell_design) that was released in 2006 by Japanese telecommunications company [SoftBank](https://www.softbank.jp/) and manufactured by [Sharp](https://jp.sharp/k-tai/lineup/). Quite the charming device in its time, the phone was equipped with about a 2-inch display with a resolution of 240x320 pixels, a camera that could take photos that were 640 pixels wide and 480 pixels tall, and a display on the back of the phone that could show notifications, time, and other metrics.
# Chapter 2 - The Diagnostics
The phone was in pretty good shape, with no signs of much damage at first glance. Other than tiny scratches, the phone looked as if it were a new device. However, after removing the battery cover, there was quite a bit of battery swelling, which was probably the reason why the phone stopped working. But battery is just a source of power, so I thought that if I could give it some kind of power with out that battery the phone may be able to turn on, at least turn on for long enough to pull out any data was left there.

# Chapter 3 - The Procedure
#### First Attempt
The power supplying devices such as phones are usually quite simple, you get positive terminal for voltage supplying and negative terminal for grounding, the battery is labeled with which terminal is which and the voltage which was 3.7V. 3.7V is common with lithium-ion batteries, however I did not have anything that would supply exactly 3.7V, I had a 5V supply and a 3.3V supply, but that additional 0.4V should not be a problem, since there should be overhead accounting for calls and other services which drain the battery. Therefore I decided to use 3.3V supply instead of trying to convert the 5V down.
<br>
<div style="">
<img src="/res/blogRes/01-PleaseCharge-FX.png" alt="PleaseCharge-FX.png" style="width: 30%; margin-left: 35%; margin-right: 35%;">
</div>

The screen lights up and makes a sound. How amazing, it would be a bit better if the sound wasn't loud beeping and the message on the screen wasn't "Please charge", but that doesn’t really mean a dead end, the battery is probably just signaling that there’s some charge, enough to preserve unsaved data and not just turn off and lose all of it. All I need is to use the third terminal marked with (S) on the battery, meaning Sensor. Thinking about how the sensor could signal how much battery is left in the phone, it should be with some kind of resistance, so all I need is some resistor to simulate the battery charge and I should be enough to move past this obstacle.
<br>
<div style="display: flex; justify-content: center; gap: 20px; flex-wrap: wrap; align-items: center;">
    <img src="/res/blogRes/02-Battery-FX.png" alt="Battery-FX.png" style="max-width: 50%; height: auto; transform: rotate(90deg);">
    <img src="/res/blogRes/03-Date-FX.png" alt="Date-FX.png" style="max-width: 40%; height: auto; transform: rotate(0deg);">
    <img src="/res/blogRes/04-On-FX.png" alt="On-FX.png" style="max-width: 40%; height: auto; transform: rotate(0deg);">
    <img src="/res/blogRes/05-Menu-FX.png" alt="Menu-FX.png" style="max-width: 40%; height: auto; transform: rotate(0deg);">
</div>
#### Success
Connecting a 10,000-ohm resistor between the Sensor and the Negative terminal was all I needed, the phone turned on and prompted me for the time and date, After that, nothing else stopped me from retrieving the data from the phone.. 
# Chapter 4 - The End of the Journey
Ye I could take all the data that was left, but unfortunately, nearly two decades of no power meant the data could not be preserved by the battery, the phone reset to factory settings, and all the data was lost as a result. There was nothing left to retrieve. The next day, I returned the phone to my friend. She was happy that I had tried to help her, but she was sad that the data had been lost. I was happy that I had been able to help her, but I was sad that I could not recover the data. The phone was a nice device, but it was time to let go of it, I hope the memories from the phone are ones that will be preserved in her mind and the relic of the phone will be a nice memory of the trip by itself.
