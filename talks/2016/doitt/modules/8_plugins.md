# 8. Plugins

QGIS's plugin ecosystem is open and relatively large. In this section we will cover some of the following plugins:
 * GeoServer Explorer
 * OpenLayers
 * OSMDownloader
 * CartoDB
 * qgis2threejs
 * qgis2leaf
 * TimeManager

## Exercise 8-1: qgis2threejs

qgis2threejs creates a 3D visualization of your data that is accessible from a web browser. This can be useful because you can then host the visualization online and people can view and interact with the visualization without having QGIS installed.

 1. Clear any existing layers from your **layers panel**.
 2. Open [Building Footprints](https://data.cityofnewyork.us/Housing-Development/Building-Footprints/tb92-6tj8).
 3. Zoom in to some smaller portion of the layer (eg 10 x 10 blocks).
 4. Make a 3D map with all buildings the same height:
    1. Go to **Web > Qgis2threejs > Qgis2threejs**.
    2. Under **Polygon**, check the checkbox next to your buildings layer.
    3. Don't change anything else, the defaults will do for now.
    4. Press **Run**.
    5. A browser window should open with your 3D visualization running.
    6. You can rotate the map by clicking and dragging, zoom by scrolling.
 5. Make the buildings have heights based on the number of floors in each:
    1. Go to **Web > Qgis2threejs > Qgis2threejs**.
    2. Under **Polygon**, check the checkbox next to your buildings layer.
    3. Set **Height** to **NUM_FLOORS** and **Mulitplier** to **6**.
    4. Press **Run**.
 6. Add a point layer to your **layers panel** and experiment with it in qgis2threejs.
 7. Add a DEM to your visualization:
    1. Open NYC DEM Uptown (an excerpt of [NYC DEM](https://data.cityofnewyork.us/City-Government/1-foot-Digital-Elevation-Model-DEM-/dpc8-z3jc)) in QGIS along with your other layers.
    2. Add an aerial layer using **Web > OpenLayers plugin** and move the aerial layer so that it is above the DEM but below your vector layers.
    3. Go to **Web > Qgis2threejs > Qgis2threejs**.
    4. Ensure the DEM you added is selected as the **DEM Layer**.
    5. In the options for your buildings layer, ensure that **Mode** is set to **Relative to DEM**.
    6. Press **Run**.
 7. Save your qgis2threejs visualization to an HTML file--this is a file that could be shared online.

## Exercise 8-2: qgis2leaf

Similarly to qgis2threejs, qgis2leaf creates a visualization of your data that is accessible from a web browser. qgis2leaf will only work with 2D visualizations, however.

 1. Clear any existing layers from your **layers panel**.
 2. Open one borough's buildings (from Exercise 5-1).
 3. Zoom in to some smaller portion of the layer (eg 10 x 10 blocks) and **select** some of the buildings with the rectangle tool.
 4. Make the web map:
    1. Go to **Web > qgis2leaf > Exports a QGIS project...**.
    2. Click **Get Layers** and select your buildings layer.
    3. Check **Export selected only** as making a web map with all of the buildings in a borough is going to be slow--we are making the map with just the selected ones.
    4. For **Basemaps** select **Stamen Toner**.
    5. Give the map a **name**, **title**, and **subtitle**.
    6. Press **OK**.
    7. The map should appear in your browser. Interact with the map in your browser. Click on some of the buildings.
 5. Save the web map:
    1. Go to **Web > qgis2leaf > Exports a QGIS project...**.
    2. Leave all the settings as they were in the previous step.
    3. Change **Output project folder** to a folder you have access to.
    4. Press **OK**.
    5. Find the folder--this is the file that you would share online.

## Exercise 8-3: GeoServer Explorer

Boundless released the **GeoServer Explorer** plugin [a few months ago](http://boundlessgeo.com/2015/12/announcing-the-new-geoserver-qgis-plugin/) to replace the OpenGeo Suite plugin. Here we'll connect to an example catalog and load some data from it.

 1. Ensure that the GeoServer Explorer plugin is installed.
 2. Go to **Web > GeoServer > GeoServer Explorer**.
 3. Add an example GeoServer catalog:
    1. Right-click on **Catalogs** in the **GeoServer Explorer** panel.
    2. Give the catalog a name (eg **Eric's GeoServer**).
    3. Set **URL** to the url provided to you.
    4. Set **User name** to **admin** and **Password** to **geoserver**.
    5. Press **OK**.
    6. In a moment the new catalog should appear. Please note that this is an example catalog that will not be accessible after this workshop.
 4. Add a layer from the GeoServer catalog:
    1. Expand the catalog you added and look under **Layers**.
    2. Pick a layer, right-click on it, and select **Add to current QGIS project**.

## Exercise 8-4: CartoDB

CartoDB is another handy way to share maps and map data online. This plugin allows you to upload and download data layers to a CartoDB account.

 1. Ensure the CartoDB plugin is installed.
 2. Create a [free CartoDB account](https://cartodb.com/signup) if you do not have one.
 3. Add the CartoDB account to QGIS:
    1. Find the **Add Connection** button in your toolbars and click it.
    2. Click **New**.
    3. Enter your username and **API Key**. In CartoDB, click on your account and go to **Your API Keys** to find your key.
    4. Click **Connect**.
 4. Add data to CartoDB:
    1. Open a relatively small layer in your **layers panel**. Buildings for one borough should be okay. 
    2. Go to **Web > CartoDB plugin > Upload layers to CartoDB**.
    3. Select your layer and click **Upload**.
    4. Go back to your CartoDB account and confirm that your data is in CartoDB under **Datasets**.
 5. Add a map to CartoDB:
    1. If the data you uploaded to CartoDB was not added to your **layers panel**, do that now (**Web > CartoDB plugin > Add CartoDB Layer**).
    2. Style the layer however you like.
    3. Go to **Web > CartoDB plugin > Create New Map**.
    4. Give the map a **Name** and **Description** as you see fit.
    5. Press **Create**.
    6. Confirm that the map was created in CartoDB, styles and all, in your account under **Maps**.

## Exercise 8-5: TimeManager

[TimeManager](https://github.com/anitagraser/TimeManager) can animate your map data by date and time, providing that you give it a proper date field. Let's try this with the building data.

 1. Ensure the TimeManager plugin is installed.
 2. Add the Building Footprints file for one borough to your **layers panel**.
 3. Let's create a proper date field for the year each building was built:
    1. Enter edit mode on the buildings layer.
    2. Using the **Field calculator** add a new **date** field.
    3. The expression you use should be something like **concat("CNSTRCT_YR", '-01-01')**, which should give you dates such as **1760-01-01**.
    4. Add the column and exit edit mode, saving your changes.
 4. Enable the **TimeManager** panel by going to **Plugins > TimeManager > Toggle visibility**.
 5. In the **TimeManager** panel, enter these **Settings**:
    1. **Add Layer** with your building layer.
    2. Select your layer.
    3. Select the field you just created for **Start Time**.
    4. Press **OK**, then scroll to the right and check **Accumulate Features** for the layer.
    5. Press **OK** to exit the settings dialog.
 6. Change **Time frame size** to **5 years**.
 7. Press the **Play** button, and the buildings should fill in as they are built.

## Resources

 * [qgis2threejs video](https://www.youtube.com/watch?v=edPiNvZJScM)
 * [qgis2threejs documentation](http://qgis2threejs.readthedocs.org/en/docs-release/)
 * [GeoServer plugin documentation](http://boundlessgeo.github.io/qgis-geoserver-plugin/)

<div style="page-break-after: always;"></div>

