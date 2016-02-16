# 7. Raster Data

## Exercise 7-1: Opening raster data

 1. Download and unzip this [landcover data](https://data.cityofnewyork.us/Environment/Landcover-Raster-Data-2010-/9auy-76zt).
 2. In QGIS, open the data. You should be able to do so as you have with vector data (double-click and drag-and-drop), and if you want to do it through a menu go to **Layer > Add Layer > Add Raster Layer**.
 3. Let's make the file a bit more manageable:
    1. Zoom and pan your map to a section of the city you'd like to work with.
    2. Go to **Raster > Extraction > Clipper**.
    3. With the Clipper dialog open, click and drag on the map to draw a rectangle of the area you would like to clip to.
    4. Browse to select a proper location to save the resulting file to and press **OK**.

## Exercise 7-2: The raster calculator

 1. Open the clipped file from Exercise 7-1 if you closed it.
 2. Select a value you would like to extract. If you're not sure which you'd like to use, expand the layer in your **Layers Panel** and find the number associated with a color you would like to isolate.
 3. Go to **Raster > Raster calculator**.
 4. Browse to select a place to save your output file.
 5. Double-click on the clipped layer in the **Raster bands** area.
 6. In the expression field, add an equals sign (**=**) and the number you picked. You should have an expression like **"clipped@1"=5**.
 7. Press **OK** and you should have a new layer that is black and white.

## Exercise 7-3: Vectorizing raster data

Now we will turn the features we selected from the raster into vectors.

 1. Open the clipped and reduced file from Exercise 7-2 if you closed it.
 2. Go to **Raster > Conversion > Polygonize**.
 3. Select the clipped layer for the **Input file**.
 4. Browse to select a proper location for your shapefile and press **OK**.

<div style="page-break-after: always;"></div>

