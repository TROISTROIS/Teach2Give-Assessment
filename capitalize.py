input_string = input("Enter a string:")


def capitalize(string):
    for word in string.split():
        string = string.replace(word, word.capitalize())
    return string


print(f"Output:{(capitalize(input_string))}")