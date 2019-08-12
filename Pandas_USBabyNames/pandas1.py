#title: "Using Pandas to read csv data and perform some analysis"
#author: "Julian Kanjere"
#date: "May 2019"


import pandas
from ggplot import *

dataset_url = "./us-baby-names/NationalNames.csv"
data_frame_baby = pandas.read_csv(dataset_url, sep=',')
print(data_frame_baby.head(5))
print(data_frame_baby.describe())

# a) Identify all names associated with both boys and girls (unisex names)

# List unique values in the data_frame_baby['name'] column
# Create a list of unique values by turning the pandas column into a set
# list(set(data_frame_baby.name)) or list(data_frame_baby['name'].unique())

list_baby_unique_F = list(data_frame_baby[data_frame_baby['Gender'] == 'F']['Name'].unique())
# print(list_baby_unique_F)
print(len(list_baby_unique_F))  # 64911

list_baby_unique_F2 = list(set(data_frame_baby[data_frame_baby['Gender'] == 'F']['Name']))
# print(list_baby_unique_F2)
total_baby_unique_F2 = len(list_baby_unique_F2)
print("%r %r" % ("total_baby_unique_F2 ", total_baby_unique_F2))  # 64911

list_baby_all_female_names = list(data_frame_baby[data_frame_baby['Gender'] == 'F']['Name'])
print(len(list_baby_all_female_names))  # 1081683

list_baby_all_names = list(data_frame_baby['Name'])
total_baby_all_names = len(list_baby_all_names)
print('%r %r' % ("total_baby_all_names", total_baby_all_names))  # 1825433

list_baby_unique_M = list(data_frame_baby[data_frame_baby['Gender'] == 'M']['Name'].unique())
print(len(list_baby_unique_M))  # 39199

list_baby_all_male_names = list(data_frame_baby[data_frame_baby['Gender'] == 'M']['Name'])
# print(list_baby_all_male_names)
print(len(list_baby_all_male_names))  # 743750

# compare / intersection
baby_unisex_names = set(list_baby_unique_F) & set(list_baby_unique_M)
# print(len(baby_unisex_names)) #10221
baby_unisex_names_str = ', '.join(str(unisex_name) for unisex_name in baby_unisex_names)
print("%r is %r" % ("Unisex names: ", str(baby_unisex_names_str)))

# b) Calculate the share of unisex names, relative to all other names
# count occurences of unisex names vs total names

list_all_baby_unisex = list(data_frame_baby[data_frame_baby['Name'].isin(baby_unisex_names)]['Name'])
total_baby_unisex = len(list_all_baby_unisex)
print(total_baby_unisex)
print(list_all_baby_unisex)
# data_frame.groupby(['occupation', 'gender']).size()
# “group by” involves split-apply-combine:
#     Splitting the data into groups based on some criteria.
#     Applying a function to each group independently.
#     Combining the results into a data structure.
#


# c) for a unisex name, plot name vs time with legend being gender
# data_frame_baby[data_frame_baby['Gender'] == 'F']
# data_frame_baby.loc[data_frame_baby["Gender"]  == 'F', ["Name"]] #1081683 rows x 1 columns

# data_frame_baby[data_frame_baby['Gender'] == 'Unisex']x, y = np.random.random((2, num))


ggplot(aes(x='x', y='y', color='gender'), data=df) +\
geom_point(size=50) +\
theme_bw()
