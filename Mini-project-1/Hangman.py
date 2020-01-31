import random

counter_fail = 0
total_attempts = 3
category_selection = []
selection = True
while selection:
    choice = input("Do you want to play Hangman? Yes = Press Y /  No =  Press N for other games ").lower()
    if choice == 'y':
        print('GAME RULES: 3 maximum fail attempts AND letters from a to z')
        print(" ")
        choice_category = input("Select a category: for cities: (Press c)  for states: (Press s), for anything(Press a)").lower()

        if choice_category == 'c':
            print("You are playing cities, Good Luck")
            category_selection = ["delhi","beirut","berlin"]
        if choice_category == 's':
            print("You are playing States, Good Luck")
            category_selection = ["florida","idaho","texas"]
        if choice_category == 'a':
            print("You are playing anything, Good Luck")
            category_selection = ["iphone","computer","netflix"]

        secret_word = list(random.choice(category_selection))
        len_words_options = int(len(secret_word))
        found_letters = ["_"] * len_words_options
        found_letters[0] = secret_word[0]
        found_letters[-1] = secret_word[-1]
        print(" ")
        print("Guess the secret word", " ".join(found_letters))

        while counter_fail < total_attempts:
            if counter_fail== 1:
                print("1 fail -  2 Attempts remaining")
                print("   + ---+")
                print("   |    |")
                print(" ")
            if counter_fail== 2:
                print("2 fail -  1 Attempt remaining")
                print("   + ---+")
                print("   |    |")
                print("   O    |")
                print(" / |\   |")
                print(" ")
            guess_letter = input("insert a letter: ").lower()
            if guess_letter not in secret_word:
                print('Letter not in secret word')
                counter_fail += 1
                print(" ".join(found_letters))
                print(" ")
            if guess_letter in secret_word:
                print('Congratulation,you found a letter ')
                index_letter = secret_word.index(guess_letter)
                found_letters[index_letter] = guess_letter
                print(" ".join(found_letters))
                print(" ")
            if secret_word == found_letters:
                print('Congratulation you guessed the secret word ')
                break
        else:
            print('3 fail attempts reached - You did not guess the secrete word')
            print("   + ---+")
            print("   |    |")
            print("   O    |")
            print(" / |\   |")
            print("  / \   |")
            print("        |")
            print("=========")
            print('The word was ' + "".join(secret_word).upper())

    elif choice == 'n':
        print("\n")
        print("Ask Sky or Denisse, they have more games")
    else:
        print("Option not recognized")



