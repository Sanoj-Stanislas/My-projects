#!/usr/bin/env python
# coding: utf-8

# # Feature Engineering and Modelling
# 
# ---
# 
# 1. Import packages
# 2. Load data
# 3. Modelling
# 
# ---
# 
# ## 1. Import packages

# In[10]:


import warnings
warnings.filterwarnings("ignore", category=FutureWarning)


# In[11]:


import pandas as pd
import numpy as np
import seaborn as sns
from datetime import datetime
import matplotlib.pyplot as plt

# Shows plots in jupyter notebook
get_ipython().run_line_magic('matplotlib', 'inline')

# Set plot style
sns.set(color_codes=True)


# ---
# ## 2. Load data

# In[12]:


df = pd.read_csv("C:\\Users\\sanoj\\Desktop\\Data Science\\BCG task\\data_for_predictions.csv")
df.drop(columns=["Unnamed: 0"], inplace=True)
df.head()


# ---
# 
# ## 3. Modelling
# 
# We now have a dataset containing features that we have engineered and we are ready to start training a predictive model. Remember, we only need to focus on training a `Random Forest` classifier.

# In[13]:


from sklearn import metrics
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestClassifier


# ### Data sampling
# 
# The first thing we want to do is split our dataset into training and test samples. The reason why we do this, is so that we can simulate a real life situation by generating predictions for our test sample, without showing the predictive model these data points. This gives us the ability to see how well our model is able to generalise to new data, which is critical.
# 
# A typical % to dedicate to testing is between 20-30, for this example we will use a 75-25% split between train and test respectively.

# In[14]:


# Make a copy of our data
train_df = df.copy()

# Separate target variable from independent variables
y = df['churn']
X = df.drop(columns=['id', 'churn'])
print(X.shape)
print(y.shape)


# In[15]:


X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.25, random_state=42)
print(X_train.shape)
print(y_train.shape)
print(X_test.shape)
print(y_test.shape)


# ### Model training
# 
# Once again, we are using a `Random Forest` classifier in this example. A Random Forest sits within the category of `ensemble` algorithms because internally the `Forest` refers to a collection of `Decision Trees` which are tree-based learning algorithms. As the data scientist, you can control how large the forest is (that is, how many decision trees you want to include).
# 
# The reason why an `ensemble` algorithm is powerful is because of the laws of averaging, weak learners and the central limit theorem. If we take a single decision tree and give it a sample of data and some parameters, it will learn patterns from the data. It may be overfit or it may be underfit, but that is now our only hope, that single algorithm. 
# 
# With `ensemble` methods, instead of banking on 1 single trained model, we can train 1000's of decision trees, all using different splits of the data and learning different patterns. It would be like asking 1000 people to all learn how to code. You would end up with 1000 people with different answers, methods and styles! The weak learner notion applies here too, it has been found that if you train your learners not to overfit, but to learn weak patterns within the data and you have a lot of these weak learners, together they come together to form a highly predictive pool of knowledge! This is a real life application of many brains are better than 1.
# 
# Now instead of relying on 1 single decision tree for prediction, the random forest puts it to the overall views of the entire collection of decision trees. Some ensemble algorithms using a voting approach to decide which prediction is best, others using averaging. 
# 
# As we increase the number of learners, the idea is that the random forest's performance should converge to its best possible solution.
# 
# Some additional advantages of the random forest classifier include:
# 
# - The random forest uses a rule-based approach instead of a distance calculation and so features do not need to be scaled
# - It is able to handle non-linear parameters better than linear based models
# 
# On the flip side, some disadvantages of the random forest classifier include:
# 
# - The computational power needed to train a random forest on a large dataset is high, since we need to build a whole ensemble of estimators.
# - Training time can be longer due to the increased complexity and size of thee ensemble

# In[16]:


# Add model training in here!
model = RandomForestClassifier(random_state=42) # Add parameters to the model!
model.fit(X_train, y_train)


# ### Evaluation
# 
# Now let's evaluate how well this trained model is able to predict the values of the test dataset.

# In[19]:


y_pred = model.predict(X_test)
accuracy = metrics.accuracy_score(y_test, y_pred)
precision = metrics.precision_score(y_test, y_pred)
recall = metrics.recall_score(y_test, y_pred)
f1_score = metrics.f1_score(y_test, y_pred)


# In[23]:


conf_matrix = metrics.confusion_matrix(y_test, y_pred)
sns.heatmap(conf_matrix, annot=True, fmt="d", cmap="PuRd", cbar=False)
plt.xlabel("Predicted")
plt.ylabel("Actual")
plt.title("Confusion Matrix")
plt.show()


# In[ ]:


# Confusion Matrix Analysis
"""
The confusion matrix provides insight into the model's performance:

True Negatives (TN): 3282 - The number of instances correctly predicted as non-churn (actual 0, predicted 0).
True Positives (TP): 19 - The number of instances correctly predicted as churn (actual 1, predicted 1).
False Negatives (FN): 347 - Instances where the model predicted non-churn, but the actual label was churn (actual 1, predicted 0).
False Positives (FP): 4 - Instances where the model predicted churn, but the actual label was non-churn (actual 0, predicted 1).

High True Negatives (3282) indicate a strong ability to correctly identify non-churn cases.
True Positives (19) show the model's capability in predicting churn instances.
False Negatives (347) represent instances where the model failed to identify actual churn cases.
False Positives (4) indicate instances where the model incorrectly predicted churn.

Business Implications:
1) High True Negatives suggest that the model is effective in retaining customers who are unlikely to churn, minimizing the risk of unnecessary intervention for loyal customers.
2) True Positives highlight instances where the model successfully predicts churn, providing an opportunity for proactive retention strategies.
3) False Negatives represent missed opportunities to identify customers at risk of churning, signaling a need for enhanced targeted retention efforts.
4) False Positives indicate instances where intervention may be wrongly triggered, potentially leading to unnecessary costs. This underscores the importance of refining the model's threshold or implementing additional validation steps.

The choice of evaluation metrics (accuracy, precision, recall, and F1 score) allows for a comprehensive assessment of the model's performance, balancing the impact of false positives and false negatives on the business. Striking the right balance is essential based on the specific goals and consequences of the churn prediction problem.
"""


# In[25]:


# Feature importance plot
feature_importance = model.feature_importances_
feature_names = X.columns

# Sort feature importances in descending order
indices = np.argsort(feature_importance)[::-1]

# Plot the feature importances
plt.figure(figsize=(10, 6))
sns.barplot(x=feature_importance[indices], y=feature_names[indices])
plt.xlabel('Feature Importance')
plt.ylabel('Features')
plt.title('Random Forest Classifier - Feature Importance')
plt.show()


# In[ ]:


# Feature Importance Analysis
"""
The feature importance plot reveals insights into the factors influencing the Random Forest model's predictions. Notably, the feature with the highest importance is "electricity consumption of the past 12 months."

Interpretation:
1) "Electricity consumption of the past 12 months" has the highest feature importance, suggesting that it significantly contributes to the model's prediction of churn.
2) High feature importance indicates that variations in this feature have a substantial impact on the model's decision-making process.

Possible Business Implications:
1) The prominence of "electricity consumption" suggests that energy usage patterns over the past year play a crucial role in predicting customer churn.
2) Businesses may want to explore how electricity consumption patterns correlate with customer behavior and satisfaction.
3) Strategies focused on customer engagement, satisfaction, or tailored retention plans could be developed based on insights derived from this key feature.

It's important to note that while "electricity consumption" is the most influential feature, other features in the dataset may also contribute to the model's performance, and a holistic understanding of various factors is necessary for comprehensive insights.
"""

