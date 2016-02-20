# 4. Geoprocessing

In this section we will cover:
 * Basic geoprocessing such as:
   * Clip
   * Buffer
   * Intersect
 * A short introduction to building models and Python scripts

## Basic geoprocessing

### Exercise 4-1

Here we use buffer to get shapes representing the area within 50 feet of a road:
 1. Open the [Roadbed](https://data.cityofnewyork.us/City-Government/Roadbed/xgwd-7vhd) and [Borough Boundaries](https://data.cityofnewyork.us/City-Government/Borough-Boundaries/tqmj-j8zm) data in QGIS.
 2. Ensure that both files are in the same CRS by opening the **Layer Properties** and looking in the **General** tab for both. If they do not match, use **Save As...** to re-project one of the layers.
 3. Using the layers that are in the same CRS, select one borough in the borough boundaries layer.
 4. Let's make our file a bit smaller so it's more manageable by clipping the roadbed layer to the selected borough:
    1. Go to **Vector > Geoprocessing Tools > Clip**.
    2. Set **Input vector layer** to the roadbed layer (the layer you want to clip).
    3. Set **Clip layer** to the borough boundaries layer (the layer you want to clip to).
    4. Check **Use only selected features** to clip only using the borough you selected.
    5. **Browse** for an appropriate place to save the output file and press **OK**.
 5. Now let's buffer the roadbed layer for the borough you selected:
    1. First convert the clipped roadbed layer to CRS 2263. This is necessary to ensure that the units we buffer by are feet. (Use **Save As...**, select the CRS, and do the following operations on the converted file).
    2. Go to **Vector > Geoprocessing Tools > Buffer**.
    3. Set **Input vector layer** to the layer you want to buffer (the one converted to CRS 2263).
    4. Set **Buffer distance** to **50**.
    5. Leave **Dissolve buffer results** unchecked.
    6. Press **OK**.

## Building models

### Exercise 4-2: A simple model

Here we automate some of the work covered in the previous exercise--taking an input vector layer, reprojecting it to CRS 2263, and buffering it by 50 feet:
 1. Go to **Processing > Graphical Modeler**.
 2. Create the model:
    1. Drag a **vector layer** input from the left panel to the right. Set **Parameter name** to **Input**.
    2. Switch to the **Algorithms** tab in the left panel.
    3. Under **Geoalgorithms > Vector > General tools** find **Reproject layer** and drag it over to the right. Change **Target CRS** to **2263** and set the description to **Reproject layer to 2263**.
    4. Under **Geoalgorithms > Vector > Geometry operations** find **Fixed distance buffer** and drag it over to the right. Change **Input layer** to the output from the previous (**'Reprojected' from algorithm 'Reproject layer to 2263'** step) and set the **Distance** to **50**. Then set the **Description** to **Buffer by 50 feet** and **Buffer<OutputVector>** to **Output**. The last is the name we give the output layer.
    5. Above the right pane, set the **Name** to **Buffer by 50 feet** and **Group** to **Common geoprocessing**.
    6. Press the **Save** button and save the model in an appropriate location.
 3. Now let's run the model:
    1. Close the model for the moment and open the [borough boundaries](https://data.cityofnewyork.us/City-Government/Borough-Boundaries/tqmj-j8zm) data in QGIS.
    2. Open the model again by going to **Processing > Graphical Modeler** and opening the file you just saved.
    3. Click the **Run model** button.
    4. Select the appropriate input layer and an appropriate output file location and press **Run**.
    5. Confirm that the output file is a buffered version of the original.
 4. If you're planning on using and sharing the model, you should document it:
    1. Open the model in **Graphical Modeler** if it is closed.
    2. Press the **Edit model help** button.
    3. On the left select items to edit (such as the description of the model) and enter your text on the right.

### Exercise 4-3: Building your own model

With a partner, create a workflow that uses multiple geoprocessing algorithms and create a model for it:
 1. Explore the available geoprocessing algorithms in QGIS available through the GUI. For the most part, these will be under **Vector > Geoprocessing Tools** and **Vector > Geometry Tools**.
 2. Using data of your choosing, create a multi-step geoprocessing workflow given the functions available through the GUI and confirm that the output data is as you expected.
 3. Create a model with **Processing > Graphical Modeler** that performs the same workflow as you created in the previous step, save it, and run it on another file. Confirm that it functions as expected.

### Exercise 4-4: Using the python console

 1. Go to **Plugins > Python Console**.
 2. The **Python Console** should appear at the bottom of the screen.
 3. Type **iface.getActiveLayer().name()** and press **Enter**. The name of the active layer should print in the console.
 4. If you would like to know more about the python interface to QGIS, you can type **help(iface)** in the console and press **Enter**.
 5. Let's do some simple geoprocessing in python:
    1. Enter **import processing** in the terminal and press **Enter**.
    2. Enter **processing.alglist()** in the terminal and press **Enter**. All of the processing algorithm will be printed.
    3. Let's focus on an algorithm we would like to use: enter **processing.alglist('hull')** to see only the algorithms with **hull** in their names.
    4. We'll use the convex hull algorithm. To learn how to use it, enter **processing.alghelp('qgis:convexhull')**. We are told that there are four parameters: **INPUT**, **FIELD** (if we were making multiple convex hulls based on a field), **METHOD**, and **OUTPUT**.
    5. Enter **processing.runalg('qgis:convexhull', <LAYER NAME>, None, 0, <FULL PATH TO OUTPUT FILE>')**, but replace **<LAYER NAME>** with a layer you would like to calculate the convex hull of, and **<FULL PATH TO OUTPUT FILE>** with the path you would like to save to.
    6. Open the folder you saved to and you should have a new shapefile--add that to your layers panel.
    7. Click the **Show editor** button on the python console's toolbar. To the right you should have an editor pane. Enter **import processing** on the first line and your command from step 5 on the second line. Click the **Run script** button to run your script again.

## Resources

 * [A Desktop Analyst's Guide to QGIS, Part 2](http://boundlessgeo.com/2015/07/desktop-analysts-guide-qgis-part-2-beyond-basics/) has some good examples of model / script building
 * [The Graphical Modeler](http://docs.qgis.org/2.0/en/docs/user_manual/processing/modeler.html) in the QGIS documentation.
 * [Automating Complex Workflows using Processing Modeler](http://www.qgistutorials.com/en/docs/processing_graphical_modeler.html) in the QGIS documentation.
 * [QGIS Graphical Modeler Example](https://www.youtube.com/watch?v=6QmA-eZtnog) video
 * [PyQGIS Developer Cookbook](http://docs.qgis.org/testing/en/docs/pyqgis_developer_cookbook/index.html)
 * [Getting Started with PyQGIS](http://www.qgistutorials.com/en/docs/getting_started_with_pyqgis.html)

<div style="page-break-after: always;"></div>

