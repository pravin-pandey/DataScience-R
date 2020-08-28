# Upper Confidence Bound

getwd()

setwd('C://Users//pravi//Desktop//PROJECTS//Data Science - R//6. Reinforcement Learning//1. Upper Confidence Bound (UCB)')

#importing dataset
 df = read.csv('Ads_CTR_Optimisation.csv')
 
 #Implementing Random Selec

# N = 10000
# d = 10
# ads_selected = integer(0)
# total_reward = 0
# for(n in 1:N)
# {
#   ad = sample(1:10,1) 
#   ads_selected = append(ads_selected,ad)
#   reward = df[n,ad]
#   total_reward = total_reward + reward
# }

# Implementing UCB
N = 10000
d = 10
ads_selected = integer()
no_of_selections = integer(d)
sums_of_rewards = integer(d)
total_reward = 0
for (n in 1:N)
{
  max_upper_bound = 0
  ad = 0
  for (i in 1:d)
  {
    if (no_of_selections[i] > 0)
    {
      average_reward = sums_of_rewards[i] / no_of_selections[i]
      delta_i = sqrt(3/2 * log(n)/no_of_selections[i])
      upper_bound = average_reward + delta_i
    }
    else
    {
      upper_bound = 1e400
    }
    if (upper_bound > max_upper_bound)
    {
      max_upper_bound = upper_bound
      ad = i
    }
  }
  ads_selected = append(ads_selected, ad)
  no_of_selections[ad] = no_of_selections[ad] + 1
  reward = df[n, ad]
  sums_of_rewards[ad] = sums_of_rewards[ad] + reward
  total_reward = total_reward + reward
}
print(total_reward)

# Visualizing the results

hist(ads_selected,
     col = 'blue',
     main = 'Histogram of ad selection',
     xlab = 'Ads',
     ylab = 'No.of times each ad selected')

