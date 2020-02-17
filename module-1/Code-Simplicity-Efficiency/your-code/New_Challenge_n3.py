a=[3, 4, 5]
b=[6, 8, 10]
c=[5, 12, 13]

def my_function(X):
    solutions = [(x, y, z)]
    m = 0
    for x in range(5, X):
        for y in range(4, X):
            for z in range(3, X):
                return (x * x == y * y + z * z)

    for solution in solutions:
        if m < max(solution):
           m = max(solution)
    return m

X = input("What is the maximal length of the triangle side? Enter a number: ")

