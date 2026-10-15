using Casino

fonds=100   #porte monnaie du joueur
gain=0
joueur(fonds,gain)
a=sumdes()  #come out lancer (1er de la manche)
PassLine(7)

DontPass(a)

#entrer le pari
print("insérez votre pari: ")
prop(sumdes()) #taper sur entrer 2 fois

come(a)
dontcome(a)