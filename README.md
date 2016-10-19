---
title: "README.md"
author: "Paul Thompson"
date: "19 October 2016"
output: html_document
---

#`run_analysis.R` 
works by first downloading the file from the archive on `uci.edu`. This only occurs 
if the data has not yet been extracted. This means that you do not waste data if the data has
previously been downloaded. 

Next up, 6 different files are loaded 

* X_test.txt - A test file containing measurements into testX
* y_test.txt - The labels (activities) that were taking place in the X_test row
* subject_test.txt - The subject that performed each of the activities, 1 per each row in X_test
The same set for the _train files is loaded too.

Next up, the data is set names using the names outlined in the "features.txt". 

Then, a Label, and Subject is added to the measurement datasets, this comes from the Y_(test|train)/subject_(test|train) 
data frames.

We simply want to append these to one another, so `rbind` is used to do that

Next, the columns are filtered by their name to only keep ones relevant to the Average, Standard Deviation, Label, or Subject.

To tidy it, the merged data set is aggregated by Subject and Label. A mean function is applied during this aggregation.

Finally, it's written out to an `output.csv` file
