README
================

Intoduction
===========

This package was created in order to enable the creation of a neural network model, for the needs of a European project. “TrafficBDE” includes functions for properly formulating the data, training the neural network and predicted the wanted variable. This document introduces you to TrafficBDE's basic set of tools.

The user should use only the `loadData` and the `kStepsForward` functions. The first one to load the historical data and the second for the computation of the predicted value.

Install Package
===============

In order to install TrafficBDE, you should use the following code.

    install.packages("devtools")
    devtools::install_github("okgreece/TrafficBDE")

Input
-----

The input dataset of the main function could be a link, a csv, an excel file. There are different parameters that a user could specify and interact with the results. The parameters: "path", "Link\_id", "direction", "datetime", "predict" and "steps" should be defined by the user, to form the dataset. Then an automated process formulates the data in order to provide the prediction of the wanted variable for the desired time and road.

<table>
<caption>A sort description about the inputs.</caption>
<colgroup>
<col width="13%" />
<col width="86%" />
</colgroup>
<thead>
<tr class="header">
<th>Input</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>path</p></td>
<td><p>The path containing the historical data</p></td>
</tr>
<tr class="even">
<td><p>Link_id</p></td>
<td><p>The Link_id of the road</p></td>
</tr>
<tr class="odd">
<td><p>dimension</p></td>
<td><p>The dimension of the road</p></td>
</tr>
<tr class="even">
<td><p>datetime</p></td>
<td><p>The date time for the pediction. The format of the datetime should be '%Y-%m-%d %H:%M:%S'</p></td>
</tr>
<tr class="odd">
<td><p>predict</p></td>
<td><p>The argument to be predicted, appropriate values: &quot;Mean_speed&quot;, &quot;Entries&quot;, &quot;Stdev_speed&quot;</p></td>
</tr>
<tr class="even">
<td><p>steps</p></td>
<td><p>How many steps forward the prediction will be</p></td>
</tr>
</tbody>
</table>

Output
------

The output of this process is a matrix with the predicted and real values and the RMSE. The rows are equal to the steps.

Examples
--------

Simple examples the `kStepsForward` function are provided, in order for the user to understand the use and how to deal with these function.

The sample of the dataset that is being used is available in TrafficBDE package and represents the traffic fload of the road with Link\_id: "163204843", for January 2017.

The first example provides, in one step, the prediction of the Mean speed at 14.00 on 27 Jan. 2017

``` r
library(TrafficBDE)
Data <- X163204843_1

kStepsForward(Data = Data, Link_id = "163204843", direction = "1", datetime = "2017-01-27 14:00:00", predict = "Mean_speed", steps = 1)
```

    ## Training...

    ## Loading required package: lattice

    ## Loading required package: ggplot2

    ## + Fold01: layer1=4, layer2=3, layer3=4 
    ## - Fold01: layer1=4, layer2=3, layer3=4 
    ## + Fold01: layer1=5, layer2=3, layer3=4 
    ## - Fold01: layer1=5, layer2=3, layer3=4 
    ## + Fold01: layer1=4, layer2=4, layer3=4 
    ## - Fold01: layer1=4, layer2=4, layer3=4 
    ## + Fold01: layer1=5, layer2=4, layer3=4 
    ## - Fold01: layer1=5, layer2=4, layer3=4 
    ## + Fold02: layer1=4, layer2=3, layer3=4 
    ## - Fold02: layer1=4, layer2=3, layer3=4 
    ## + Fold02: layer1=5, layer2=3, layer3=4 
    ## - Fold02: layer1=5, layer2=3, layer3=4 
    ## + Fold02: layer1=4, layer2=4, layer3=4 
    ## - Fold02: layer1=4, layer2=4, layer3=4 
    ## + Fold02: layer1=5, layer2=4, layer3=4 
    ## - Fold02: layer1=5, layer2=4, layer3=4 
    ## + Fold03: layer1=4, layer2=3, layer3=4 
    ## - Fold03: layer1=4, layer2=3, layer3=4 
    ## + Fold03: layer1=5, layer2=3, layer3=4 
    ## - Fold03: layer1=5, layer2=3, layer3=4 
    ## + Fold03: layer1=4, layer2=4, layer3=4 
    ## - Fold03: layer1=4, layer2=4, layer3=4 
    ## + Fold03: layer1=5, layer2=4, layer3=4 
    ## - Fold03: layer1=5, layer2=4, layer3=4 
    ## + Fold04: layer1=4, layer2=3, layer3=4 
    ## - Fold04: layer1=4, layer2=3, layer3=4 
    ## + Fold04: layer1=5, layer2=3, layer3=4 
    ## - Fold04: layer1=5, layer2=3, layer3=4 
    ## + Fold04: layer1=4, layer2=4, layer3=4 
    ## - Fold04: layer1=4, layer2=4, layer3=4 
    ## + Fold04: layer1=5, layer2=4, layer3=4 
    ## - Fold04: layer1=5, layer2=4, layer3=4 
    ## + Fold05: layer1=4, layer2=3, layer3=4 
    ## - Fold05: layer1=4, layer2=3, layer3=4 
    ## + Fold05: layer1=5, layer2=3, layer3=4 
    ## - Fold05: layer1=5, layer2=3, layer3=4 
    ## + Fold05: layer1=4, layer2=4, layer3=4 
    ## - Fold05: layer1=4, layer2=4, layer3=4 
    ## + Fold05: layer1=5, layer2=4, layer3=4 
    ## - Fold05: layer1=5, layer2=4, layer3=4 
    ## + Fold06: layer1=4, layer2=3, layer3=4 
    ## - Fold06: layer1=4, layer2=3, layer3=4 
    ## + Fold06: layer1=5, layer2=3, layer3=4 
    ## - Fold06: layer1=5, layer2=3, layer3=4 
    ## + Fold06: layer1=4, layer2=4, layer3=4 
    ## - Fold06: layer1=4, layer2=4, layer3=4 
    ## + Fold06: layer1=5, layer2=4, layer3=4 
    ## - Fold06: layer1=5, layer2=4, layer3=4 
    ## + Fold07: layer1=4, layer2=3, layer3=4 
    ## - Fold07: layer1=4, layer2=3, layer3=4 
    ## + Fold07: layer1=5, layer2=3, layer3=4 
    ## - Fold07: layer1=5, layer2=3, layer3=4 
    ## + Fold07: layer1=4, layer2=4, layer3=4 
    ## - Fold07: layer1=4, layer2=4, layer3=4 
    ## + Fold07: layer1=5, layer2=4, layer3=4 
    ## - Fold07: layer1=5, layer2=4, layer3=4 
    ## + Fold08: layer1=4, layer2=3, layer3=4 
    ## - Fold08: layer1=4, layer2=3, layer3=4 
    ## + Fold08: layer1=5, layer2=3, layer3=4 
    ## - Fold08: layer1=5, layer2=3, layer3=4 
    ## + Fold08: layer1=4, layer2=4, layer3=4 
    ## - Fold08: layer1=4, layer2=4, layer3=4 
    ## + Fold08: layer1=5, layer2=4, layer3=4 
    ## - Fold08: layer1=5, layer2=4, layer3=4 
    ## + Fold09: layer1=4, layer2=3, layer3=4 
    ## - Fold09: layer1=4, layer2=3, layer3=4 
    ## + Fold09: layer1=5, layer2=3, layer3=4 
    ## - Fold09: layer1=5, layer2=3, layer3=4 
    ## + Fold09: layer1=4, layer2=4, layer3=4 
    ## - Fold09: layer1=4, layer2=4, layer3=4 
    ## + Fold09: layer1=5, layer2=4, layer3=4 
    ## - Fold09: layer1=5, layer2=4, layer3=4 
    ## + Fold10: layer1=4, layer2=3, layer3=4 
    ## - Fold10: layer1=4, layer2=3, layer3=4 
    ## + Fold10: layer1=5, layer2=3, layer3=4 
    ## - Fold10: layer1=5, layer2=3, layer3=4 
    ## + Fold10: layer1=4, layer2=4, layer3=4 
    ## - Fold10: layer1=4, layer2=4, layer3=4 
    ## + Fold10: layer1=5, layer2=4, layer3=4 
    ## - Fold10: layer1=5, layer2=4, layer3=4 
    ## Aggregating results
    ## Selecting tuning parameters
    ## Fitting layer1 = 4, layer2 = 4, layer3 = 4 on full training set
    ## Training Completed.
    ## 
    ## Time taken for training:  1.978009049
    ## Predicting Mean_speed for the Next Quarter...

    ##                       Predicted Real Value        RMSE
    ## 2017-01-27 14:00:00 39.36150787         29 10.36150787

The second example provides, in one step, the prediction of the Entries at 20.00 on 15 Jan. 2017

``` r
kStepsForward(Data = Data, Link_id = "163204843", direction = "1", datetime = "2017-01-15 20:00:00", predict = "Entries", steps = 1)
```

    ## Training...
    ## + Fold01: layer1=4, layer2=3, layer3=4 
    ## - Fold01: layer1=4, layer2=3, layer3=4 
    ## + Fold01: layer1=5, layer2=3, layer3=4 
    ## - Fold01: layer1=5, layer2=3, layer3=4 
    ## + Fold01: layer1=4, layer2=4, layer3=4 
    ## - Fold01: layer1=4, layer2=4, layer3=4 
    ## + Fold01: layer1=5, layer2=4, layer3=4 
    ## - Fold01: layer1=5, layer2=4, layer3=4 
    ## + Fold02: layer1=4, layer2=3, layer3=4 
    ## - Fold02: layer1=4, layer2=3, layer3=4 
    ## + Fold02: layer1=5, layer2=3, layer3=4 
    ## - Fold02: layer1=5, layer2=3, layer3=4 
    ## + Fold02: layer1=4, layer2=4, layer3=4 
    ## - Fold02: layer1=4, layer2=4, layer3=4 
    ## + Fold02: layer1=5, layer2=4, layer3=4 
    ## - Fold02: layer1=5, layer2=4, layer3=4 
    ## + Fold03: layer1=4, layer2=3, layer3=4 
    ## - Fold03: layer1=4, layer2=3, layer3=4 
    ## + Fold03: layer1=5, layer2=3, layer3=4 
    ## - Fold03: layer1=5, layer2=3, layer3=4 
    ## + Fold03: layer1=4, layer2=4, layer3=4 
    ## - Fold03: layer1=4, layer2=4, layer3=4 
    ## + Fold03: layer1=5, layer2=4, layer3=4 
    ## - Fold03: layer1=5, layer2=4, layer3=4 
    ## + Fold04: layer1=4, layer2=3, layer3=4 
    ## - Fold04: layer1=4, layer2=3, layer3=4 
    ## + Fold04: layer1=5, layer2=3, layer3=4 
    ## - Fold04: layer1=5, layer2=3, layer3=4 
    ## + Fold04: layer1=4, layer2=4, layer3=4 
    ## - Fold04: layer1=4, layer2=4, layer3=4 
    ## + Fold04: layer1=5, layer2=4, layer3=4 
    ## - Fold04: layer1=5, layer2=4, layer3=4 
    ## + Fold05: layer1=4, layer2=3, layer3=4 
    ## - Fold05: layer1=4, layer2=3, layer3=4 
    ## + Fold05: layer1=5, layer2=3, layer3=4 
    ## - Fold05: layer1=5, layer2=3, layer3=4 
    ## + Fold05: layer1=4, layer2=4, layer3=4 
    ## - Fold05: layer1=4, layer2=4, layer3=4 
    ## + Fold05: layer1=5, layer2=4, layer3=4 
    ## - Fold05: layer1=5, layer2=4, layer3=4 
    ## + Fold06: layer1=4, layer2=3, layer3=4 
    ## - Fold06: layer1=4, layer2=3, layer3=4 
    ## + Fold06: layer1=5, layer2=3, layer3=4 
    ## - Fold06: layer1=5, layer2=3, layer3=4 
    ## + Fold06: layer1=4, layer2=4, layer3=4 
    ## - Fold06: layer1=4, layer2=4, layer3=4 
    ## + Fold06: layer1=5, layer2=4, layer3=4 
    ## - Fold06: layer1=5, layer2=4, layer3=4 
    ## + Fold07: layer1=4, layer2=3, layer3=4 
    ## - Fold07: layer1=4, layer2=3, layer3=4 
    ## + Fold07: layer1=5, layer2=3, layer3=4 
    ## - Fold07: layer1=5, layer2=3, layer3=4 
    ## + Fold07: layer1=4, layer2=4, layer3=4 
    ## - Fold07: layer1=4, layer2=4, layer3=4 
    ## + Fold07: layer1=5, layer2=4, layer3=4 
    ## - Fold07: layer1=5, layer2=4, layer3=4 
    ## + Fold08: layer1=4, layer2=3, layer3=4 
    ## - Fold08: layer1=4, layer2=3, layer3=4 
    ## + Fold08: layer1=5, layer2=3, layer3=4 
    ## - Fold08: layer1=5, layer2=3, layer3=4 
    ## + Fold08: layer1=4, layer2=4, layer3=4 
    ## - Fold08: layer1=4, layer2=4, layer3=4 
    ## + Fold08: layer1=5, layer2=4, layer3=4 
    ## - Fold08: layer1=5, layer2=4, layer3=4 
    ## + Fold09: layer1=4, layer2=3, layer3=4 
    ## - Fold09: layer1=4, layer2=3, layer3=4 
    ## + Fold09: layer1=5, layer2=3, layer3=4 
    ## - Fold09: layer1=5, layer2=3, layer3=4 
    ## + Fold09: layer1=4, layer2=4, layer3=4 
    ## - Fold09: layer1=4, layer2=4, layer3=4 
    ## + Fold09: layer1=5, layer2=4, layer3=4 
    ## - Fold09: layer1=5, layer2=4, layer3=4 
    ## + Fold10: layer1=4, layer2=3, layer3=4 
    ## - Fold10: layer1=4, layer2=3, layer3=4 
    ## + Fold10: layer1=5, layer2=3, layer3=4 
    ## - Fold10: layer1=5, layer2=3, layer3=4 
    ## + Fold10: layer1=4, layer2=4, layer3=4 
    ## - Fold10: layer1=4, layer2=4, layer3=4 
    ## + Fold10: layer1=5, layer2=4, layer3=4 
    ## - Fold10: layer1=5, layer2=4, layer3=4 
    ## Aggregating results
    ## Selecting tuning parameters
    ## Fitting layer1 = 4, layer2 = 3, layer3 = 4 on full training set
    ## Training Completed.
    ## 
    ## Time taken for training:  1.563325349
    ## Predicting Entries for the Next Quarter...

    ##                       Predicted Real Value          RMSE
    ## 2017-01-15 20:00:00 1.012088733          1 0.01208873324
