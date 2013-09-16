---
layout: post
title:  "Using SVG markers with TileMill and CartoCSS"
date:   2013-09-15 20:40:05
categories: nyc maps tilemill
---

Here are some quick directions for adding [SVG]() markers to a map in
[TileMill]().

**Step 1**: Add the base of your map. In this case I am just using the NYC 
borough outlines, but yours will vary depending on what you're mapping.

![Borough outlines](/img/borough-outlines.png)

Here is the [CartoCSS]() for the outlines:

{% highlight css %}
#nybb {
    line-color: black;
    line-width: 19;
    polygon-opacity:0.3;
    polygon-fill:#a1a1a1;
}
{% endhighlight %}

**Step 2**: Now add the points you would like to show on your map. I'm using
[lots from 596 Acres][596], which you can download as GeoJSON or KML, but any 
dataset of points would work:

![596 Markers](/img/borough-outlines-596-markers.png)

The CartoCSS is here, but don't worry about the styling since we'll be changing 
it:

{% highlight css %}
#596acreslots {
    marker-width: 6;
    marker-fill: #4BC341;
    marker-line-color: #4AA339;
    marker-allow-overlap: true;
}
{% endhighlight %}

**Step 3**: Download an SVG, for example from 
[The Noun Project](http://thenounproject.com/). I chose a classy [skull and
crossbones](http://thenounproject.com/noun/skull-and-crossbones/#icon-No13327).
You can use whatever image you want as long as it is an SVG.

**Step 4**: Put the downloaded image in your project's folder. This part is 
slightly complicated. First you have to find this folder by going to TileMill's 
settings, then finding the value of the *Documents* setting under *Application 
Settings*:

![TileMill settings](/img/tilemill-settings.png)

Once you find this folder, open it and find the folder for your project (it will 
have the name of the project). Put the image you downloaded in this folder.

**Step 5**: Refer to the downloaded image in the TileMill style for your markers
using the ``marker-file`` property using the filename that you saved the image
as:

{% highlight css %}
#596acreslots {
  marker-file: url("skull_and_crossbones.svg");
  marker-width: 10;
  marker-allow-overlap: true;
}
{% endhighlight %}

The initial output is slightly disappointing because ``marker-width`` is too
low:

![Lots as SVGs](/img/lots-svgs.png)

The nice part of using SVGs for the markers is that you can make them larger 
without worrying about them getting grainy. So you can make the markers larger
using the ``marker-width`` property, exactly as you would with markers that are
circles. (And the markers can be larger or smaller at different zooms or
according to the properties of the underlying features.)

Here I've just made the markers larger when zoom is at least 12:

![Lots as SVGs, zoomed in more](/img/lots-svgs-zoomed.png)

The CartoCSS for this is:

{% highlight css %}
#596acreslots {
  marker-allow-overlap: true;
  marker-file: url("skull_and_crossbones.svg");
  marker-width: 10;
}
#596acreslots[zoom>=12] {  
  marker-width: 20;
}
{% endhighlight %}


[SVG]: http://en.wikipedia.org/wiki/Svg
[TileMill]: http://www.mapbox.com/tilemill/
[CartoCSS]: http://www.mapbox.com/carto/api/2.1.0/
[596]: http://596acres.org/
