
import random
import sys
database = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u','v','w', 'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def RandomStringGenerator(l=2):
    p = 0
    s = ''
    while p<l:
        s += random.choice(database)
        p += 1
    return s

def BatchStringGenerator(n,a,b):
    r = []

    for i in range(n):
        c = None
        if a < b:
            c = random.choice(range(a, b))
        else:
            sys.exit('Incorrect min and max string lengths. Try again.')
        r.append(RandomStringGenerator(c))
    return r

a = input('Enter minimum string length: ')
b = input('Enter maximum string length: ')
n = input('How many random strings to generate? ')

print(BatchStringGenerator(int(n), int(a), int(b)))