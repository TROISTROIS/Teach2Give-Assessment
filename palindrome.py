# Write a Python function that checks whether a word or phrase is palindrome or not.
# Note: A palindrome is word, phrase, or sequence that reads the same
# backward as forward, e.g., madam,kayak,racecar, or a phrase "nurses run"

words = ["madam", "orange", "kayak", "Monday", "teacher", "racecar", "nursesrun", "abcde"]


def is_palindrome(mylist):
    for word in mylist:
        if word == word[::-1]:
            print(f"{word} is a palindrome")

        else:
            print(f"{word} is not a palindrome")


is_palindrome(words)