# This code will create a ggplot representing the contrast
# between two conditions in the rnaseq.Rmd
contr_a_norm_WT <- make_contrast('treatment', 'norm', 'WT')

# Here we do some neat stuff with the contrast and get a
# a list of jeans.
df_sel <- contra_a_norm_WT[rows_I_want,]

# Below we will make a ggplot of the data
ggplot(df_sel, aes(mean, logfoldchange, colour = group)) + 
  geom_point() +
  geom_line()
