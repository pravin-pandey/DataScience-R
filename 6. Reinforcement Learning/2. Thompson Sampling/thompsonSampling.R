# Thompson Sampling

getwd()

setwd('C://Users//pravi//Desktop//PROJECTS//Data Science - R//6. Reinforcement Learning//2. Thompson Sampling/')

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

# Implementing Thompson Sampling
N = 10000
d = 10
ads_selected = integer(0)
no_of_rewards_1 = integer(d)
no_of_rewards_0 = integer(d)
total_reward = 0
for (n in 1:N)
{
  max_random = 0
  ad = 0
  for (i in 1:d)
  {
    random_beta = rbeta(n = 1,
                        shape1 = no_of_rewards_1[i]+1,
                        shape2 = no_of_rewards_0[i]+1)
    if (random_beta > max_random)
    {
      max_random = random_beta
      ad = i
    }
  }
  ads_selected = append(ads_selected, ad)
  reward = df[n, ad]
  if (reward == 1)
  {
    no_of_rewards_1[ad] = no_of_rewards_1[ad] + 1
  }
  else
  {
    no_of_rewards_0[ad] = no_of_rewards_0[ad] + 1
  }
  total_reward = total_reward + reward
}
print(total_reward)

# Visualizing the results

hist(ads_selected,
     col = 'blue',
     main = 'Histogram of ad selection',
     xlab = 'Ads',
     ylab = 'No.of times each ad selected')

