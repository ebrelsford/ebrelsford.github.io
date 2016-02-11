# 7. Raster Data

## Opening raster data

### Exercise 7-1

* Download and unzip this [landcover data](https://data.cityofnewyork.us/Environment/Landcover-Raster-Data-2010-/9auy-76zt).
* In QGIS, open the data. You should be able to do so as you have with vector data (double-click and drag-and-drop), and if you want to do it through a menu go to **Layer > Add Layer > Add Raster Layer**.
* Let's make the file a bit more manageable:
  * Zoom and pan your map to a section of the city you'd like to work with.
  * Go to **Raster > Extraction > Clipper**.
  * With the Clipper dialog open, click and drag on the map to draw a rectangle of the area you would like to clip to.
  * Browse to select a proper location to save the resulting file to and press **OK**.

## Raster calculator

### Exercise 7-2

* Open the clipped file from Exercise 7-1 if you closed it.
* Select a value you would like to extract. If you're not sure which you'd like to use, expand the layer in your **Layers Panel** and find the number associated with a color you would like to isolate.
* Go to **Raster > Raster calculator**.
* Browse to select a place to save your output file.
* Double-click on the clipped layer in the **Raster bands** area.
* In the expression field, add an equals sign (**=**) and the number you picked. You should have an expression like **"clipped@1"=5**.
* Press **OK** and you should have a new layer that is black and white.

## Vectorizing raster data

Now we will turn the features we selected from the raster into vectors.

* Open the clipped and reduced file from Exercise 7-2 if you closed it.
* Go to **Raster > Conversion > Polygonize**.
* Select the clipped layer for the **Input file**.
* Browse to select a proper location for your shapefile and press **OK**.

<div style="page-break-after: always;"></div>

