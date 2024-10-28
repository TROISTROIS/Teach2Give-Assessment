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