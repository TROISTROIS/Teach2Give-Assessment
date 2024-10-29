# Write a Python function to check whether a string is pangram or not. (Assume
# the string passed in does not have any punctuation)
# Note: Pangrams are words or sentences containing every letter of the
# alphabet at least once. For example: "The quick brown fox jumps over the
# lazy dog"

from string import ascii_lowercase as lower
def is_pangram(my_string):
    return set(lower)-set(my_string.lower()) == set([])
sentence = input("Enter the string: ")
if is_pangram(sentence) == True:
    print("The sentence ({}) is a pangram".format(sentence))
else:
    print("The sentence ({}) is not a pangram".format(sentence))