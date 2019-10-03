### **Getting & Cleaning Data Project**

### Goal Of the Project

1. The submitted data set is tidy.
2. A link to a Github repository with your script for performing the analysis.
3. A codebook that describes the variables, the data, and any transformations or work that you performed to 
   clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. 
   This repo explains how all of the scripts work and how they are connected.
4. Analysis R Script.

### Dataset Used

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

### Working of run_analysis

1. Loads activitylabels and features.
2. Extracts wanted features i.e mean and standard deviation variables.
3. Combine train_x, train_y and subject_train into a data frame called train and load it.
4. Combine test_x, test_y and subject_test into a data frame called test and load it.
5. Merge the two datasets, test and train, into a data frame called mergedt.
6. Change classlabels to activitynames and converting subject and activity into factors so as to become id.
7. Creates a second tidy data set with mean of each variable for each activity and each subject.

