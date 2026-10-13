using Casino
using StatsBase

des = lancer_des()

print(des)

values(countmap(des))

combinaison(des)

lancer_jusqua_yams()


joueur= Joueur(200.0)
print(joueur)
print(joueur.capital)

joueur.capital = 90.0
print(joueur.capital)

println("Le numéro gagnant est : ", lancer_roulette())
println("La couleur du numéro gagnant est : ", couleur(lancer_roulette()))

numero = lancer_roulette()
println("Numéro : ", numero)
println("Couleur : ", couleur(numero))
println("Parité : ", parite(numero))
parite(numero)
println("Catégorie : ", manque_passe(numero))

joueur = Joueur(100.0)
pari = Pari("Rouge", 10.0)
println("Capital du joueur : ", joueur.capital)
println("Type de pari : ", pari.type_pari)
println("Montant misé : ", pari.mise) 

pari1 = Pari("pair", 50.0)
verifier_pari(pari1, joueur)