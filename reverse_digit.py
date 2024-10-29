# Write a program that takes an integer as input and returns an integer with
# reversed digit ordering.
# Examples:
# For input 500, the program should return 5.
# For input -56, the program should return -65.
# For input -90, the program should return -9.
# For input 91, the program should return 19

integer = int(input("Enter an integer value:"))


def reverse_integer(x):
    negative = x < 0
    x = abs(x)

    reversed_int = 0
    while x > 0:
        reversed_int = reversed_int * 10 + x % 10
        x //= 10
    if negative:
        reversed_int = -reversed_int

    print("Reverse of {} is {}".format(integer, reversed_int))


reverse_integer(integer)