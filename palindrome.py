words = ["madam", "orange", "kayak", "Monday", "teacher", "racecar", "nursesrun", "abcde"]


def is_palindrome(mylist):
    for word in mylist:
        if word == word[::-1]:
            print(f"{word} is a palindrome")

        else:
            print(f"{word} is not a palindrome")


is_palindrome(words)