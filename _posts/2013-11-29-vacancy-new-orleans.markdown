---
layout: post
title:  "Looking at vacancy in New Orleans using parcel and building shapefiles"
date:   2013-11-29 20:40:05
categories: nola maps vacancy
---

While working on [Living Lots NOLA](http://livinglotsnola.org) we have been
looking for a good spatial database of vacant parcels citywide. When we have
done this work in [NYC](http://596acres.org/) and 
[Philadelphia](http://groundedinphilly.org/), we have been lucky enough to have 
land use databases that contain vacancy as a starting point for this type of 
analysis.

There is no comparable database in New Orleans that we have been able to find.
But the city does maintain good
[parcel](https://data.nola.gov/Geographic-Reference/NOLA-Parcels/e962-egyh) and
[building](https://data.nola.gov/Geographic-Reference/Building-Outlines/t3vb-bbwe) 
shapefiles. Using these, we started with a naive approach: if a parcel overlaps
with a building, then we'll consider it not vacant.

There's a problem with this approach, which was mentioned by some of the people
we met during the alpha release and that became clear when some parcels that are
clearly vacant were not being found in our data:

![Lot incorrectly marked not-vacant due to overlap](/img/nola-vacant-overlap.png)

**The buildings shapefile is not perfectly aligned with the parcels shapefile.**
In the above image, the parcel outlined in green has been determined *not* to be
vacant. The building that it overlaps with is outlined in red.

As it turns out, many of the buildings in the buildings shapefile are
shifted south a small amount. We didn't look into how systematic this shift is,
but our hunch is that the data collection process led to this shift, whether the
aerial imagery that was traced was not perfectly aligned, or that the angle of
the imagery wasn't fully taken into account when it was being traced. According
to the [building shapefile's metadata](https://data.nola.gov/Geographic-Reference/Building-Outlines/t3vb-bbwe):

> This layer of the City’s buildings is based on aerial imagery captured by
> Pictometry in January 2013. The outlines were captured using a semi-automated
> method with post-process editing. Some in-house edits were performed to
> reflect local knowledge of the landscape.

Either way, it's pretty clear that this naive approach is limiting when used
with this data. To find a better approach, we started by looking at the data and
plotting the areas of each parcel along with the percentage of that area that 
overlaps with buildings:

![Scatterplot, parcel areas (square feet, log scale) and percent overlap with buildings](/img/nola-overlap-scatterplot.png)

Going left on the x axis, parcels overlap less with buildings (down to 0%). To
the right, parcels are 100% covered with buildings, that is, every bit of land
has a building on it. The y axis is in log scale here, and lower points 
represent parcels with lower square footage, higher points are larger.

The gap between parcels 10 to 20% covered with buildings, in the 1000 to 10,000
square foot range, seems significant. Our hypothesis is that this gap separates
vacant parcels (to the left) from parcels with buildings on them (to the right).
From here we worked to create a line that represents this gap and tends to 
separate the vacant from the non-vacant parcels. Here's an early attempt:

![Scatterplot, loose line](/img/nola-overlap-plot-loose-line.png)

We wanted our line to have an angle like this because larger parcels (toward the
top) with buildings on them will not have a large percent of overlap (to the 
right).  As parcels get larger, even the smallest amount of overlap could 
represent a building that is actually on that parcel and not mistakenly shifted
to look like it's on the parcel.

From here we used a quick interactive map that let us filter the city's parcels
by area and percentage overlap with buildings. We gradually tightened the line
shown in the above image by picking a region on the plot, viewing it on the
interactive map, and sampling lots in that region. For each lot, we inspected
the overlap with buildings, aerial imagery, and Google Street View imagery to 
get an idea of how vacant a lot was. If it was clear that most of the lots in a
region actually tended not to be vacant, we pulled the line in tighter. We did
this until we arrived at this line:

![Scatterplot, tight line](/img/nola-overlap-plot-tight-line.png)

(Note that by the time we got to the above line we had moved the y axis to
linear scale rather than log scale. Otherwise the data and units are exactly the
same as those in the previous plots.)

Using this line, we have the following parcels (27,653 of them), which, according
strictly to the parcel and building shapefiles provided by the city, are likely 
vacant:

![Shapefile snapshot, probably vacant](/img/nola-probably-vacant-shapefile.png)

Of these parcels around 5500 have some overlap with the buildings shapefile and 
were ignored when we used the naive approach of checking whether a parcel has
any overlap whatsoever with a building:

![Shapefile snapshot, probably vacant, some overlap](/img/nola-probably-vacant-overlaps.png)

And here is a close-up of some parcels that are in the above snapshot:

![Probably vacant results](/img/nola-results-1.png)

Here the peach shapes are parcels with buildings on them, yellow are parcels
marked as likely being vacant using the process outlined above, and purple are 
buildings. You can see a number of parcels that are correctly marked as vacant
that would not have been using the naive approach due to small overlaps with
buildings.

There are plenty of land uses that do not require structures that would appear
in the city's buildings shapefile. Parks, farms, and playgrounds come to mind,
but there are certainly others. So the desired outcome of this exercise is
one more **clue** that will help us decide whether a parcel is vacant and worth
mapping. We would not assume that all 27,653 of the lots in the "likely vacant"
map above actually are vacant, but we would first use other indicators such as
blight liens or recent demolitions to help make that decision.
