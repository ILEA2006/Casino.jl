using Casino

#gains et mises a tester
craps=CrapsGame()
a=rand(craps)  #come out lancer (1er de la manche)

joueur1=CrapsGamer(100,20)
passline(craps,joueur1)

#ResultatCraps()
dontpass(craps,joueur1)

#entrer le pari
print("insérez votre pari: ")
prop(rand(craps),joueur1) #taper sur entrer 2 fois

come(craps,joueur1)
dontcome(craps,joueur1)