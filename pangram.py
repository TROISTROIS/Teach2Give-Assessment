from string import ascii_lowercase as lower
def is_pangram(my_string):
    return set(lower)-set(my_string.lower()) == set([])
sentence = input("Enter the string: ")
if is_pangram(sentence) == True:
    print("The sentence ({}) is a pangram".format(sentence))
else:
    print("The sentence ({}) is not a pangram".format(sentence))