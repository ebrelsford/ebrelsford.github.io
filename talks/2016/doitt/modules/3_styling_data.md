# 3. Styling vector data

QGIS has a very flexible system for styling vector data, both for use while viewing data on your screen and when publishing the data for the public to see in print or on the web. This section gets you started styling data in QGIS.

## Basic styles

### Exercise 3-1: Basic and categorized styles

Layer and style a map of some part of the NYC coastline using the following datasets:

 * [Street Centerlines](https://data.cityofnewyork.us/City-Government/NYC-Street-Centerline-CSCL-/exjm-f27b)
 * [Hydrography](https://data.cityofnewyork.us/Environment/Hydrography/drh3-e2fd)
 * [Hydrography Structures](https://data.cityofnewyork.us/City-Government/DoITT-Hydrography-Structures/53au-zf7x)
 * [Collision data from 2015](https://data.cityofnewyork.us/Public-Safety/NYPD-Motor-Vehicle-Collisions-2015/kref-x3ki)

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
 1. Load the [Collision data from 2015](https://data.cityofnewyork.us/Public-Safety/NYPD-Motor-Vehicle-Collisions-2015/kref-x3ki) if it's not already open.
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
 1. Load the [Collision data from 2015](https://data.cityofnewyork.us/Public-Safety/NYPD-Motor-Vehicle-Collisions-2015/kref-x3ki) if it's not already open.
 2. Double-click the collision data layer and open its **Style** tab.
 3. Use **Single Symbol** rather than **Categorized** or **Graduated**.
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
 1. Load the [Collision data from 2015](https://data.cityofnewyork.us/Public-Safety/NYPD-Motor-Vehicle-Collisions-2015/kref-x3ki) if it's not already open.
 2. Double-click the collision data layer and open its **Style** tab.
 3. Use **Heatmap** rather than **Categorized** or **Graduated**.
 4. Select a color ramp and press **Apply**.
 5. Save your project as **exercise3-4**.

### Exercise 3-5: The heat map plugin

Here we create a heat map by creating a raster of the heat map and styling that.
 1. Load the [Collision data from 2015](https://data.cityofnewyork.us/Public-Safety/NYPD-Motor-Vehicle-Collisions-2015/kref-x3ki) if it's not already open.
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
    4. **Radius**: 2000 layer units. As the layer is in CRS 2263, we know that this is feet.
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
 1. Load one of the projects from the previous exercises.
 2. Go to **Project > Print Composer**.
 3. Use the **Add new map** tool and draw a rectangle for the viewport of the map.
 4. Add a title using the **Add new label** tool.
 5. Add a legend using the **Add new legend** tool. Go back to your project and rename layers as required to make the legend useful. If it doesn't make sense to change names or properties on the project itself, find the **Item properties** tab and edit the legend there.
 6. Add a scale bar and customize it.
 7. Add other accessories as you find necessary.
 8. When you are done, press the **Export as PDF** button and save the PDF somewhere accessible.
 9. If you save this project you can always get back to your print composer under **Project > Print Composers**.

TODO grouping layers / showing and hiding layers by map ("locking")

<div style="page-break-after: always;"></div>

