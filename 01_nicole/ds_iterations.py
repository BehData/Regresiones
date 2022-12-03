#try allows to foolproof ('sanity checking') inputs and variables
try:
    flc = float(stc)
except:
    print ("Error, please enter numerical input")
    quit