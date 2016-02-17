# 6. Editing Vector Data

## Editing and creating data

In this section we will cover:
 * Editing data
 * Creating data
 * Advanced Digitizing

### Exercise 6-1: Editing data

 1. Open the [building footprint data](https://data.cityofnewyork.us/Housing-Development/Building-Footprints/tb92-6tj8) in QGIS.
 2. Pick a building to edit. Zoom and pan your map to it.
 3. Enter edit mode:
    1. Ensure the layer you want to edit is selected in the layers panel, and
    2. Find and the edit button in the edit toolbar.
 4. Using the **Move Feature(s)** tool, move the building you want to edit.
 5. Using the **Node Tool**:
    1. Move one or more nodes, and
    2. Add a new node by double-clicking somewhere on one of the edges of the building.
 6. Press the edit button again to exit edit mode and save your file. Until you save you are in danger of losing your edits.
 7. Let's add a ring to a building:
    1. Select a building with the **Select Features** tool
    2. Go to **Edit > Add Ring**
    3. Draw the hole you want to remove from the inside of the building, right-clicking when you're done.

### Exercise 6-2: Creating data

 1. Remove all layers from your **layers panel**.
 2. Add an OpenLayers aerial imagery layer:
    1. Go to **Web > OpenLayers plugin > Google Maps > Google Hybrid**.
    2. If **Web** is not available, open **Plugins > Manage and Install Plugins...**, search for OpenLayers, and enable the plugin.
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

