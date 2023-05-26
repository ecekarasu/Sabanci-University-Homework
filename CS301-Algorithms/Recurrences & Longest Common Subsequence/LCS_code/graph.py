# -*- coding: utf-8 -*-
"""graph.ipynb

Automatically generated by Colaboratory.

Original file is located at
    https://colab.research.google.com/drive/1k0W8U5aAIG4zQpy4ePPMn42X95gJ82GA
"""

import matplotlib.pyplot as plt
import numpy as np

x = np.arange(5, 26, 5)
times_naive = [7.58e-05, 9.96e-02, 4.17e+01, 37082.75, 259200]
times_memo = [1.81e-05, 4.91e-05, 1e-04, 1.9e-04, 2.71e-04]
plt.plot(x, times_naive, x, times_memo, linewidth=2.0)
plt.xticks(np.arange(5,26,5))

plt.xlabel('length')
plt.ylabel('time (s)')

plt.legend(('naive', 'memoziation'))

plt.show()