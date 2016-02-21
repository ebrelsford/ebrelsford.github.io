# An Introduction to QGIS

# 1. What is QGIS?

<div style="width: 25%; margin: 0 auto;">
    <img src="img/qgis.png" alt="QGIS"/>
</div>

[QGIS](http://qgis.org) is an open source GIS (Geographic Information System). In this section we will cover:
* a brief history of QGIS,
* installing QGIS, and
* QGIS and the world of Free and Open Source Software (FOSS) 

## Installing QGIS

While QGIS should already be installed on the machines we are working on, it's worth noting that you can install it on almost any machine for free. So whether you use a Mac or Windows (or even Linux), you can install QGIS on your home computer to do GIS work.

### Installing on Windows

Installing QGIS on a Windows computer is like installing any other piece of software. You download the installer and run it. Download the standalone installer at [download.qgis.org](http://download.qgis.org/).

![Windows QGIS Installer](img/qgis-windows.png)
**The Windows QGIS Installer download page**

### Installing on Mac OS X

Unfortunately, installing QGIS on Mac OS X is slightly more complicated than installing it on a Windows computer. You will need to download and install several packages in the order specified on [KyngChaos](http://www.kyngchaos.com/software/qgis), a popular site that packages open source GIS software for Mac OS X. The packages you need to install are:

* [GDAL](http://www.kyngchaos.com/software/frameworks#gdal_complete) (use the **GDAL Complete** package at the top of this page),
* [NumPy](http://www.kyngchaos.com/software/python) (use the most recent version you can),
* and, finally, [QGIS](http://www.kyngchaos.com/software/qgis) (use the most recent version under **Current**, right now that is 2.12.1-1).

![KyngChaos QGIS Installer](img/kyngchaos.png)
**The Mac OS X QGIS Installer download page**

Rest assured that while the above may sound complicated, you will be successful as long as you download each of the above in order and install them in order. You can always start over if you need to.

## Resources

 * [The QGIS Download page](http://qgis.org/en/site/forusers/download.html)
 * [KyngChaos QGIS OS X installer](http://www.kyngchaos.com/software/qgis)
 * [27 Differences Between ArcGIS and QGIS](http://gisgeography.com/qgis-arcgis-differences/)
 * [QGIS 2.0](https://www.youtube.com/watch?v=sQ8ytFJE_Wk) (This video isn't very high quality, but it contains a version of the history of the project if you're interested.)
 * [The Unknowns: A Manager's Guide to Open Source](https://www.youtube.com/watch?v=jUgiG6eaYtI) (Paul Ramsey's excellent talk about the benefits of open source software.)

<div style="page-break-after: always;"></div>

# 2. Working with vector data

Like any good GIS, QGIS is capable of opening vector data of numerous file types, manipulating that data, and exporting the data. In this section we will get familiar with how QGIS deals with vector data. We will cover:
 * Opening vector data
   * Including data from databases
 * Selecting data
 * Layers
 * The attribute table
 * Expressions
 * Coordinate Reference Systems
 * Managing projects

## Opening vector data

Here we open common types of vector data sources using a number of methods you will run into.

### Exercise 2-1: Open a shapefile

QGIS will open most vector data files in four ways:
 * the **Add Layer** menu
 * the **Browser Panel** 
 * double-clicking the file
 * dragging-and-dropping the file

![Add Vector Layer](img/add-vector-layer.png)
**The Add Layer menu**

In general, QGIS is going to be able to open files that are supported by [OGR](http://gdal.org/1.11/ogr/ogr_formats.html), though this may vary slightly depending on how QGIS was installed.

We recommend adding folders that you commonly use to your favorites in the **browser panel** which should appear on the left side of your QGIS window.

<div style="width: 50%; margin: 0 auto;">
    <img src="img/browser-panel.png" alt="The Browser Panel"/>
</div>

**The Browser Panel**

Let's open a shapefile from NYC Open Data:

 1. Ensure that you have the [Roadbed](https://data.cityofnewyork.us/City-Government/Roadbed/xgwd-7vhd) file on your hard drive.
 2. Open it by going to **Layer > Add Layer > Add Vector Layer** and browsing for it.

Remove the layer from the **Layers Panel** and try opening the file using the other three methods mentioned above (Browser Panel, double-clicking, and drag-and-drop).

### Exercise 2-2: Open a CSV

Here we open a CSV with geographic data in it. When you're opening a CSV with geographic data in its columns, you need to use the **Add Delimited Text Layer** menu. All other methods will ignore the geographic data in the file.

 1. In QGIS go to **Layer > Add Layer > Add Delimited Text Layer**.
 2. Browse for the [Motor Vehicle Collisions 2015](https://data.cityofnewyork.us/Public-Safety/NYPD-Motor-Vehicle-Collisions-2015/kref-x3ki) file and ensure that a valid preview of the file shows up in the bottom of your window, then press **OK**.

![Opening a CSV](img/open-csv.png)
**The Add Delimited Text Layer dialog box**

### Exercise 2-3: Open a WFS layer

Finally, let's load a WFS layer using one of the USGS's public WFS server. The USGS has a set of geologic data sets available [online](https://mrdata.usgs.gov/geology/state/state.php?state=NY), including a WFS version.

 1. Open the [USGS New York geologic map data](https://mrdata.usgs.gov/geology/state/state.php?state=NY) page.
 2. Copy the link to the WFS service, under "OGC WMS".
 3. In QGIS, go to **Layer > Add Layer > Add WFS Layer**.
 4. Create a new connection and paste the WFS link into the URL field.
 5. Select your new connection and press **Connect**.
 6. Select one of the available layers and press **Add**.

![Adding a new WFS connection](img/wfs.png)
**Adding a new WFS connection**

![Adding a WFS layer](img/wfs-add-layer.png)
**Adding a WFS layer**

### Exercise 2-4: Loading database layers

We will connect to a publicly accessible PostGIS database that was set up for this workshop:

 1. Go to **Layers > Add Layer > Add PostGIS Layers**.
 2. Create a new connection:
   * host: qgisworkshop.cwxs47o7ilc1.us-west-2.rds.amazonaws.com
   * database: workshop
   * username and password will be provided to you
   * For the purposes of this workshop I recommend saving the username and password for your convenience.
 3. Connect to your new connection and find the available tables by expanding the **public** schema.
 4. Add one of the tables as a layer by selecting it and clicking **Add**.

![New PostGIS connection](img/new-postgis-connection.png)
**The Create a New PostGIS Connection dialog**

![The Add PostGIS Table dialog](img/add-postgis-table.png)
**The Add PostGIS Table dialog**

## Exporting vector data

### Exercise 2-5: Exporting vector data

Similarly to opening vector data, you can export vector data in many of the supported [OGR vector formats](http://gdal.org/1.11/ogr/ogr_formats.html). In order to export vector data it must first be open as a layer in your **layers panel**. Right-click on the layer and select **Save As**, and you will have access to the **Save vector layer as...** dialog.

Once a vector layer is open in QGIS, it doesn't matter what the original file type of the layer was. So converting from any supported file type (or database table) to any other supported file type works exactly the same way.

![The "Save vector layer as..." dialog](img/save-as.png)
**The "Save vector layer as..." dialog**

 1. Add a layer to your **layers panel** if you don't already have one open. Use one of the layers from the previous exercise.
 2. Right-click on layer in the layers panel.
 3. Select **Save As...**.
 4. Pick a format other than the one the layer was originally in.
 5. Browse to save the file in an appropriate place and press **OK**.

## The Attribute Table

Here we cover common attribute-related tasks:
 * Filtering
 * Selecting
 * Invert selection
 * Move selection to top
 * Query tool
 * Field calculator, adding and converting values

### Exercise 2-6: Filtering and selecting data

 1. Re-open the [Motor Vehicle Collisions 2015](https://data.cityofnewyork.us/Public-Safety/NYPD-Motor-Vehicle-Collisions-2015/kref-x3ki) file in QGIS if it is not open.
 2. With the collisions layer selected in the **layers panel**, find the attribute table icon to open the attribute table. There are two other ways you can do this: right-click the layer and select **Open Attribute Table** or select the layer and go to **Layers > Open Attribute Table**.
 3. With the attribute table open, filter the data:
    1. Click the button at the bottom left that reads **Show All Features**.
    2. Go to **Column Filter > BOROUGH**.
    3. Enter a borough name in all caps (eg *BRONX*).
    4. Press **[Enter]** or the **Apply** button.
 4. The filter only reduces the number of features that appear in the attribute table, not on the map canvas. Let's select features we have filtered to:
    1. Right-click on one of the features in the attribute table.
    2. Select **Select All**.
    3. All of the features in the borough you picked should be highlighted.
 5. Remove your filter:
    1. Click the arrow next to **Advanced Filter (expression)** in the bottom left of the attribute table (where it used to say **Show All Features**).
    2. Select **Show All Features**.
 6. Your selected features are now interspersed with unselected features in the attribute table. If you want all of the selected features to appear together, find the **Move Selection to Top** button and click it.
 7. To the right of the **Move Selection to Top** button is the **Invert Selection** button. Click this to see all the features that did not have the borough you chose in the **BOROUGH** field.
 8. Let's save only the features with our chosen borough:
    1. Press **Invert Selection** again to select only features with your chosen borough in the **BOROUGH** field.
    2. Exit the attribute table by closing it.
    3. Right click on the layer in the **layers panel**.
    4. Select **Save As...**.
    5. Browse for a valid location to save the file to.
    6. Ensure **Save only selected features** is checked.
    7. Press **OK**.
    8. A new layer with just your selected features should be added to your **layers panel**.
 9. Now that we are done filtering and selecting, unselect the features:
    1. Select the original layer in the **layers panel**.
    2. Open the attribute table.
    3. Find the **Unselect All** button to the left of the **Move Selection to Top** button, and click it.

## Expressions

In this section we will use expressions in two ways:
 * Select by expression
 * Field calculator

### Exercise 2-7: Selecting by expression

 1. Re-open the [Motor Vehicle Collisions 2015](https://data.cityofnewyork.us/Public-Safety/NYPD-Motor-Vehicle-Collisions-2015/kref-x3ki) file in QGIS if it is not open.
 2. With the collisions layer selected in the **layers panel**, find and click the **Select by expression** button.
 3. Let's recreate the selection from the previous exercise:
    1. In the middle panel, expand **Fields and Values**.
    2. Double-click **BOROUGH**. This should add **"BOROUGH"** to the text area in the left panel.
    3. Above the left panel, click **=**.
    4. With **BOROUGH** still selected in the middle panel, go to the right panel and press **All unique**.
    5. Double-click one of the resulting borough names. Your left panel should now look something like **"BOROUGH" = 'BRONX'**.
    6. Press **Select**.
 4. Let's select another borough instead:
    1. In the left panel, delete the borough name and the quotation marks around it (eg **'BRONX'**). Leave the cursor after **=**.
    2. In the right panel, double-click a different borough name.
    3. Press **Select**.
 5. Let's add another borough to our selection:
    1. In the left panel, delete the borough name and the quotation marks around it again (eg **'BRONX'**). Leave the cursor after **=**.
    2. In the right panel, double-click a different borough name.
    3. Instead of pressing **Select**, click the arrow next to **Select** and choose **Add to selection**. You should now have crashes in two boroughs selected.
 6. Now select all of the collisions that happened in July:
    1. Delete the previous expression from the left panel.
    2. Expand **Fields and Values** and double-click **DATE**.
    3. Expand **Operators** and double-click **>=**.
    4. After the **>=** in the left panel, type **'07/01/2015'**.
    5. Under **Operators** double-click **AND**.
    6. Under **Fields and Values** double-click **DATE**.
    7. Under **Operators** double-click **<=**.
    8. After the **<=** in the left panel, type **'07/31/2015'**.
    9. Your expression should look like **"DATE" >= '07/01/2015' AND "DATE" <= '07/31/2015'**.
    10. Press **Select**.
 7. Since we know the format of the dates, we can do the same as above by just looking at the first two characters in **DATE**:
    1. Delete the previous expression from the left panel.
    2. Under **String** in the middle panel, double-click **left**, which gets the first *n* characters from the field.
    3. Under **Fields and Values** double-click **DATE**.
    4. In the left panel after **"DATE"**, type **, 2** to specify that we want the first two characters.
    5. Type **)** to close the **left** function.
    6. Type **= '07'** to compare the output of **left** to **07**.
    7. Your expression should look like **left("DATE", 2) = '07'**.
    8. Press **Select**.
    9. Use **Save As...** and save only the selected features. We will be using this in future exercises.

### Exercise 2-8: Using the field calculator

We will add simple columns to a file.
 1. Re-open the [Motor Vehicle Collisions 2015](https://data.cityofnewyork.us/Public-Safety/NYPD-Motor-Vehicle-Collisions-2015/kref-x3ki) file in QGIS if it is not open and select the layer in the **layers panel**.
 2. Find the **Open Field Calculator** button and click it.
 3. Create a new field:
    1. Set **Output field name** to **injuries**.
    2. Leave **Output field type** set to **integer** and **Output field width** set to **10**.
    3. Create an expression that adds **NUMBER OF PEDESTRIANS INJURED**, **NUMBER OF CYCLIST INJURED**, and **NUMBER OF MOTORIST INJURED**.
    4. Press **OK**.
 4. Open the attribute table and confirm that a new field was created named **injuries**.
 5. Confirm that your math was correct by using **Select by expression** to select all features where our new field (**injuries**) is equal to the original field (**NUMBER OF PERSONS INJURED**).

## Coordinate Reference Systems

We will look at three ways of dealing with coordinate reference systems:
 * Project-wide,
 * Setting the layer's projection, and
 * Changing the layer's projection

### Exercise 2-9: Changing a layer's coordinate reference system

 1. Re-open the [Roadbed](https://data.cityofnewyork.us/City-Government/Roadbed/xgwd-7vhd) file in QGIS if it is not open. The layer is currently in **EPSG:4326**. We want the layer to be in **State Plane Long Island** (**EPSG:2263**) to do some geoprocessing with another layer.
 2. Right-click on the layer in the **layers panel**.
 3. Choose **Save As...**.
 4. Select **ESRI Shapefile** for the format.
 5. Click **Browse** and choose a valid location for the shapefile. We recommend ending the filename with **_2263**.
 6. Next to the **CRS** dropdown, click the **Select CRS** button.
 7. In the **Coordinate Reference System Selector** dialog, type **2263** in the **Filter** field to find **NAD83 / New York Long Island (ftUS)**. Click it to select it, then press **OK**.
 8. Press **OK** back in the **Save vector layer as...** dialog.
 9. A new layer with the selected CRS should be added to your **layers panel** in addition to the old layer.

### Exercise 2-10: Correcting a layer's coordinate reference system

Here we intentionally load a layer in the wrong coordinate reference system and fix it:
 1. Open [7 Major Felony Incidents](https://data.cityofnewyork.us/Public-Safety/NYPD-7-Major-Felony-Incidents/hyij-8hr7).
 2. Using the **Add a Delimited Text Layer** dialog, browse for the felonies file.
 3. Confirm that:
    1. **Geometry definition** is set to **Point coordinates**.
    2. **X field** is set to **Xcoordinate**.
    3. **Y field** is set to **Ycoordinate**.
 4. Press **OK**.
 5. If prompted to select a CRS choose **EPSG:4326**. QGIS should default to this.
 6. The file is actually in **State Plane Long Island** (**EPSG:2263**). You can confirm this by opening another layer in NYC and zooming to the layer's extents--they will not overlap correctly.
 7. Let's fix the felonies layer's CRS:
    1. Double-click on the layer in the **layers panel**.
    2. Go to the **General** tab.
    3. Under **Coordinate reference system**, find and click the **Select CRS** button (to the right of the CRS dropdown).
    4. Filter the CRSs by typing **2263** in the **Filter** field. Select the correct CRS and press **OK**.
    5. Press **OK** to apply your changes to the layer's properties.
 8. Once the points redraw, they should now overlap correctly with other NYC data.

## Managing projects

### Exercise 2-11: Handling lost data

 1. Open a layer in QGIS if you do not have any open currently.
 2. Save the project by going to **Project > Save**.
 3. Close QGIS.
 4. Open the project by double-clicking it. Ensure that the project loads as expected.
 5. Close QGIS again.
 6. Move one of the project's data files on your computer to another folder on your computer. For example, if one of the project's layers is a shapefile, move all of the files in that shapefile (or the folder they are in) somewhere else.
 7. Open the project again by double-clicking it.
 8. Use the **Handle bad layers** dialog to fix the data file's location:
    1. Select the layer.
    2. Click **Browse**.
    3. Find the layer on your computer.
    4. Click **OK**.
 9. If this was successful, the project should now open exactly as it was before.

![Save project dialog box](img/save-project.png)
**The Save Project dialog box**

![Handle bad layers](img/handle-bad-layers.png)
**The Handle Bad Layers dialog box**

![Handle bad layers](img/handle-bad-layers-fixed.png)
**The Handle Bad Layers dialog box with the layer's new location set**

## Resources

 * [QGIS: Attribute Tables and Selecting Features](https://www.youtube.com/watch?v=Fm6bjyijamk) (video)
 * [QGIS: Working with Projections](https://www.youtube.com/watch?v=iOhhFIIOb08) (video)

<div style="page-break-after: always;"></div>

# 3. Styling vector data

QGIS has a very flexible system for styling vector data, both for use while viewing data on your screen and when publishing the data for the public to see in print or on the web. This section gets you started styling data in QGIS.

## Basic styles

### Exercise 3-1: Basic and categorized styles

Layer and style a map of some part of the NYC coastline using the following datasets:

 * [Street Centerlines](https://data.cityofnewyork.us/City-Government/NYC-Street-Centerline-CSCL-/exjm-f27b)
 * [Hydrography](https://data.cityofnewyork.us/Environment/Hydrography/drh3-e2fd)
 * [Motor Vehicle Collisions 2015](https://data.cityofnewyork.us/Public-Safety/NYPD-Motor-Vehicle-Collisions-2015/kref-x3ki)

 1. Add each of the above to your **layers panel**. You may replace any of these with other data layers as you choose a long as you have a **point** layer, a **line** layer, and a **polygon** layer.
 2. Style each layer in turn:
    1. Double-click the layer in the **layers panel**.
    2. Select the **Style** tab on the left.
    3. Change the settings for the layer's styles. As you do, experiment with overlaying multiple **symbol layers** and look at the **blending modes**. Explore a bit.
 3. Add labels to the street centerlines:
    1. Double-click the layer in the **layers panel**.
    2. Select the **Labels** tab on the left.
    3. Change the dropdown at the top of the dialog to **Show labels for this layer** and select a column next to **Label with**.
    4. Style the labels as you like.
 3. Let's categorize the collision data by the type of vehicle involved:
    1. Double-click the collision data layer and open its **Style** tab.
    2. Change **Single Symbol** in the top left to **Categorized**.
    3. Use the **Column** dropdown to select **VEHICLE TYPE CODE 1**.
    4. Click **Classify**.
    5. Click **Apply**. This should apply the categorized style while leaving the **Style** tab open.
    6. Change the style for one of the categories by double-clicking on its symbol and use **Apply** to view the changes.
 4. Save your project as **exercise3-1**.

### Exercise 3-2: Graduated styles

Let's undo the categorization and style the collision data based on the number of injuries:
 1. Load the [Motor Vehicle Collisions 2015](https://data.cityofnewyork.us/Public-Safety/NYPD-Motor-Vehicle-Collisions-2015/kref-x3ki) if it's not already open.
 2. Double-click the collision data layer and open its **Style** tab.
 3. Change **Single Symbol** in the top left to **Graduated**.
 4. Use the **Column** dropdown to select **NUMBER OF PERSONS INJURED**.
 4. Click **Classify** and **Apply** to see the results.
 5. Look at the **Histogram** tab in the **Style** dialog:
    1. Click **Load values**.
    2. This gives you an idea of how many features fall into each bin.
 6. You can edit the class boundaries in the **Histogram** tab or the **Classes** tab. Let's change them in the **Classes** tab:
    1. Double-click on the row under **Values** for the first class.
    2. Change **Lower value** to **0** if it's not already and **Upper value** to **0.99** to create a class for collisions with 0 injuries reported.
    3. Double-click on the row under **Legend** for the first class and enter **0**--this is the label the class will receive in the map's legend.
    4. Edit the other classes as you find appropriate and style them.
 7. Save your project as **exercise3-2**.

## Advanced styles using expressions

### Exercise 3-3

Many style attributes in QGIS can be styled using expressions. Let's use this function to make the collision markers larger where more injuries were inflicted:
 1. Load the [Motor Vehicle Collisions 2015](https://data.cityofnewyork.us/Public-Safety/NYPD-Motor-Vehicle-Collisions-2015/kref-x3ki) if it's not already open.
 2. Double-click the collision data layer and open its **Style** tab.
 3. Use **Single Symbol** rather than **Categorized** or **Graduated** styles.
 4. Style the markers as you like.
 5. Next to **Size**, to the right of the input field, click the **Data defined override** button and select **Field type > NUMBER OF PERSONS INJURED**.
 6. Click **Apply** to see the result: the point diameters should vary by the number of injuries.
 7. You might want to adjust the diameter by some factor of the number of injuries. Let's do this:
    1. In the **Style** tab, click the **Data defined override** button and under the **Expression** section select **Edit**.
    2. You can now enter any expression you wish. For example, enter **"NUMBER OF PERSONS INJURED" * 5**, press **OK**, and **Apply** the style.
    3. You can edit this layer by clicking the **Data defined override** button and under the **Expression** section select **Edit** again.
 8. Save your project as **exercise3-3**.

## Heatmaps

There are a few ways to make heat maps in QGIS. Here we cover both:
 * the heat map style and
 * the heat map plugin

### Exercise 3-4: The heat map style

This is the simple way to make heat maps:
 1. Load the [Motor Vehicle Collisions 2015](https://data.cityofnewyork.us/Public-Safety/NYPD-Motor-Vehicle-Collisions-2015/kref-x3ki) if it's not already open.
 2. Double-click the collision data layer and open its **Style** tab.
 3. Use **Heatmap** rather than **Categorized** or **Graduated**.
 4. Select a color ramp and press **Apply**.
 5. Save your project as **exercise3-4**.

### Exercise 3-5: The heat map plugin

Here we create a heat map by creating a raster of the heat map and styling that.
 1. Load the [Motor Vehicle Collisions 2015](https://data.cityofnewyork.us/Public-Safety/NYPD-Motor-Vehicle-Collisions-2015/kref-x3ki) if it's not already open.
 2. Prepare the data. We will work with a smaller dataset here and change the CRS:
    1. Select some subset of the data using an expression (eg **"BOROUGH" = 'BRONX'**). Make it small enough that it's still very dense but has fewer points to work with. Shoot for 20k to 50k points.
    2. Right-click on the layer, select **Save As...**. In the **Save As** dialog, select **2263** for the CRS. Ensure that **Save only selected features** is checked.
 3. Now we ensure that the **Heatmap** plugin is installed and enabled:
    1. Go to **Plugins > Manage and Install Plugins...**.
    2. Search for **heatmap**.
    3. If the checkbox next to **Heatmap** is not checked, check it. This enables it in QGIS.
    4. Exit the **Plugins** dialog.
 4. Go to **Raster > Heatmap > Heatmap** and change the following settings:
    1. **Input point layer**: the collisions layer that we just created.
    2. **Output raster**: a valid location to save to.
    3. **Output format**: GeoTIFF.
    4. **Radius**: 2000 layer units. As the layer is in CRS 2263 we know that this is feet.
 5. Press **OK**.
 6. When the raster layer loads, let's style it:
    1. Double-click the raster layer in the **layers panel**.
    2. Change **Render type** to **Singleband pseudocolor**.
    3. Select a color ramp under **Generate new color map**.
    4. Press **Classify**.
    5. **Apply** the style.
 7. Repeat steps **4 - 6** and experiment with changing the radius and some of the advanced settings.
 8. Save your project as **exercise3-5**.

## Print Composer

### Exercise 3-6

Here we create a PDF of a map using QGIS's built-in Print Composer:
 1. Load one of the multi-layered projects from the previous exercises (eg Exercise 3-1).
 3. Make your first print composer:
    1. Go to **Project > New Print Composer**.
    2. Use the **Add new map** tool and draw a rectangle for the viewport of the map.
    3. Add a title using the **Add new label** tool.
    4. Add a legend using the **Add new legend** tool. Go back to your project and rename layers as required to make the legend useful. If it doesn't make sense to change names or properties on the project itself, find the **Item properties** tab and edit the legend there.
    5. Add a scale bar and customize it.
    6. Add other accessories as you find necessary.
    7. When you are done, press the **Export as PDF** button and save the PDF somewhere accessible.
 4. Make a print composer with an inset map:
    1. In your map canvas, zoom out to the layer's extent (eg, all of NYC).
    2. Go to **Project > New Print Composer**.
    3. Use the **Add new map** tool and draw a rectangle for the viewport of the map. This will be the overview map.
    4. Leaving the print composer open, switch to your map canvas and zoom in to an area you wish to use as an inset.
    5. Go back to the print composer and use the **Add new map** tool to add another map alongside or on top of the overview map. This will be the inset map.
    6. Add a frame around the inset map under **Item properties**.
    7. Add an overview to the overview map: select the overview map, go to **Item properties**, scroll down to **Overviews**, add new one (**+**), and select **Map 1** next to **Map frame**.
    8. Style the overview as you like.
 5. With the print composer you used in the previous step, experiment with locking layers and styles:
    1. Select the inset map and check **Lock layers for map item** under **Item properties**.
    2. With the print composer open, go back to your map canvas and hide the more detailed layers such as streets.
    3. Go back to your print composer and press the **Refresh view** button in the toolbar. The overview map should be refreshed with your map as it looks in your map canvas.

<div style="page-break-after: always;"></div>

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
 4. Let's make our file a bit smaller and more manageable by clipping the roadbed layer to the selected borough:
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


### Exercise 4-2: Overlay and geometry operations

 1. Open two polygon files of your choosing.
 2. Experiment with a few of the functions provided under **Vector > Geoprocessing Tools** and **Vector > Geometry Tools**.

## Building models

### Exercise 4-3: A simple model

Here we automate some of the work covered in the previous exercise--taking an input vector layer, reprojecting it to CRS 2263, and buffering it by 50 feet:
 1. Go to **Processing > Graphical Modeler**.
 2. Create the model:
    1. Drag a **vector layer** input from the left panel to the right. Set **Parameter name** to **Input**.
    2. Switch to the **Algorithms** tab in the left panel.
    3. Under **Geoalgorithms > Vector > General tools** find **Reproject layer** and drag it over to the right. Change **Target CRS** to **2263** and set the description to **Reproject layer to 2263**.
    4. Under **Geoalgorithms > Vector > Geometry operations** find **Fixed distance buffer** and drag it over to the right. Change **Input layer** to the output from the previous (**'Reprojected' from algorithm 'Reproject layer to 2263'** step) and set the **Distance** to **50**. Then set the **Description** to **Buffer by 50 feet** and **Buffer\<OutputVector\>** to **Output**. The last is the name we give the output layer.
    5. Above the right pane, set the **Name** to **Buffer by 50 feet** and **Group** to **Common geoprocessing**.
    6. Press the **Save** button and save the model in an appropriate location.
 3. Now let's run the model:
    1. Close the model for the moment and open the [Borough Boundaries](https://data.cityofnewyork.us/City-Government/Borough-Boundaries/tqmj-j8zm) data in QGIS.
    2. Open the model again by going to **Processing > Graphical Modeler** and opening the file you just saved.
    3. Click the **Run model** button.
    4. Select the appropriate input layer and an appropriate output file location and press **Run**.
    5. Confirm that the output file is a buffered version of the original.
 4. If you're planning on using and sharing the model, you should document it:
    1. Open the model in **Graphical Modeler** if it is closed.
    2. Press the **Edit model help** button.
    3. On the left select items to edit (such as the description of the model) and enter your text on the right.

### Exercise 4-4: Building your own model

With a partner, create a workflow that uses multiple geoprocessing algorithms and create a model for it:
 1. Explore the available geoprocessing algorithms in QGIS available through the GUI. For the most part, these will be under **Vector > Geoprocessing Tools** and **Vector > Geometry Tools**.
 2. Using data of your choosing, create a multi-step geoprocessing workflow given the functions available through the GUI and confirm that the output data is as you expected.
 3. Create a model with **Processing > Graphical Modeler** that performs the same workflow as you created in the previous step, save it, and run it on another file. Confirm that it functions as expected.

### Exercise 4-5: Using the python console

 1. Go to **Plugins > Python Console**.
 2. The **Python Console** should appear at the bottom of the screen.
 3. Type **iface.getActiveLayer().name()** and press **Enter**. The name of the active layer should print in the console.
 4. If you would like to know more about the python interface to QGIS, you can type **help(iface)** in the console and press **Enter**.
 5. Let's do some simple geoprocessing in python:
    1. Enter **import processing** in the terminal and press **Enter**.
    2. Enter **processing.alglist()** in the terminal and press **Enter**. All of the processing algorithm will be printed.
    3. Let's focus on an algorithm we would like to use: enter **processing.alglist('hull')** to see only the algorithms with **hull** in their names.
    4. We'll use the convex hull algorithm. To learn how to use it, enter **processing.alghelp('qgis:convexhull')**. We are told that there are four parameters: **INPUT**, **FIELD** (if we were making multiple convex hulls based on a field), **METHOD**, and **OUTPUT**.
    5. Enter **processing.runalg('qgis:convexhull', \<LAYER NAME\>, None, 0, \<FULL PATH TO OUTPUT FILE\>)**, but replace **\<LAYER NAME\>** with a layer you would like to calculate the convex hull of, and **\<FULL PATH TO OUTPUT FILE\>** with the path you would like to save to.
    6. Open the folder you saved to and you should have a new shapefile--add that to your layers panel.
 6. Let's save our command to a script:
    1. Click the **Show editor** button on the python console's toolbar. To the right you should now have an editor pane.
    2. Enter **import processing** on the first line and your final command from step 5 on the second line.
    3. Click the **Run script** button to run your script again.
    4. Save the script somewhere accessible.

## Resources

 * [A Desktop Analyst's Guide to QGIS, Part 2](http://boundlessgeo.com/2015/07/desktop-analysts-guide-qgis-part-2-beyond-basics/) has some good examples of model / script building
 * [The Graphical Modeler](http://docs.qgis.org/2.0/en/docs/user_manual/processing/modeler.html) in the QGIS documentation.
 * [Automating Complex Workflows using Processing Modeler](http://www.qgistutorials.com/en/docs/processing_graphical_modeler.html) in the QGIS documentation.
 * [QGIS Graphical Modeler Example](https://www.youtube.com/watch?v=6QmA-eZtnog) video
 * [PyQGIS Developer Cookbook](http://docs.qgis.org/testing/en/docs/pyqgis_developer_cookbook/index.html)
 * [Getting Started with PyQGIS](http://www.qgistutorials.com/en/docs/getting_started_with_pyqgis.html)

<div style="page-break-after: always;"></div>

# 5. Combining Vector Data

This section covers methods for combining data that is stored across multiple vector layers, including:
 * Attribute joins
 * Spatial joins
   * Selecting by location
   * Counting by location

## Attribute joins

Here we combine data across layers based on a field that overlaps.

### Exercise 5-1

 1. Open [Building Footprints](https://data.cityofnewyork.us/Housing-Development/Building-Footprints/tb92-6tj8) in QGIS and reduce the number of buildings we're working with:
    1. Select only the building footprints in Manhattan. You should be able to do so with **Select by expression** and an expression like **left("BBL", 1) = '1'**.
    2. **Save As...** and save only the selected features.
    3. Then close the original building footprints file.
 2. Open [Buildings Subject to HPD Jurisdiction](https://data.cityofnewyork.us/Housing-Development/Buildings-Subject-to-HPD-Jurisdiction/kj4p-ruqc) in QGIS without using the **Add Delimited Text Layer** functionality. You can simply drag-and-drop the file into the **layers panel** since it does not have any geographic data within it.
 3. Add a join:
    1. Open the **Layer Properties** for the Manhattan building footprints layer.
    2. Select the **Joins** tab on the left.
    3. Click the **+** to add a new join.
    4. Set **Join layer** to the HPD buildings layer.
    5. Set **Join field** and **Target field** to **BIN**.
 4. Select only the features that joined:
    1. Use **Select by expression**.
    2. Write an expression that selects features where one of the joined columns (from the HPD Buildings file) is not null, eg **"Buildings_Subject_to_HPD_Jurisdiction_BuildingID" is not null**.
    3. Confirm that some buildings are selected.
    4. Open the attribute table and examine the columns that were joined from the HPD Building file (these will be all the way to the right).
 5. Edit the join to select only the columns you want:
    1. Go back to **Joins** in the **layer properties** for the Manhattan building footprints layer.
    2. Select the join you created.
    3. Click the **Edit** button.
    4. Check **Choose which fields are joined** and check only the fields you would like to bring over from the HPD Buildings file. This is helpful since many of the fields are redundant.
    5. Check **Custom field name prefix** and replace the current text in the field with **HPD**. This will make the field names more manageable.
 6. Use **Save As...** to save only the features that joined.
 7. Confirm that the new file has the columns from the HPD Buildings file that you selected.

### Exercise 5-2

Perform another attribute join between two other layers:

 1. Open [MapPLUTO for Queens](http://www1.nyc.gov/site/planning/data-maps/open-data/dwn-pluto-mappluto.page#mappluto) and [Oil Boilers](https://data.cityofnewyork.us/Housing-Development/Oil-Boilers-Detailed-Fuel-Consumption-and-Building/jfzu-yy6n).
 2. Join the two layers by **BBL**.
 3. Select only the matching parcels in MapPLUTO and save them to a new file.

## Spatial joins

### Exercise 5-3: Selecting by location

 1. Open [City Council Districts](https://data.cityofnewyork.us/City-Government/City-Council-Districts/yusd-j4xi) and the HPD buildings in Manhattan as created in Exercise 5-1.
 2. Confirm that the layers are in the same CRS or use **Save As...** on one of the layers to make them match.
 3. Select one city council district in Manhattan.
 4. Go to **Vector > Research Tools > Select by Location**:
    1. Select the appropriate layers for **Select features in** (the buildings layer) and **that intersect features in** (the city council districts layer).
    2. Check **Only selected features** to only select buildings in the selected city council district.
    3. Press **OK**.
    4. Only the buildings in the city council district you selected should be selected.

### Exercise 5-4: Points in Polygon

 1. Open [City Council Districts](https://data.cityofnewyork.us/City-Government/City-Council-Districts/yusd-j4xi) and vehicle collisions in July 2015 as created in Exercise 2-6.
 2. Confirm that the layers are in the same CRS or use **Save As...** on one of the layers to make them match.
 3. Go to **Vector > Analysis Tools > Points in Polygon**:
    1. Select the appropriate layers for **Input polygon vector layer** (city council districts) and **Input point vector layer** (collisions in July 2015).
    2. Choose an appropriate location to save the output shapefile.
 4. Create a choropleth with the resulting layer (using the **Graduated** style with **Column** set to **PNTCNT**).
 5. Choropleths by count are generally a bad idea, so let's make a choropleth by density instead:
    1. Open the **Style** tab for the layer.
    2. Next to the **Column** dropdown press the **Expression** button.
    3. The expression should currently be the field name (**PNTCNT**). Let's divide it by the area by adding **/ $area** after. The result should be **PNTCNT / $area**.
    4. Press **OK** to exit the **Expression** dialog.
    5. Press **Classify** to re-classify the layer after changing the column or expression.
    6. Apply the style.
    7. If council districts are missing, you may need to change the boundaries of the classes (make the first's **Lower value** smaller, the last's **Upper value** higher). This happens sometimes when using expressions. I recommend using this method to experiment with expressions and styles, then use the **Field Calculator** to add a column with the expression you choose and style based on that column (as you will in the next step).
 6. Add a column with the density expression to the layer using the **Field Calculator** and style the layer using your new column.

### Exercise 5-5: Points in Polygon

 1. Open [City Council Districts](https://data.cityofnewyork.us/City-Government/City-Council-Districts/yusd-j4xi) and Airbnb Listings.
 2. Confirm that the layers are in the same CRS or use **Save As...** on one of the layers to make them match.
 3. Perform a **Points in Polygon** analysis and find the mean price in each council district as you do.
 4. Visualize the data however you like.

### Exercise 5-6: Join attributes by location

 1. Open Buildings Subject to HPD Jurisdiction in Manhattan (from Exercise 5-1) and [City Council Districts](https://data.cityofnewyork.us/City-Government/City-Council-Districts/yusd-j4xi).
 2. Confirm that the layers are in the same CRS or use **Save As...** on one of the layers to make them match.
 3. Go to **Vector > Data Management Tools > Join Attributes by Location**:
    1. Select the appropriate layers for **Target vector layer** (city council districts) and **Join vector layer** (HPD buildings in Manhattan).
    2. Select **Take summary of intersecting features**.
    3. Select **Mean** and select **Sum**.
    4. Choose an appropriate location to save the output shapefile.
    5. Press **OK**.
    6. This may take a minute or two. When QGIS is done it will ask you if you want to add the new layer to your TOC (**layers panel**). Do so.
    7. Confirm that the resulting layer includes the mean and sum of each numeric field in the buildings file.
 4. Create a choropleth using one of the fields in the new layer.

### Exercise 5-7: Join attributes by location

 1. Open Buildings Subject to HPD Jurisdiction in Manhattan (from Exercise 5-1) and [City Council Districts](https://data.cityofnewyork.us/City-Government/City-Council-Districts/yusd-j4xi) again if you closed them.
 2. **Join Attributes by location** again, but this time in the other direction: to each building add its city council district's data.

<div style="page-break-after: always;"></div>

# 6. Editing Vector Data

## Editing and creating data

In this section we will cover:
 * Editing data
 * Creating data
 * Advanced Digitizing

### Exercise 6-1: Editing data

 1. Open the [Building Footprints](https://data.cityofnewyork.us/Housing-Development/Building-Footprints/tb92-6tj8) in QGIS.
 2. Pick a building to edit. Zoom and pan your map to it.
 3. Enter edit mode:
    1. Ensure the layer you want to edit is selected in the layers panel.
    2. Find and press the edit button in the edit toolbar.
 4. Using the **Move Feature(s)** tool, move the building you want to edit.
 5. Using the **Node Tool**:
    1. Move one or more nodes, and
    2. Add a new node by double-clicking somewhere on one of the edges of the building.
 6. Let's add a ring to a building:
    1. Select a building with the **Select Features** tool
    2. Go to **Edit > Add Ring**
    3. Draw the hole you want to remove from the inside of the building, right-clicking when you're done.
 7. Experiment with other editing tools.
 8. Press the edit button again to exit edit mode and save your file. Until you save you are in danger of losing your edits.

### Exercise 6-2: Creating data

 1. Remove all layers from your **layers panel**.
 2. Add an OpenLayers aerial imagery layer:
    1. Go to **Web > OpenLayers plugin > Bing Maps > Bing Aerial with labels**.
    2. If **OpenLayers** is not available, open **Plugins > Manage and Install Plugins...**, search for OpenLayers, and enable the plugin.
 3. Create a new polygon shapefile:
    1. Go to **Layer > Create Layer > New Shapefile Layer**.
    2. Set **Type** to **Polygon**.
    3. Select the location in which you would like to save the shapefile.
 3. Trace some buildings:
    1. With your new shapefile selected in the **layers panel**, enter edit mode.
    2. Zoom and pan to the area you would like to trace buildings in. As the imagery is being loaded from the internet this can be relatively slow, and when you zoom in too far the layer will disappear. You should be able to zoom to (or manually set) **Scale** **1:2,500**.
    3. Select the **Add Feature** tool.
    4. Click to create the first node of your building.
    5. Each click creates a new node. Add nodes at each corner of the building.
    6. Once you are happy with your shape, right-click anywhere (a new node is **not** created when you do this).
    7. Repeat this process to create a few more buildings.
 4. Leave your new layer open and in edit mode for the next exercise.

### Exercise 6-3: Advanced Digitizing

 1. Open your new shapefile if it is not open.
 2. Enable edit mode.
 3. Enable Advanced Digitizing:
    1. Go to **View > Panels > Advanced Digitizing Panel**.
    2. The Advanced Digitizing Panel should appear on the left. Press the **Enable advanced digitizing tools** button.
 4. Now trace a few more buildings:
    1. Select the **Add Feature** tool.
    2. Place your first two points.
    3. As you place your third point, **Advanced Digitizing** shows you the angle you are creating (in the panel next to **a**) and snaps to 90 degrees.
    4. You can also set the angle manually by typing **a** and entering the angle you want (eg **45**) and pressing **Enter**.
    5. **Advanced Digitizing** also shows you the distance of the line you are creating, and you can set it manually by typing **d**, entering the distance you want, and pressing **Enter**.
    6. Experiment with **Advanced Digitizing** and create a few more buildings.

## Resources

 * [Advanced Digitizing panel video on Youtube](https://www.youtube.com/watch?v=QsjmLa16obs)

<div style="page-break-after: always;"></div>

# 7. Raster Data

## Exercise 7-1: Opening raster data

 1. Open [Land Cover](https://data.cityofnewyork.us/Environment/Landcover-Raster-Data-2010-/9auy-76zt) in QGIS. You should be able to do so as you have with vector data (double-click and drag-and-drop), and if you want to do it through a menu go to **Layer > Add Layer > Add Raster Layer**.
 2. Let's make the file a bit more manageable:
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
    2. Click on the plate.
    3. On the new page under **Download options** click on one of the larger sizes (eg **2560px**) and save the file somewhere accessible.
 2. Add the image to QGIS to georeference:
    1. In QGIS, ensure that the **Georeferencer GDAL** plugin is installed and enabled.
    2. Go to **Raster > Georeferencer > Georeferencer**.
    3. Click the **Open Raster** button, find the image you just downloaded it, and open it.
 3. Leave the Georeferencer open but go back to your map canvas. Add a reference layer (**Web > OpenLayers Plugin > ...**). We will use OpenStreetMap, but anything with labels should suffice.
 4. Back in the Georeferencer, add ground control points:
    1. Pan and zoom both the raster and the map canvas to a recognizable landmark such as a street corner.
    2. In the Georeferencer, select the **Add Point** tool.
    3. Click on the landmark you chose.
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
 7. If you are unhappy with the results, delete ground control points and repeat the above (steps 4 - 6).

<div style="page-break-after: always;"></div>

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
 3. Zoom in to some smaller portion of the layer (eg 5 x 5 blocks).
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
    5. Under your buildings layer, ensure that **Mode** is set to **Relative to DEM**.
    6. Press **Run**.
 7. Save your qgis2threejs visualization to an HTML file--this is a file that could be shared online.

## Exercise 8-2: qgis2leaf

Similarly to qgis2threejs, qgis2leaf creates a visualization of your data that is accessible from a web browser. qgis2leaf will only work with 2D visualizations, however.

 1. Clear any existing layers from your **layers panel**.
 2. Open one borough's buildings (from Exercise 5-1).
 3. Zoom in to some smaller portion of the layer (eg 5 x 5 blocks) and **select** some of the buildings with the rectangle tool.
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
    2. Click **New**.
    4. Enter your username and **API Key**. In CartoDB, click on your account and go to **Your API Keys** to find your key.
    5. Click **Connect**.
 4. Add data to CartoDB:
    1. Open a relatively small layer in your **layers panel**. Buildings for one borough should be okay. 
    2. Go to **Web > CartoDB plugin > Upload layers to CartoDB**.
    3. Select your layer and click **Upload**.
    4. Go back to your CartoDB account and confirm that your data is in CartoDB under **Datasets**.
 5. Add a map to CartoDB:
    1. If the data you uploaded to CartoDB was not added to you **layers panel**, do that now (**Web > CartoDB plugin > Add CartoDB Layer**).
    2. Style the layer however you like.
    3. Go to **Web > CartoDB plugin > Create New Map**.
    4. Give the map a **Name** and **Description** as you see fit.
    5. Press **Create**.
    6. Confirm that the map was created in CartoDB, styles and all, in your account under **Maps**.

## Exercise 8-4: TimeManager

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

# 9. Moving forward with QGIS

This has been a very quick introduction to QGIS and hopefully you're feeling relatively comfortable with it now. As with learning anything new, there will surely be times that you need help with QGIS. Luckily there are resources online and offline that should keep you on track.

## Asking questions online

By far the most popular way to ask questions about QGIS online is [GIS Stack Exchange](http://gis.stackexchange.com/). The site lets you post a question, and others will attempt to answer your question. Everyone gets to vote on how helpful each response is, so good answers tend to bubble up to the top. You should search the site first before posting a new question.

## Asking questions in person

There is a chapter of the popular [Maptime meetup](http://maptime.io/) in New York, [Maptime NYC](http://www.meetup.com/maptime-nyc/). It's a friendly place to meet other people who work on map-related things, and many participants know their way around QGIS.

## Online resources

The [QGIS User Guide](http://docs.qgis.org/2.8/en/docs/user_manual/) is online and free.

I have posted many QGIS videos on [Youtube](https://www.youtube.com/channel/UCsmBq4ziqRgBZSJK8sGF0Fg) that might help you out if you're looking for visual, step-by-step directions.

## Books

Here are a few books about QGIS I would recommend:

[Learning QGIS](https://www.packtpub.com/application-development/learning-qgis-second-edition) is a basic introduction to QGIS for those looking to reinforce the topics covered in this workshop.

[Mastering QGIS](https://www.packtpub.com/application-development/mastering-qgis) is an excellent book for those who are comfortable with QGIS but looking for a guide to deeper topics such as the processing toolbox and writing scripts (including plugins).

It's not out yet, but I'm looking forward to [QGIS Map Design](http://locatepress.com/qmd).

## Blogs

If you want to stay on top of QGIS development as it happens, there are some people who blog regularly about QGIS. [QGIS Planet](http://plugins.qgis.org/planet/) aggregates these blogs, but here are a few of my favorites:

 * [Anita Graser](http://anitagraser.com/)
 * [Nyall Dawson](http://nyalldawson.net/)
 * [Nathan Woodrow](http://nathanw.net/)
***

Written by [Eric Brelsford](http://ebrelsford.github.io).

![Creative Commons License](https://i.creativecommons.org/l/by-sa/4.0/88x31.png)
This work is licensed under a [Creative Commons Attribution-ShareAlike 4.0 International License](http://creativecommons.org/licenses/by-sa/4.0/).
