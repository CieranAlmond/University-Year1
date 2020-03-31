import random
def generateDictionary(word, lives):
    stars = ""
    for i in word:
        stars += "*"
    d = {}
    d['secretWord'] = word#store as dict.
    d['currentGuess'] = stars
    d['lives'] = lives
    return d
 
def guessed(d):
    if(d['secretWord'] == d['currentGuess']):#if word = to guess return boolean
        return True
    return False
 
def livesLeft(d):
    return d['lives']#shows lives left
 
def check(d):
    return "WORD: " + d['currentGuess'] + ";" + "you have " + str(d['lives']) + " lives left"
    #formatting word
def guessHandler(d, s):
    secret = d['secretWord']
    curr = d['currentGuess']
    tbr = ""
    counter = 0
    for i in range(len(d['secretWord'])):
        if secret[i] == s:
            tbr += s#check if guess occs in secretwrod
            counter += 1
        elif curr[i] == "*":
            tbr += "*"
        else:
            tbr += curr[i]
    if counter == 0:
        d['lives'] -= 1#if doesnt occ decrease life
    d['currentGuess'] = tbr
    return counter
 
def playGame(word, lives):
    dict = generateDictionary(word, lives)
    while (livesLeft(dict))>0 and not guessed(dict):
 
        print(check(dict))
        guess = input("Guess a letter: ")
        guess = str(guess)
        if len(guess) == 1 and guess.isupper():
            occurs = guessHandler(dict, guess)
            if occurs == 0:
                print("The letter " + guess + " does not occur in the word")
            elif occurs == 1:
                print("The letter " + guess + " occurs once in the word")
            elif occurs == 2:
                print("The letter " + guess + " occurs twice in the word")
            else:
                print("The letter " + guess + " occurs " + occurs + " times in the word")
        else:
            print("That is not an upper-case letter - try again")
 
    if livesLeft(dict) == 0:
        print("You have no lives left - you have been hung!")
        print("The word was " + dict['secretWord'])
    else:
        print("WORD: " + dict['secretWord'])
        print("Well done - you have guessed the word correctly")
 
 
 

    
fileName = input("Please input a file name!")
try:
    a = []
    difficulties = [10, 7, 5]
    openFile = open(fileName, 'r')
    for line in openFile:
        a.append(line)
    chosenWord = a[random.randrange(0, len(a))]#selects random word from line
    chosenWord = chosenWord[0: len(chosenWord)-1]#issue with having extra *
    print("\nEnter 1 for easy (10 lives)")
    print("\nEnter 2 for medium (7 lives)")
    print("\nEnter 3 for hard (5 lives)")
    difficulty = int(input("\nWhich difficulty would you like?"))
    difficulty -= 1
    difficulty = difficulties[difficulty]#refferes back to dict 
    playGame(chosenWord, difficulty)
 
 
except IOError:
    print("File does not exist")
