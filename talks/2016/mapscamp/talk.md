the data behind the maps

While we tend to talk about the large and relatively coordinated data projects that drive today's maps, we don't talk as much about the smaller data projects that all mapmakers create when making their maps. Here I present some of these smaller data projects, including some pre-internet project, during-internet projects, and one of my own.

 1. We tend to talk about tools more than we talk about data.
  * Tools tend to be easier to talk about.
  * When talking about tools we tend to assume that the person we're talking to has data already.
 2. When we do talk about data we tend to talk about medium- to large-scale data projects.
  * Census
  * Open data portals
  * OSM
  * Public Lab
 3. But once you have the tools you're using and the base data, finding your own data becomes a project of its own
  * The moment where you realize you need to create or aggregate the data on your own can be pretty illuminating
  * Google search, open data portal search, ...nothing?
 4. Why doesn't all data exist then?
  * Historic data mostly not digitally available
  * Not being compiled by the government or other large organization
  * There are some limits to open data, politically inconvenient data maybe not always released
 5. So let's collect it (including examples here)
  * Foot surveying
   * SCP, Fitzgerald
   * Eg with Field Papers
    * Stamen's google bus work
  * Georeferencing old maps
   * Eg with QGIS and scanned maps (HOLC redlining maps)
   * Ron's HOLC map, other HOLC maps
   * NYPL Labs
  * Transcribing from paper and academic literature, aggregating data from the news and other sources
   * OUTgoing
   * The Counted
   * Mean Streets
  * Scraping
   * Inside Airbnb
  * Good ol' qualitative research
   * Anti-Eviction Project
 6. In-depth with a project I was involved in, Urban Reviewer




Hi, my name is Eric Brelsford. I'm a software developer, I make maps, and I teach about making maps at the graduate level. My classes use both desktop GIS and webmaps.

As I'm sure some of you have run into before, when I introduce myself as a mapmaker I will often hear something in return like, "but I thought everything has been mapped already, what is left to do?"

It reminds me of this scene in Arrested Development where Buster, on the right, has just taken some cartography classes. Michael, on the left, says "hasn't everything already sort of been discovered though, by, like, Magellan and Cortez...". You know, those guys. Buster says, "Yeah, those guys did a pretty good job, but there's still, you know..." He gets cut off there, but I find that at this point in a conversation I have to get straight to the particularities of a project to help the other person understand the kinds of things I do.

Let's take a step back and think about the mapmaking process.

Often in spaces like these, we tend to talk more about tools than we do about data.

Or when we do talk about data, we tend to talk about the medium to large data sources and projects. Maybe it's overwhelming to talk about the details of every small project that is out there, maybe it's less exciting somehow. Maybe it is because there are a lot of programmers in the room, and programmers naturally want to talk about tools.

Either way, we tend to acknowledge large projects like the Census, with its American FactFinder and other means of accessing the data it holds.

And open data portals clearly dominate our thinking about finding data to use, both at the federal and local levels.

Outside of government of course we tend to talk about OpenStreetMap and the ways we collect data for it. And related projects such as openaddresses and Public Lab. These are relatively large and coordinated projects, often aiming toward producing a relatively centralized database for everyone to use.

These projects are excellent and I'm happy to participate with them. My maps would be nothing without OpenStreetMap for example. But today I would like to talk about the data that backs smaller projects. The particular data. The data about the phenomena that are perhaps too temporary or nebulous to belong in a project such as OpenStreetMap.

These projects tend to come about when you realize that a google search isn't going to get you data.

And the open data portals don't give you helpful results. (This seems to be a bug on data.gov--if you search for something with no results it gives you an error page! I reported it.)

Why doesn't all the data exist? People who are new to making maps tend to be pretty surprised when they get to this point. We seem to think that if data would be useful it already exists and is easily found online. I'll talk about three reasons here.

Sometimes this data exists on paper and has not been digitized.

Sometimes the data hasn't been collected.

Sometimes the data is politically inconvenient to release. There's a moment in Denis Wood's _Rethinking the Power of Maps_ where he is critiquing the official highway map of North Carolina. He spends a bit of space making the case that even an innocuous map like this one is political. Part of his argument is that making the *choice* to map highways and make those maps freely available (opposed to other maps) is a political decision.

He says: "...there is no injunction on the state to map its roads anymore than there is for it to map the locations of deaths attributable to motor vehicles, or the density of cancer-linked emissions from internal combustion engines, or the extent of noise pollution associated with automotive traffic..."

"It would be gratifying to live in a state that produced 1.75 million copies of such maps and distributed them free of cost...but states find it more expedient to publish maps of highways."

So through some confluence of these reasons and many others, there are plenty of phenomena have not been mapped. My students inevitably hit a point where googling and searching a few open data portals does not suffice, and their work is suddenly twice as difficult as it looked like it was going to be before. There is always that moment where you realize that it might not matter how much you work at it--the data may simply not exist.

What do we do next? There are a number of options, and I'd like to walk you through them here along with examples of projects that have used these methods.

First let's talk about surveying on foot. I love collecting data this way when I can, it's such an intimate method and tends to give me a better understanding of what I'm mapping and the area I'm looking at.

One group that used foot surveys in a way that inspired me is the Surveillance Camera Players. The group put on shows for the operators of surveillance cameras by holding up large signs such as this one in front of cameras.

The group was active in NYC starting in the late 90s.

The idea was to create a spectacle in front of the cameras in order to raise awareness of them.

But they didn't just put on shows such as this one.

They also mapped surveillance cameras, mostly in NYC, and generally at the neighborhood level. This map is from 2005 so it's definitely missing some cameras.

They produced a pretty handy methodology for doing the mapping.

Here's a zoomed-in version. They clearly learned a bit while mapping!

One of the ways I learned about the Players is through this webmap, which was the first webmap I saw that really inspired me to make maps online. It's called iSee. The red boxes are surveillance cameras, the person icon is the start point of a journey, and the star is the endpoint of a journey. Through this interface you can find the "route of least surveillance". Some of the data came from the Surveillance Camera Players' maps.

For historic maps I usually turn to georeferencing.

You can do this easily in QGIS, ...

NYPL's Map Warper, ...

and Public Lab's Map Knitter.

There have been a number of maps online that have georeferenced old redlining maps and combined them with modern-day data. Redlining was a federal policy of marking some neighborhoods in cities red as you can see here and making it essentially impossible to get a mortgage and own a home in these neighborhoods. The classification was racially determined and has had serious long-term impacts.

One example of using these maps is in Baltimore, where the redlining map has been overlaid with parts of the city that have high poverty rates today. The lighter parts in the middle have higher poverty rates and for the most part fall within redlined areas.

This is an example by a former student of mine, Ron Morrison. He georeferenced and traced redlining maps of upper Manhattan, then found the average land value in each region as you can see here.

A lot of my students' work becomes transcribing and aggregating data. This can take a lot of work!

One example of this that I find exciting is Jeff Ferzoco's (are you here Jeff?) OUTgoing NYC map which shows the locations LGBT nightlife spots over time. Jeff has done a ton of research, including reading texts and surveying people, to find these historic locations.

On the map you can find details about each spot, including when it was in operation.

WNYC collected data about fatal traffic crashes in NYC in 2014 in its Mean Streets project. As you can see, the project shows the location of the crash and, where available, tells the story of the people who died in that crash. It's very easy to download the city's crash data and make simple maps with it, but it's so humanizing to include stories and pictures of the people involved.

The Guardian's project, The Counted, similarly aggregates information about people who were killed by police in the US.
