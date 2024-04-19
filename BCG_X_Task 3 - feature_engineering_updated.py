#!/usr/bin/env python
# coding: utf-8

# # Feature Engineering
# 
# ---
# 
# 1. Import packages
# 2. Load data
# 3. Feature engineering
# 
# ---
# 
# ## 1. Import packages

# In[72]:


import pandas as pd


# ---
# ## 2. Load data

# In[73]:


df = pd.read_csv("C:\\Users\\sanoj\\Desktop\\Data Science\\BCG task\\clean_data_after_eda.csv")
df["date_activ"] = pd.to_datetime(df["date_activ"], format='%Y-%m-%d')
df["date_end"] = pd.to_datetime(df["date_end"], format='%Y-%m-%d')
df["date_modif_prod"] = pd.to_datetime(df["date_modif_prod"], format='%Y-%m-%d')
df["date_renewal"] = pd.to_datetime(df["date_renewal"], format='%Y-%m-%d')


# In[74]:


df.head(3)


# ---
# 
# ## 3. Feature engineering
# 
# ### Difference between off-peak prices in December and preceding January
# 
# Below is the code created by your colleague to calculate the feature described above. Use this code to re-create this feature and then think about ways to build on this feature to create features with a higher predictive power.

# In[75]:


price_df = pd.read_csv("C:\\Users\\sanoj\\Desktop\\Data Science\\BCG task\\price_data (1).csv")
price_df["price_date"] = pd.to_datetime(price_df["price_date"], format='%Y-%m-%d')
price_df.head()


# In[76]:


# Group off-peak prices by companies and month
monthly_price_by_id = price_df.groupby(['id', 'price_date']).agg({'price_off_peak_var': 'mean', 'price_off_peak_fix': 'mean'}).reset_index()

# Get january and december prices
jan_prices = monthly_price_by_id.groupby('id').first().reset_index()
dec_prices = monthly_price_by_id.groupby('id').last().reset_index()

# Calculate the difference
diff = pd.merge(dec_prices.rename(columns={'price_off_peak_var': 'dec_1', 'price_off_peak_fix': 'dec_2'}), jan_prices.drop(columns='price_date'), on='id')
diff['offpeak_diff_dec_january_energy'] = diff['dec_1'] - diff['price_off_peak_var']
diff['offpeak_diff_dec_january_power'] = diff['dec_2'] - diff['price_off_peak_fix']
diff = diff[['id', 'offpeak_diff_dec_january_energy','offpeak_diff_dec_january_power']]
diff.head()


# Now it is time to get creative and to conduct some of your own feature engineering! Have fun with it, explore different ideas and try to create as many as yo can!
Time based Features

Extracting month, day of the month, day of the year, and year from date columns can provide additional time-related features.


# In[77]:


df['month_activ'] = df['date_activ'].dt.month
df['day_activ'] = df['date_activ'].dt.day
df['year_activ'] = df['date_activ'].dt.year
df.head (5)


# Time Differences
# 
# Calculate the differences between various date columns, which might capture patterns related to customer behavior.

# In[78]:


df['days_until_end'] = (df['date_end'] - df['date_activ']).dt.days
df['days_until_renewal'] = (df['date_renewal'] - df['date_activ']).dt.days
df.head(5)


# Consumption Statistics:
# Derive statistical features such as the mean and standard deviation from numerical columns like consumption, providing insights into data variability.

# In[79]:


df['mean_consumption'] = df[['cons_12m', 'cons_gas_12m', 'cons_last_month']].mean(axis=1)
df['std_consumption'] = df[['cons_12m', 'cons_gas_12m', 'cons_last_month']].std(axis=1)
df.head(5)


# Rolling Averages:
# Calculate rolling averages of prices to capture trends over time.

# In[80]:


price_df['rolling_avg_var'] = price_df.groupby('id')['price_off_peak_var'].rolling(window=3).mean().reset_index(level=0, drop=True)
price_df.head(5)


# Temporal Trends:
# Compute rolling averages of prices to reveal temporal trends and fluctuations.

# In[81]:


price_df['rolling_avg_var'] = price_df.groupby('id')['price_off_peak_var'].rolling(window=3).mean().reset_index(level=0, drop=True)
price_df.head(5)


# Aggregate by Customer ID:
# Calculate aggregate statistics for each customer based on historical data.

# In[82]:


customer_agg = df.groupby('id').agg({'cons_12m': ['mean', 'max'], 'forecast_price_energy_off_peak': 'mean'})
customer_agg.columns = ['avg_cons_12m', 'max_cons_12m', 'avg_price_off_peak_var']
df.head(5)



# Product and Ratio:
# Introduce new features by performing mathematical operations on existing columns, like multiplication or division.

# In[83]:


df['product_consumption'] = df['cons_12m'] * df['cons_gas_12m']
df['ratio_consumption'] = df['cons_12m'] / (df['cons_gas_12m'] + 1)  # Avoid division by zero
df.head()


# Energy Efficiency Metric:
# Create a feature that represents the energy efficiency of each customer, offering a domain-specific perspective.

# In[84]:


df['energy_efficiency_electricity'] = df['cons_12m'] / df['num_years_antig']
df['energy_efficiency_gas'] = df['cons_gas_12m'] / df['num_years_antig']
df.head(5)


# In[ ]:




