# Needed for Lesson 1
import seaborn
iris = seaborn.load_dataset('iris')

# Needed for Lessons 4 & 5
from sklearn import datasets
faces = datasets.fetch_lfw_people()

# Needed for Lesson 5
digits_train = datasets.fetch_20newsgroups(subset='train')
digits_test = datasets.fetch_20newsgroups(subset='test')
