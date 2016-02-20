# 7. Raster Data

## Exercise 7-1: Opening raster data

 1. Open [Land Cover](https://data.cityofnewyork.us/Environment/Landcover-Raster-Data-2010-/9auy-76zt) in QGIS.
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

## Exercise 7-4: Georeferencing images

Let's turn an image with no geodata into a GeoTIFF:

 1. Download an image to georeference:
    1. Find a plate at the [NYPL's public domain digital collection](http://digitalcollections.nypl.org/collections/de1dcfb0-c5f6-012f-1dfc-58d385a7bc34#/?tab=navigation) of an area of the city you will be able to georeference.
    2. Click on the plate, on the new page under **Download options** click on one of the larger sizes (eg **2560px**) and save the file somewhere accessible.
 2. Add the image to QGIS to georeference:
    1. In QGIS, ensure that the **Georeferencer GDAL** plugin is installed and enabled.
    2. Go to **Raster > Georeferencer > Georeferencer**.
    3. Click the **Open Raster** button, find the image you just downloaded it, and open it.
 3. Leave the Georeferencer open but go back to your map canvas. Add a reference layer (**Web > OpenLayers Plugin > ...**. We will use OpenStreetMap, but anything with labels should suffice.
 4. Back in the Georeferencer, add ground control points:
    1. Pan and zoom both the raster and the map canvas to a recognizable landmark such as a street corner.
    2. In the Georeferencer, select the **Add Point** tool.
    3. Click on the landmark you chose in step 1.
    4. The **Enter map coordinates** dialog opens.
    5. Click **From map canvas**.
    6. The Georeferencer disappears. Click the landmark in your map canvas. Keep in mind that the image you downloaded shows property outlines.
    7. Switch back to the Georeferencer and repeat until you have three or four ground control points.
 5. Set your georeferencing settings:
    1. In the Georeferencer, click the **Transformation Settings** button on the toolbar.
    2. Set **Transformation type** to **Thin Plate Spline**. This should suffice unless your image is very distorted.
    3. Set **Output raster** to somewhere accessible.
    4. Set **Target CRS** to **EPSG:3857** as this is the CRS of the reference layer we are using. You can reproject the result later if you need to.
    4. Check **Load in QGIS when done**.
 6. Click **Run** in the Georeferencer toolbar. You should see a progress indicator and your GeoTIFF should appear on your map canvas.
 7. If you are unhappy with the results, you can delete ground control points and repeat the above (steps 4 - 6).

<div style="page-break-after: always;"></div>

