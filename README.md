# Opensource defrag

## IMPORTANT!
Make sure you upate osdf.bat in build/win32-msvc/  With a few modifications, this solution file will build perfectly for you and copy both your dll and symbol files to your mod directory.  Note if you have an ioquake install, you'll have to take some additional steps.  I'll be sorting this out soon.

## TODO

* Let's not try to sort the scoreboard, but rather edit the rank so the correct person is in the lead.  If ranks are fixed, the scoreboard should reflect that anyway.
* Set score to your best time in i:s:v format.
* Add cgaz HUD.
* Fine tune the physics.

Opensource Defrag is a project that aims to remake defrag, true to the original mod, using modern id-Tech3 engine and technology.  
## Goals:
### Improvement & Modernizing:
By using id-Tech3 engine, gameplay can stay true to the original.  
But, by using modern tools and technology, the game can be modernized and extended beyond its current limitations.  
See the [Roadmap](docs/roadmap.md) file for an overview of the project's future.  

### Gameplay:
- Maintain gameplay 1:1.  
- Achieve compatibility with existing maps. Avoid requiring any form of map porting for existing content.  
- Community collaboration in bug-fixing and further development of the mod.  

### Code & License:
- Respect OSS philosophy. Open source and community focus.  
- Rewrite the code 1:1, with the aid of reverse-engineered code only where strictly necessary.  
- Community based, where anyone can become a contributor.  


---
## License
### SDK, but open
This project uses QIIIA Source License (aka SDK).  
All contributors accept that their specific code modifications will be dual-licensed as SDK and GPL2-or-higher.  

### Opensource commitment
This project will always remain opensourced.  
To help in preservation of this freedom:  
- All users will have their own local copy of the source code  
- This copy will always be distributed inside the mod's distribution files  
This enforces openness, by giving the community power to control the source-code, just like GPL does.  
