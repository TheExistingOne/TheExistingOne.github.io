# Rebuild Demo - Post Mortem
### by Mia G.

<hr>

Starting about a month ago, my school did what we refer to as "Passion Projects". Every student picked something that interested them and connected in some way to their life or future. I opted to use this as an opportunity to get started on a project that I've been stalling on for a while: a survival/city-builder called Rebuild.


#### Step 1: Bureaucracy
Since I was working on this as a school project, first I had to go through several planning steps. This began with submitting a project proposal to the teachers that went over objectives, what I'd learn, how that connects to my career plans, and inspirations and research. (If anyone would like to look at the full text of that you can find it [here.](mialikestech.dev/blog/files/project-proposal.md)) To finish the planning, I created [this task board](https://trello.com/b/lQRPMud6/rebuild) to track progress through the project.

##### Step 1 Takeaways
Although I have written this in a way that made it sound nice and simple, it was not. The rigidity of the instructions made some of the steps extremely difficult to execute with regards to my project. Specifically the research was required to be in APA format which did not gel well with some of my sources and the task board was supposed to be a calender which doesn't work well with my approach to development. Next project I'd like to pick something that adapts a little better to weird project requirements and try to get some more information on requirements before getting started.

#### Step 2: Planning & Drafts
With the initial planning and approval process over, I got started on my development process. A lot of my brainstorming for the overall inspiration and genre of the game was included in my project draft so I could skip most of that. Instead I sat down and worked out what tools I was going to use and the primary game mechanics.

|Tool Used|Why|
|--------|---|
|Godot Engine|I've been frustrated with Unity for a while now. Although it's really powerful, I find it's UI system quite awkward and 2D support feels like an afterthought. With this in mind I wanted to try a different game engine. I didn't really want to cough up the licensing fees for a paid engine like Construct or Game maker when my free engine was working fine even if it did annoy me sometimes. Unreal was completely overkill and I didn't like the look of their Paper2D system. Given all this, Godot was starting to look like a good choice. It was also open source and primarily 2D-oriented which were both huge pluses.|
|Aseprite|Aseprite is hands down the best pixel art tool I've ever found. It's toolset just works and I've never had an issue with it so it was kind of a no-brainer|
|GitLab|GitLab was far more of an experiment than the other tools. I've never been a huge fan of microsoft and GitHub's occasional blatent disregard for licensing terms with projects like Copilot make me hesitant to continue using them. I considered something like Gitea but I don't have access to infrastructure I would need to host a public facing instance. This led me to using GitLab since their platform was free and I could easily migrate to self hosted later if I wanted to.|
|Trello|Trello has been my task tracker for a while. I'm familiar with it and it just works making it a no-brainer|

With my tools set out I wrote out a list of features and ideas I wanted to look at implementing first:
- Flexible Building System
- Community Building Mechanics
- Tech Tree
- Power Grid style infrastructure
- Solarpunk inspired technology
- Exploration
- Crafting

That's more than I can prototype during the month alotted for the project, so I narrowed it down to just the building and exploration systems. With game systems in mind, I sat down and started drafting and sketching out ideas, starting with the exploration system.

##### Step 2.1: Exploration

![](https://www.mialikestech.dev/blog/files/ExplorationNotes.jpg)

I wanted to build the exploration system on an isometric grid without jumping. To prevent unneccesarily confusing controls I mapped up to vertical relative to the screen instead of vertical relative to the tiles. With the basic decisions made, I moved on to prototyping the actual gameplay systems, starting with the stats system. I knew that I wanted to track around 3 stats and wanted them to interact with each other instead of draining seperately. With this in mind, I came up with the 3 stats and the following interactions:

|Stat|Behavior|
|---|-----|
|Health|Drained by other low stats, by rotten food, or dirty water - Replenished by medicine or some foods|
|Hydration|Drains 1 point every 3 seconds - Replenished by drinking water|
|Energy|Drained by most tasks - Replenished by resting|

I also mocked up the UI in aseprite which wound up looking like this:

![](https://www.mialikestech.dev/blog/files/ExploreMode.png)

With the mockup done I could move on to implementing the system in engine.

##### Step 2.2: Build System
Compared to the notes on the exploration system, I got relatively little prototyping done on the build system. Based on the kinds of mechanics I was envisioning I knew I would need 3 aspects to the building system: a tool to build and orginize the town, a tool to lay out power and other utilities, and a tool to handle terraforming. From here I tried to go straight into sketching up the interface but realized I still didn't really know enough about how I wanted to lay it out. Instead of just tinkering around in my notebook, I decided to try something different: market research.

Specifically, I asked a couple of gaming and development oriented discord communties I'm in what they like and dislike in building systems. This actually produced some really useful feedback and suggestions. A good building system needed to be simple and minimal but also flexible and not too restrictive. This requires a lot of tinkering and careful choice of tools. Additionally, people preferred to have systems like town building and electrical together, but terraforming seperate since it requires a different set of tools to be implemented.

Unfortunately this is where I wound up leaving the build system. With the process of learning a new game engine, juggling other work, and implementing the exploration system I just didn't have enough time to implement something as complicated as a building system. It's current state is a page of notes and a concept sketch.

![](https://www.mialikestech.dev/blog/files/BuildingNotes.jpg)

#### Step 2 Takeaways:
First some stuff that worked really well: 
- I tried pen and paper game development prototyping which wound up working really well thanks to the extra flexibility
- The start I got on the exploration system is actually really good
- I have a good direction for the build system and the user feedback was a great idea

And the not so good:
- I did not have enough time to implement something like this. This project really needed another few weeks to start showing my aims for it that it just didn't get.
- The systems I wanted to implement for the project were a little ambitious

#### Step 3: Engine time!
Prototyping done, I could finally bring everything into the engine. The stats system is probably the aspect of this I'm most proud of. It works on a system from Godot called signals where something like an enemy can just announce that it has delt damage and it's up to any classes that need that info to listen and act on it. That provided a really simple and expandable way to handle changes in stats that should make continued development smooth sailing.,

In addition to implementing my prototypes I also followed a wonderful tutorial from the channel Arkeve to implement an inventory system. Since it's super similar to theirs I won't touch on it much here, but it winds up working really well.

![](https://www.mialikestech.dev/blog/files/Inventory.png)

#### Step 3 Takeaways:
The implementation is another point where it became very obvious how this project was too big for the time alotted. While I'm really proud of the systems I do have implemented, I just didn't get time to implement even the basics of a lot of things I wanted to and that leads to the final product feeling really basic and kind of unimpressive

#### Conclusions:
Getting to finally work on this was a blast even if I didn't get as much done as I wanted to. Godot was a joy to work with (minus some text quirks) and I will definitely continue working in it. Also, the game is starting to come along and I'm really excited about continuing to develop it. For next time I work on a time constrained project though I need to control scope a lot better and pick something a little less stressful. Additionally my final exhibit was a little bit hastily put together and could have used some more work.
