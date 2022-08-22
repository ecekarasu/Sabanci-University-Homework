###########################################################################################
#EXAMPLES
###########################################################################################

list_examples = []

#EXAMPLE 1 - the set of cities is empty
twod_list1 = []

#EXAMPLE 2 - there is 1 item in the set of cities
istanbul_bus2 = [0, 3]
istanbul_train2 = [3, 0]
twod_list2 = []
twod_list2.append(istanbul_bus2)
twod_list2.append(istanbul_train2)

# #EXAMPLE 3 - there are 3 items in the set of cities, there are 6 valid stations
istanbul_bus3 = [0,3,7,-1,10,-1] 
istanbul_train3 = [3,0,-1,8,-1,-1]
ankara_bus3 = [7,-1,0,5,-1,-1]
ankara_train3 = [-1,8,5,0,-1,6]
hatay_bus3 = [10,-1,-1,-1,0,5]
hatay_train3 = [-1,-1,-1,6,5,0]
twod_list3 = []
twod_list3.append(istanbul_bus3)
twod_list3.append(istanbul_train3)
twod_list3.append(ankara_bus3)
twod_list3.append(ankara_train3)
twod_list3.append(hatay_bus3)
twod_list3.append(hatay_train3)

#EXAMPLE 4 - there are 5 items in the set of cities, there are 7 valid stations
istanbul_bus4 = [0,1,-1,-2,2,-2,-2,-1,13,-1] 
istanbul_train4 = [1,0,-1,-2,-1,-2,-2,-1,-1,7]
ankara_bus4 = [-1,-1,0,-2,5,-2,-2,-1,-1,-1]
ankara_train4 = [-2,-2,-2,0,-2,-2,-2,-2,-2,-2]
bursa_bus4 = [2,-1,5,-2,0,-2,-2,-1,12,-1]
bursa_train4 = [-2,-2,-2,-2,-2,0,-2,-2,-2,-2]
eskisehir_bus4 = [-2,-2,-2,-2,-2,-2,0,-2,-2,-2]
eskisehir_train4 = [-1,-1,-1,-2,-1,-2,-2,0,-1,6]
hatay_bus4 = [13,-1,-1,-2,12,-2,-2,-1,0,2]
hatay_train4 = [-1,7,-1,-2,-1,-2,-2,6,2,0]
twod_list4 = []
twod_list4.append(istanbul_bus4)
twod_list4.append(istanbul_train4)
twod_list4.append(ankara_bus4)
twod_list4.append(ankara_train4)
twod_list4.append(bursa_bus4)
twod_list4.append(bursa_train4)
twod_list4.append(eskisehir_bus4)
twod_list4.append(eskisehir_train4)
twod_list4.append(hatay_bus4)
twod_list4.append(hatay_train4)

#EXAMPLE 5 - there are 5 items in the set of cities, there are 10 valid stations and there is a single itinerary as a line
istanbul_bus5 = [0,5,-1,-1,-1,-1,-1,-1,-1,-1] 
istanbul_train5 = [5,0,-1,10,-1,-1,-1,-1,-1,-1]
rize_bus5 = [-1,-1,0,3,15,-1,-1,-1,-1,-1]
rize_train5 = [-1,10,3,0,-1,-1,-1,-1,-1,-1]
aydin_bus5 = [-1,-1,15,-1,0,2,-1,-1,-1,-1]
aydin_train5 = [-1,-1,-1,-1,2,0,-1,4,-1,-1]
mugla_bus5 = [-1,-1,-1,-1,-1,-1,0,1,20,-1]
mugla_train5 = [-1,-1,-1,-1,-1,4,1,0,-1,-1]
van_bus5 = [-1,-1,-1,-1,-1,-1,20,-1,0,6]
van_train5 = [-1,-1,-1,-1,-1,-1,-1,-1,6,0]
twod_list5 = []
twod_list5.append(istanbul_bus5)
twod_list5.append(istanbul_train5)
twod_list5.append(rize_bus5)
twod_list5.append(rize_train5)
twod_list5.append(aydin_bus5)
twod_list5.append(aydin_train5)
twod_list5.append(mugla_bus5)
twod_list5.append(mugla_train5)
twod_list5.append(van_bus5)
twod_list5.append(van_train5)

#EXAMPLE 6 - there are 7 items in the set of cities, there are 11 valid stations
istanbul_bus6 = [0,3,-1,-1,-1,-1,-1,-2,-1,-1,-2,-1,5,-2] 
istanbul_train6 = [3,0,-1,-1,-1,-1,-1,-2,-1,4,-2,15,-1,-2]
ankara_bus6 = [-1,-1,0,2,-1,-1,-1,-2,-1,-1,-2,-1,3,-2]
ankara_train6 = [-1,-1,2,0,-1,12,-1,-2,-1,5,-2,10,-1,-2]
hatay_bus6 = [-1,-1,-1,-1,0,3,16,-2,8,-1,-2,-1,-1,-2]
hatay_train6 = [-1,-1,-1,12,3,0,-1,-2,-1,-1,-2,-1,-1,-2]
mugla_bus6 = [-1,-1,-1,-1,16,-1,0,-2,-1,-1,-2,-1,-1,-2]
mugla_train6 = [-2,-2,-2,-2,-2,-2,-2,0,-2,-2,-2,-2,-2,-2]
bursa_bus6 = [-1,-1,-1,-1,8,-1,-1,-2,0,2,-2,-1,-1,-2]
bursa_train6 = [-1,4,-1,5,-1,-1,-1,-2,2,0,-2,7,-1,-2]
rize_bus6 = [-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,0,-2,-2,-2]
rize_train6 = [-1,15,-1,10,-1,-1,-1,-2,-1,7,-2,0,-1,-2]
eskisehir_bus6 = [5,-1,3,-1,-1,-1,-1,-2,-1,-1,-2,-1,0,-2]
eskisehir_train6 = [-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,0]
twod_list6 = []
twod_list6.append(istanbul_bus6)
twod_list6.append(istanbul_train6)
twod_list6.append(ankara_bus6)
twod_list6.append(ankara_train6)
twod_list6.append(hatay_bus6)
twod_list6.append(hatay_train6)
twod_list6.append(mugla_bus6)
twod_list6.append(mugla_train6)
twod_list6.append(bursa_bus6)
twod_list6.append(bursa_train6)
twod_list6.append(rize_bus6)
twod_list6.append(rize_train6)
twod_list6.append(eskisehir_bus6)
twod_list6.append(eskisehir_train6)

list_examples.append(twod_list1)
list_examples.append(twod_list2)
list_examples.append(twod_list3)
list_examples.append(twod_list4)
list_examples.append(twod_list5)
list_examples.append(twod_list6)

###########################################################################################
#EXAMPLES WITH RANDOM MATRIX GENERATOR
###########################################################################################

from random import randrange

lengths = [5, 10, 15, 20, 25, 30, 35, 40]
for x in range(len(lengths)):
  length = lengths[x]

  twod_list_example = []
  for i in range(length):
    temp = []
    for j in range(length):
      temp.append(0)
    twod_list_example.append(temp)

  for i in range(length):
    for j in range(length):
      num = 0
      if i != j:
        num = randrange(-1,10)
        while num == 0:
          num = randrange(-1,10)
      twod_list_example[i][j] = num
      twod_list_example[j][i] = num
  
  list_examples.append(twod_list_example)

###########################################################################################
#ALGORITHM TO TOURIST PROBLEM
###########################################################################################

def func(twod_list):
  import sys
  import time
  def find_quickest_itinerary(twod_list, visited, departure_idx, goal_idx, twod_list_memo, prev_goals):
    quickest_itinerary = 0
    if twod_list_memo[departure_idx][goal_idx] == -3: #if the subproblem is solved before
      if twod_list[departure_idx][goal_idx] == 0: #if departure_idx is equal to goal_idx
        twod_list_memo[departure_idx][goal_idx] = 0
        twod_list_memo[goal_idx][departure_idx] = 0
        quickest_itinerary = 0
      elif twod_list[departure_idx][goal_idx] > 0: #if there is an edge between departure_idx and goal_idx
        neighbors = [sys.maxsize]
        neighbors.append(twod_list[departure_idx][goal_idx])
        i = 0
        flag_neighbor = False
        while i < len(twod_list):
          if twod_list[goal_idx][i] > 0 and i != departure_idx and (i, goal_idx) != prev_goals and i not in visited: #if it is a neighbor
            new_goal = i
            visited.append(i)
            neighbor_to_add = find_quickest_itinerary(twod_list, visited, departure_idx, new_goal, twod_list_memo,(goal_idx, new_goal)) + twod_list[goal_idx][new_goal]
            neighbors.append(neighbor_to_add)
          elif twod_list[goal_idx][i] > 0 and i != departure_idx and (i, goal_idx) == prev_goals: #if it is visited before
            flag_neighbor = True
          i = i + 1
        neighbors.sort()
        if neighbors != [sys.maxsize] and not flag_neighbor:
          twod_list_memo[departure_idx][goal_idx] = neighbors[0]
          twod_list_memo[goal_idx][departure_idx] = neighbors[0]
        quickest_itinerary = neighbors[0]
      elif twod_list[departure_idx][goal_idx] == -1: #if there is not an edge between departure_idx and goal_idx
        neighbors = [sys.maxsize]
        i = 0
        flag_neighbor = False
        while i < len(twod_list):
          if twod_list[goal_idx][i] > 0 and i != departure_idx and (i, goal_idx) != prev_goals and i not in visited: #if it is a neighbor
            new_goal = i
            visited.append(i)
            neighbor_to_add = find_quickest_itinerary(twod_list, visited, departure_idx, new_goal, twod_list_memo,(goal_idx, new_goal)) + twod_list[goal_idx][new_goal]
            neighbors.append(neighbor_to_add)
          elif twod_list[goal_idx][i] > 0 and i != departure_idx and (i, goal_idx) == prev_goals: #if it is visited before
            flag_neighbor = True
          i = i + 1
        neighbors.sort()
        if neighbors != [sys.maxsize] and not flag_neighbor:
          twod_list_memo[departure_idx][goal_idx] = neighbors[0]
          twod_list_memo[goal_idx][departure_idx] = neighbors[0]
        quickest_itinerary = neighbors[0]
      else: #no such station, twod_list[departure_idx][goal_idx] == -2
        twod_list_memo[departure_idx][goal_idx] = sys.maxsize -1
        twod_list_memo[goal_idx][departure_idx] = sys.maxsize -1
        quickest_itinerary = sys.maxsize - 1
    else: #the subproblem is solved before
      quickest_itinerary = twod_list_memo[departure_idx][goal_idx]
    return quickest_itinerary

  twod_list_memo = []
  for i in range(len(twod_list)):
    temp = []
    for j in range(len(twod_list)):
      temp.append(-3)
    twod_list_memo.append(temp)

  departure_idx = 0
  values = []
  visited = []

  start_time = time.time()
  for x in range(len(twod_list)):
    tab = 0
    goal_idx = x
    quickest_itinerary = find_quickest_itinerary(twod_list, visited, departure_idx, goal_idx, twod_list_memo, (-1,-1))
    values.append(quickest_itinerary)
    visited = []
  end_time = time.time()

  if len(values) == 0:
      print("There is no city in the set")

  x = 0
  while x < len(values) - 1:
    if len(values) == 2:
      print("There is only one city in the set")
    else:
      if x != departure_idx and x+1 != departure_idx:
        if values[x] < 1:
          print(values[x+1])
        elif values[x+1] < 1:
          print(values[x])
        elif values[x] < values[x+1]:
          print(values[x])
        else:
          print(values[x+1])
    x = x + 2

  time = end_time - start_time
  print("---")
  print(time)
  print("---")
  return time

for x in range(len(list_examples)):
  print("EXAMPLE ", x+1, ":", sep="")
  twod_list = list_examples[x]
  func(twod_list)

###########################################################################################
#PLOT THE RESULTS WITHIN A GRAPH
###########################################################################################

import numpy as np
import matplotlib.pyplot as plt

plt.xlabel('input size')
plt.ylabel('time')

x = [5, 10, 15, 20, 25, 30, 35, 40]
y = [8.630752563476562e-05, 0.0005786418914794922, 0.0018513202667236328, 0.004628181457519531, 0.0066220760345458984, 0.01007533073425293, 0.01890254020690918, 0.0287473201751709]

plt.plot(x, y)