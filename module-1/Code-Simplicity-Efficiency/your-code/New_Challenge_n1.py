
numbers_letters={"zero":0,"one":1,"two":2,"three":3,"four":4,"five":5}
print('Welcome to this calculator!\nIt can add and subtract whole numbers from zero to five')

choice_first_number= input('Please choose your first number (zero to five): ').lower()
x=numbers_letters[choice_first_number]

choice_operation= input('What do you want to do? plus or minus: ').lower()

choice_second_number= input('Please choose your second number (zero to five): ').lower()
y=numbers_letters[choice_second_number]

if choice_operation =="plus":
    plus_operation=(x+y)
    result = [number for number, word in numbers_letters.items() if word == plus_operation]
    print("Your result is:", result)

else:
    minus_operation=(x-y)
    result = [number for number, word in numbers_letters.items() if word == minus_operation]
    print("Your result is:", result)

print("Thanks for using this calculator, goodbye :)")
