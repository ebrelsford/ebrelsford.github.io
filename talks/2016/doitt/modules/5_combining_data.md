# 5. Combining Vector Data

This section covers methods for combining data that is stored across multiple vector layers, including:
 * Attribute joins
 * Spatial joins
   * Selecting by location
   * Counting by location

## Attribute joins

Here we combine data across layers based on a field that overlaps.

### Exercise 5-1

 1. Open [building footprints](https://data.cityofnewyork.us/Housing-Development/Building-Footprints/tb92-6tj8) in QGIS and reduce the number of buildings we're working with:
    1. Select only the building footprints in Manhattan and save as a new layer, which you should be able to do in **Select by expression** with an expression like **left("BBL", 1) = '1'**.
    2. **Save As...** and save only the selected features.
    3. Then close the original building footprints file.
 2. Open [HPD buildings](https://data.cityofnewyork.us/Housing-Development/Buildings-Subject-to-HPD-Jurisdiction/kj4p-ruqc) in QGIS without using the **Add Delimited Text Layer** functionality. You can simply drag-and-drop the file into the **layers panel** since it does not have any geographic data within it.
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

## Spatial joins

### Exercise 5-2: Selecting by location

 1. Open [city council districts](https://data.cityofnewyork.us/City-Government/City-Council-Districts/yusd-j4xi) and the HPD buildings in Manhattan as created in the previous exercise.
 2. Confirm that the layers are in the same CRS or use **Save As...** on one of the layers to make them match.
 3. Select one city council district.
 4. Go to **Vector > Research Tools > Select by Location**:
    1. Select the appropriate layers for **Select features in** (the buildings layer) and **that intersect features in** (the city council districts layer).
    2. Check **Only selected features** to only select buildings in the selected city council district.
    3. Press **OK**.
    4. Only the buildings in the city council district you selected should be selected.

### Exercise 5-3: Points in Polygon

 1. Open [city council districts](https://data.cityofnewyork.us/City-Government/City-Council-Districts/yusd-j4xi) and collisions in July 2015 as created in Exercise 2-6.
 2. Confirm that the layers are in the same CRS or use **Save As...** on one of the layers to make them match.
 3. Go to **Vector > Analysis Tools > Points in Polygon**:
    1. Select the appropriate layers for **Input polygon vector layer** (city council districts) and **Input point vector layer** (collisions in July 2015).
    2. Choose an appropriate location to save the output shapefile.
 4. Create a choropleth with the resulting layer (using the **Graduated** style with **Column** set to **PNTCNT**.
 5. Choropleths by count are generally a bad idea, so let's make a choropleth by density instead:
    1. Open the **Style** tab for the layer.
    2. Next to the **Column** dropdown press the **Expression** button.
    3. The expression should currently be the field name (**PNTCNT**). Let's divide it by the area by adding **/ $area** after. The result should be **PNTCNT / $area**.
    4. Press **OK** to exit the **Expression** dialog.
    5. Press **Classify** to re-classify the layer after changing the column or expression.
    6. Apply the style.
    7. If council districts are missing, you may need to change the boundaries of the classes (make the first's **Lower value** smaller, the last's **Upper value** higher). This happens sometimes when using expressions. I recommend using this method to experiment with expressions and styles, then use the **Field Calculator** to add a column with the expression you choose and style based on that column.

### Exercise 5-4: Join attributes by location

 1. Open HPD buildings in Manhattan (from Exercise 5-1) and [city council districts](https://data.cityofnewyork.us/City-Government/City-Council-Districts/yusd-j4xi).
 2. Confirm that the layers are in the same CRS or use **Save As...** on one of the layers to make them match.
 3. Go to **Vector > Data Management Tools > Join Attributes by Location**:
    1. Select the appropriate layers for **Target vector layer** (city council districts) and **Join vector layer** (HPD buildings in Manhattan).
    2. Select **Take summary of intersecting features**.
    3. Select **Mean** and select **Sum**.
    4. Choose an appropriate location to save the output shapefile.
    5. Press **OK**.
    6. This may take a minute or two. When QGIS is done it will ask you if you want to add the new layer to your TOC (**layers panel**). Do so.
    7. Your resulting layer should include the mean and sum of each numeric field in the buildings file.
 4. Create a choropleth using one of the fields in the new layer..

<div style="page-break-after: always;"></div>

