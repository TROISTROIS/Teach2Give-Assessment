# Write a program that accepts a string as input, capitalizes the first letter of each
# word in the string, and then returns the result string.
# Examples:
# "hi"=> returns "Hi"
# "i love programming"=> returns "I Love Programming"

input_string = input("Enter a string:")


def capitalize(string):
    for word in string.split():
        string = string.replace(word, word.capitalize())
    return string


print(f"Output:{(capitalize(input_string))}")