#!/usr/bin/env python
# coding: utf-8

# In[80]:


# Packages for EDA

import matplotlib.pyplot as plt
import seaborn as sns
import pandas as pd


# In[81]:


# for plots to be displayed directly in the notebook
get_ipython().run_line_magic('matplotlib', 'inline')

# the visual style for aesthetics
sns.set(color_codes=True)


# In[82]:


# Loaded the client data and pricing data

client_df = pd.read_csv("C:\\Users\\sanoj\\Desktop\\Data Science\\BCG task 2\\client_data (1).csv")
price_df = pd.read_csv("C:\\Users\\sanoj\\Desktop\\Data Science\\BCG task 2\\price_data (1).csv")



# In[83]:


# to display the first 7 rows of the client data to get an overview
client_df.head(7)



# In[84]:


# to display the first 7 rows of the price data to get an overview
price_df.head(7)


# In[85]:


# Exploring the data types and basic statistics to understand the structure
client_df.info()
client_df.describe()


# In[86]:


# Exploring the data types and basic statistics to understand the structure
price_df.info()
price_df.describe()


# In[87]:


# Extracted relevant columns related to energy consumption for further analysis
price_columns = ['id', 'price_date', 'price_off_peak_var', 'price_peak_var', 'price_mid_peak_var',
                  'price_off_peak_fix', 'price_peak_fix', 'price_mid_peak_fix']

price = price_df[price_columns]

# Displayed the first 7 rows of the price data to understand its structure
price.head(7)


# In[88]:


# Calculate churn percentages to understand the overall churn status
churn_total = churn.groupby(churn['churn']).count()
churn_percentage = churn_total / churn_total.sum() * 100

# Map churn labels for clearer visualization
churn_labels = {1: 'Churn', 0: 'Retention'}
churn.loc[:, 'churn_label'] = churn['churn'].map(churn_labels)

# Visualize the churn status using multiple visualizations for a comprehensive view

# pie chart to show the proportion of churned and retained customers
plt.figure(figsize=(10, 6))
plt.pie(churn_percentage['id'], labels=churn_percentage.index.map(churn_labels), autopct='%1.1f%%', startangle=90, colors=['#FF9999', '#66B2FF'])
plt.title('Churning Status Proportion')
plt.show()

# bar chart for a clearer representation
plt.figure(figsize=(8, 5))
sns.barplot(x=churn_percentage.index.map(churn_labels), y=churn_percentage['id'], palette=['#FF9999', '#66B2FF'])
plt.title('Churning Status Distribution')
plt.xlabel('Churn Status')
plt.ylabel('Percentage')
plt.show()

# the count of churn status using a count plot
plt.figure(figsize=(8, 5))
sns.countplot(x='churn_label', data=churn, palette=['#FF9999', '#66B2FF'])
plt.title('Count of Churn Status')
plt.xlabel('Churn Status')
plt.ylabel('Count')
plt.show()

# summary of churn statistics
print(f"Churn Statistics:\n{churn_percentage.transpose()}")

# Additional insights or interpretations
print("\nAdditional Insights:")
print("- The pie chart provides a visual breakdown of churn proportions.")
print("- The bar chart offers a clear comparison of churn percentages.")
print("- The count plot shows the actual count of churned and retained customers.")

#All these plots clearly show that nearly 10% of subscribers are churning, 
#and we need to further investigate to understand what affects churning.


# In[89]:


# Select relevant columns for energy consumption analysis
consumption_columns = ['id', 'cons_12m', 'cons_gas_12m', 'cons_last_month', 'imp_cons', 'has_gas', 'churn']
consumption = client_df[consumption_columns].copy()  # Create a copy of the DataFrame

# Mapping labels for better readability
churn_labels = {1: 'Churn', 0: 'Retention'}
consumption['churn_label'] = consumption['churn'].map(churn_labels)

# Creating subplots for distribution plots to understand the spread of 'cons_12m'
fig, axs = plt.subplots(nrows=2, ncols=2, figsize=(18, 10))

# Plot the distribution of 'cons_12m' with a histogram
sns.histplot(consumption['cons_12m'], bins=50, kde=True, color='#66B2FF', ax=axs[0, 0])
axs[0, 0].set_title('Distribution of Annual Consumption')
axs[0, 0].set_xlabel('Annual Consumption (kWh)')
axs[0, 0].set_ylabel('Frequency')

# Explore the relationship between gas consumption and churn
sns.scatterplot(x='cons_gas_12m', y='cons_12m', hue='churn_label', data=consumption, palette=['#66B2FF', '#FF9999'], ax=axs[0, 1])
axs[0, 1].set_title('Gas vs. Electricity Consumption')
axs[0, 1].set_xlabel('Gas Consumption (kWh)')
axs[0, 1].set_ylabel('Electricity Consumption (kWh)')

# Investigate the impact of gas usage on churn
sns.boxplot(x='churn_label', y='cons_gas_12m', data=consumption, palette=['#FF9999', '#66B2FF'], ax=axs[1, 0])
axs[1, 0].set_title('Impact of Gas Usage on Churn')
axs[1, 0].set_xlabel('Churn Status')
axs[1, 0].set_ylabel('Gas Consumption (kWh)')

# Analyze the distribution of the last month's consumption
sns.kdeplot(consumption.loc[consumption['churn_label'] == 'Retention', 'cons_last_month'], label='Retention', color='#66B2FF', ax=axs[1, 1])
sns.kdeplot(consumption.loc[consumption['churn_label'] == 'Churn', 'cons_last_month'], label='Churn', color='#FF9999', ax=axs[1, 1])
axs[1, 1].set_title('Distribution of Last Month\'s Consumption')
axs[1, 1].set_xlabel('Last Month\'s Consumption (kWh)')
axs[1, 1].set_ylabel('Density')

# Adjust layout for better readability
plt.tight_layout()
plt.show()

# Additional insights or interpretations can be added here
print("\nAdditional Insights:")
print("- The first subplot displays the distribution of annual consumption.")
print("- The scatter plot examines the relationship between gas and electricity consumption, color-coded by churn status.")
print("- The second row explores the impact of gas usage on churn through a box plot.")
print("- The last subplot compares the distribution of last month's consumption for retained and churned customers.")


# In[90]:


# Convert date columns to datetime format
client_df['date_activ'] = pd.to_datetime(client_df['date_activ'])
client_df['date_end'] = pd.to_datetime(client_df['date_end'])
client_df['date_modif_prod'] = pd.to_datetime(client_df['date_modif_prod'])
client_df['date_renewal'] = pd.to_datetime(client_df['date_renewal'])

# Extract features related to date
client_df['activation_month'] = client_df['date_activ'].dt.month
client_df['activation_year'] = client_df['date_activ'].dt.year
client_df['end_month'] = client_df['date_end'].dt.month
client_df['end_year'] = client_df['date_end'].dt.year
client_df['modification_month'] = client_df['date_modif_prod'].dt.month
client_df['modification_year'] = client_df['date_modif_prod'].dt.year
client_df['renewal_month'] = client_df['date_renewal'].dt.month
client_df['renewal_year'] = client_df['date_renewal'].dt.year

# Visualize churn over time
plt.figure(figsize=(12, 6))
sns.lineplot(x='activation_year', y='churn', data=client_df, marker='o')
plt.title('Churn Over Time')
plt.xlabel('Activation Year')
plt.ylabel('Churn Rate')
plt.show()

# Investigate seasonal patterns
plt.figure(figsize=(12, 6))
sns.lineplot(x='activation_month', y='churn', data=client_df, marker='o')
plt.title('Seasonal Churn Patterns')
plt.xlabel('Activation Month')
plt.ylabel('Churn Rate')
plt.show()

# Explore correlations with numerical features
numerical_columns = ['cons_12m', 'cons_gas_12m', 'cons_last_month', 'imp_cons', 'net_margin', 'num_years_antig', 'pow_max']
correlation_matrix = client_df[numerical_columns + ['churn']].corr()

plt.figure(figsize=(10, 8))
sns.heatmap(correlation_matrix, annot=True, cmap='coolwarm', fmt=".2f")
plt.title('Correlation Matrix')
plt.show()


# In[91]:


# Churn Analysis Results:

# Churn Rate:
# The churn rate is 9.7%, indicating that approximately 9.7% of subscribers have churned, while 90.3% are retained.

# Electricity Consumption Impact:
# Churn frequency was higher among customers with lower gas consumption, particularly near 0 kWh.
# Electricity consumption might have a more significant impact on churn compared to gas consumption.

# Temporal Trends:
# Churn rate was lowest in the year 2007 and highest in 2013, suggesting temporal variations in churn behavior.
# Churn rate was lowest in September and highest in June, indicating potential seasonality.

# Correlation Analysis:
# There is a positive correlation of 0.46 between total net margin and current paid consumption, suggesting a moderate relationship between net margin and consumption.
# The correlation between electricity consumption of the last month and  gas consumption of the past 12 months is 0.51, indicating a moderate positive relationship.
# The correlation between gas consumption of the past 12 months and electricity consumption of the past 12 months is 0.49, suggesting a moderate positive correlation.

# Conclusion:
# The findings highlight the importance of considering electricity consumption, temporal trends, and correlations with key features like net margin and consumption patterns in understanding and predicting churn behavior.

# These insights provide a foundation for further exploration and targeted strategies to mitigate churn and enhance customer retention.

