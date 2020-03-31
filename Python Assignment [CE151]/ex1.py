r = "studs.txt"
import sys
allStuds = []
global counter
def tupleMaker(inputString):
    s1 = inputString.split()
 
    # Adding the surname at the end of the string
    s2 = [s1[len(s1) - 1]]
 
    # Number of other names(no surname)
    global noOfNames
    noOfNames = len(s1) - 4
 
    # Adding all the other names
    for i in range(noOfNames):
        s2.append((s1[i + 3]))
 
    # Adding the Reg number
    s2.append(s1[0])
 
    # Adding the Degree scheme
    s2.append(s1[2])
 
    # Adding the year
    s2.append("Year " + s1[1])
 
    # Making it a tuple
    t = ()
    for i in range(len(s2)):
        t = t + (s2[i],)
    return t
 
 
def formatting(t):
    s1 = ""
    for i in range(len(t)):
        s1 += t[i]
        if (i == 0):
            s1 += ", "
        elif (i == len(t) - 4):
            s1 += "        "
        else:
            s1 += " "
    if len(t)==6:
        formatted = '{:<32} {:<6} {:<7} {}'.format(t[0]+', '+t[1]+' '+t[2],t[3],t[4],t[5])
    else:
        formatted = '{:<32} {:<6} {:<7} {}'.format(t[0]+', '+t[1],t[2],t[3],t[4])
    print(formatted)
    
    return s1
                

s = input("Enter file name: ")
# t = tupleMaker(s)
# print(formatting(t))
             

def loadfile(filename):
    try:
        openFile = open(filename, 'r')
        counter = 0
        for line in openFile:
            t=tupleMaker(line)
            s=formatting(t)
            allStuds.append(t)
            counter+=1
            #print(s)
        openFile.close()
    except IOError:
        print("File name doesnt exist. Check file name and try again.")
 
loadfile(s)




def run():
    while True:
        choice = input("\nDo you wish to display full details of all students, \n"
                       "given a supplied degree scheme, name, or year number? \n"
                       "Note, saying no will quit the program.\n(Use y or n): ")
        if choice == "y":
            print("Want to enter a degree scheme(d), name with registration number(n),\n"
                  "or year number in range 1-4(y)?: ")
            choice2 = input()
            if choice2 == "d":
                print("Enter degree scheme: ")
                allStuds.sort()
                degScheme = input()
                for i in allStuds:
                    if i[len(i) - 2] == degScheme:
                        for j in i[1:3]:
                            if j[0] != "1":
                                print(j, end=" ")
                        print(i[0])
            elif choice2 == "n":
                print("Enter name and registration number: ")
                allStuds.sort()
                nameReg = input()
                # name = nameReg(0, len(nameReg - 7))
                reg = nameReg[len(nameReg)- 7: len(nameReg)]
                for k in allStuds:
                    if k[len(k) - 3] == reg:
                        formatting(k)
            elif choice2 == "y":
                        # sort by year in specified range
                allStuds.sort()
                allStuds.sort(key=lambda tup: tup[len(tup)-1])
                requestYear = input("What year do you want: Year - []?: ")
                for i in allStuds:
                    if i[len(i)-1] == requestYear:
                        formatting(i)

        elif choice == "n":
            exit()
            return
        else:
            print("Invalid value entered.")


if __name__ == "__main__":
    run()

