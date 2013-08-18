---
layout: post
title:  "Accidental Graffiti"
date:   2013-08-18 17:38:05
categories: nyc maps opendata
---

<table>
    <tr>
        <th>resolution_action</th>
        <th>count(*)</th>
    </tr>
    <tr>
        <td>Graffiti is intentional.</td>
        <td>57</td>
    </tr>
</table>

Check out what I [re]discovered yesterday on the 
[NYC Open Data portal][nyc-open-data]: [graffiti locations][graffiti-locations].

> Addresses, current status, and coordinates of requests to clean graffiti 
> (other than bridges or highways) received from the public and SCOUT in the 
> last 12 months.

While the dataset's page claims that the data refers to the "last 12 months" and
is updated "monthly," the most recent data in it appears to be from two years 
ago, mid-August 2011. Judging from the data and the above description I can only 
assume that it has something to do with keeping New York [graffiti-free
forever][forever-graffiti-free] and [SCOUT][]ing.

Unfortunately, I don't know much else about the origins of the data, so be 
**suitably skeptical** of what follows. I know I will be.

Since the data contains addresses and coordinates I decided to map it to
understand it a bit more.  I'm documenting the process here for future reference
and for others who are interested in doing so.

**Step 1:** Download the data as a CSV, rename the columns (to remove spaces)
and import the data into [CartoDB][cartodb].

**Step 2:** Convert the coordinates in your new table to numbers. Turn the 
coordinates into points and reproject those points to [WGS84][]. This gist 
should come in handy with most data coming from the city with x and y
coordinates of unspecified projections:

<script src="https://gist.github.com/ebrelsford/6258702.js"></script>

**Step 3:** Make some maps!

Okay, here's the first one. All locations where the "resolution action" is
"Cleaning crew dispatched. No graffiti on property." I'm reading this as places 
where graffiti was reported, someone from the city showed up to clean it, and 
there wasn't any graffiti:

<div class="map-with-table">

    <h3 class="header">Graffiti locations: no graffiti found</h3>

    <div class="map">
        <iframe width='100%' height='400' frameborder='0' src='http://eric.cartodb.com/viz/9683c1be-0788-11e3-b614-5404a6a69006/embed_map?title=false&description=false&search=false&shareable=false&cartodb_logo=true&layer_selector=false&legends=false&scrollwheel=true&sublayer_options=1&sql=SELECT%20*%20FROM%20graffiti_locations%0AWHERE%20resolution_action%20LIKE%20"%25No%20graffiti%25"&sw_lat=40.606654663050485&sw_lon=-74.26483154296875&ne_lat=40.851215574282456&ne_lon=-73.60565185546875'></iframe>
    </div>

    <div class="table">
        <table>
            <tr>
                <th>borough</th>
                <th>count(*)</th>
            </tr>
            <tr>
                <td>Bronx</td>
                <td>9</td>
            </tr>
            <tr>
                <td>Brooklyn</td>
                <td>11</td>
            </tr>
            <tr>
                <td>Manhattan</td>
                <td>796</td>
            </tr>
            <tr>
                <td>Queens</td>
                <td>4</td>
            </tr>
            <tr>
                <td>Staten Island</td>
                <td>1</td>
            </tr>
        </table>
    </div>

    <div style="clear: both;"></div>
</div>

Whoa, Manhattan! Are manhattanites really this bad at identifying graffiti? Or
does the graffiti get cleaned up before the city gets there to do something 
about it?

And it's not because Manhattan has the bulk of the graffiti reports. Here are 
all of the locations:

<div class="map-with-table">

    <h3 class="header">Graffiti locations: all locations</h3>

    <div class="map">
        <iframe width='100%' height='400' frameborder='0' src='http://eric.cartodb.com/viz/4cef7c76-0825-11e3-86d3-5404a6a69006/embed_map?title=false&description=false&search=false&shareable=false&cartodb_logo=true&layer_selector=false&legends=false&scrollwheel=true&sublayer_options=1&sql=&sw_lat=40.606654663050485&sw_lon=-74.26483154296875&ne_lat=40.851215574282456&ne_lon=-73.60565185546875'></iframe>
    </div>

    <div class="table">
        <table>
            <tr>
                <th>borough</th>
                <th>count(*)</th>
            </tr>
            <tr>
                <td>Bronx</td>
                <td>2823</td>
            </tr>
            <tr>
                <td>Brooklyn</td>
                <td>3924</td>
            </tr>
            <tr>
                <td>Manhattan</td>
                <td>4149</td>
            </tr>
            <tr>
                <td>Queens</td>
                <td>3421</td>
            </tr>
            <tr>
                <td>Staten Island</td>
                <td>201</td>
            </tr>
        </table>
    </div>

    <div style="clear: both;"></div>
</div>

What about the other statuses a report can have? 

* Cleaning crew dispatched. Cannot locate property.
* Cleaning crew dispatched. No graffiti on property.
* Cleaning crew dispatched. Owner refused.
* Cleaning crew dispatched. Property cleaned.
* Graffiti is intentional.
* Graffiti Reported
* Mail returned / wrong address
* Notice of Intent to Clean and Forever Graffiti Free Form sent
* Site downloaded for cleaning
* Site to be cleaned.
* Unspecified

Errr, "Graffiti is intentional."?! This strikes me as, at the very least, a poor
label for a resolution to a complaint. Did the cleaning crew get to the
location, see the graffiti, and having determined that it was "intentional," 
decide to leave it there? Is this different from "...Owner refused"?

In the context of this dataset and the city's graffiti-removal programs, I 
assume that "intentional" is *meant* to say that the property owner wanted the 
graffiti there or agreed to have it put there. But this isn't what "intentional"
means in conversation, where it means that a thing was done on purpose. Here we
see the city and databases turning an urban phenomenon that is driven by people,
a (like it or not) cultural artifact, into a vast accident that might as well be
litter:

<div class="map-with-table">

    <h3 class="header">Graffiti locations by intention</h3>

    <div class="map">
        <iframe width='100%' height='400' frameborder='0' src='http://eric.cartodb.com/viz/85c59718-082c-11e3-86d3-5404a6a69006/embed_map?title=false&description=false&search=false&shareable=false&cartodb_logo=true&layer_selector=false&legends=true&scrollwheel=true&sublayer_options=1%7C1&sql=&sw_lat=40.57745558120849&sw_lon=-74.27993774414062&ne_lat=40.8210843390845&ne_lon=-73.62075805664062'></iframe>
    </div>

    <div class="table">
        <table>
            <tr>
                <th>intentionality</th>
                <th>count(*)</th>
            </tr>
            <tr>
                <td>accidental</td>
                <td>12606</td>
            </tr>
            <tr>
                <td>intentional</td>
                <td>57</td>
            </tr>
            <tr>
                <td>no graffiti</td>
                <td>836</td>
            </tr>
            <tr>
                <td>other</td>
                <td>1019</td>
            </tr>
        </table>
    </div>

    <div style="clear: both;"></div>
</div>

Wow, maybe the city should focus on training people to handle cans of spray 
paint. Then the scourge of accidental tags could subside. (Yes, I added the
intentionality column and grouped the resolution actions the best I could.)

Is this what intentional graffiti looks like? This is 601 Washington St, around
9 months after a graffiti report here was closed as being "intentional":

<iframe width="100%" height="350" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://www.google.com/maps?q=601+Washington+St,+New+York,+NY&amp;layer=c&amp;sll=40.730539,-74.008601&amp;cbp=13,323.21,,1,-0.1&amp;cbll=40.730378,-74.008739&amp;hl=en&amp;ie=UTF8&amp;hq=&amp;hnear=601+Washington+St,+New+York,+10014&amp;ll=40.730552,-74.008605&amp;spn=0.411579,0.835648&amp;t=h&amp;z=11&amp;panoid=_K9av0dJ1kBGakbhfExUQQ&amp;source=embed&amp;output=svembed"></iframe>

I have no idea if what is pictured above is the graffiti that someone reported,
but it wouldn't surprise me if the cleaning crew got here, saw that the 
object(s) in question were closer to what would be considered traditional art 
and felt weird about destroying it.

If this is the case, though, who is left with the agency to do something on 
purpose on property? Owners and certain types of artists?

[nyc-open-data]: https://data.cityofnewyork.us/
[graffiti-locations]: https://data.cityofnewyork.us/Social-Services/Graffiti-Locations/2j99-6h29
[cartodb]: http://cartodb.com
[forever-graffiti-free]: http://www.nyc.gov/html/cau/html/graffiti/graffiti.shtml
[SCOUT]: http://gis.nyc.gov/moo/scout/index.htm
[WGS84]: https://en.wikipedia.org/wiki/WGS84
