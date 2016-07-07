the data behind the maps

While we tend to talk about the large and relatively coordinated data projects that drive today's maps, we don't talk as much about the smaller data projects that all mapmakers create when making their maps. Here I present some of these smaller data projects, including some pre-internet project, during-internet projects, and one of my own.

 1. We tend to talk about tools more than we talk about data.
  * Tools tend to be easier to talk about.
  * When talking about tools we tend to assume that the person we're talking to has data already.
 2. When we do talk about data we tend to talk about medium- to large-scale data projects.
  * Census
  * Open data portals
  * OSM
  * Open Aerial Map
  * Gazetteers such as Mapzen's
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
  * Transcribing from paper and academic literature
   * Aggregating data from the news and other sources
   * 
  * Scraping





Hi, my name is Eric Brelsford. I'm a software developer, I make maps, and I teach about making maps at the graduate level. My classes use both desktop GIS and webmaps.

As I'm sure you have run into before, I will often tell someone I just met that I make maps, and I will hear something in return like, "but I thought everything has been mapped already, what is left to do?" Pretty much the same as this scenario that Buster experiences in Arrested Development.

It's funny being a mapmaker and putting myself in these people's shoes. To be sure, having full access to all the data one would ever want to map would be both terrifying and exciting. Mapmaking would be reduced to picking layers and colors. The question implies that the only things worth mapping are reference maps, maps of streets and land and water.

And on the internet we are overwhelmed by numerous maps of any style and topic, and I wonder when people ask this question what it is they think of these maps. Do they not see them? Don't the maps register with people?

So of course plenty of phenomena have not been mapped. My students inevitably hit a point where googling and searching a few open data portals does not suffice, and their work is suddenly twice as difficult as it looked like it was going to be before. There is always that moment where you realize that it might not matter how much you work at it--the data may simply not exist.

I have to admit that part of me enjoys this moment. This is when my students tend to really understand the fact that data is made by humans.

Sometimes my students do survey on foot for data, but more often they are transcribing data from academic literature or tracing aerial imagery or georeferenced imagery. Or sometimes they find some other way of mapping what was previously unmappable.


If we reimagine this diagram:

(given, known information) --cartographic process--> (map) --map reading--> (message)

to something like this:

(data) --> (tools) --> (map) --> (message)

It seems that when it comes to webmapping and desktop GIS we have numerous tools, tools that are becoming more accessible and more productive, and we have a reasonably vibrant critique of the maps that are their outcomes. But we don't necessarily talk nearly as much about the input data as we do the tools and the maps they create.

Why is this? There are some relatively clear reasons such as the fact that the particularities of data are hard to talk about, and perhaps people simply aren't as excited about the data as they are about the outcomes.


But that moment of creating data, by aggregating it or surveying for it or transcribing it in some way, is such a creative process, it's frustrating to hear it talked about as "data janitor" work. This is the moment where I find that you really start to learn about whatever it is that you are mapping and if you're surveying on foot you come away with a more intimate feeling for the topic at hand and the locations where you are surveying.

And on the other hand, let's keep in mind that most mapmaking tools these days assume that you already have data. "Load your data." It feels like we're missing a step here, and I can't help but think that this is pretty alienating for new mapmakers.

With this in mind, I would like to talk about some of the more exciting data collection and creation projects I've run into recently, and I'll wrap with the story of one project I have worked on personally.
