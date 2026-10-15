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

joueur = Joueur(70.0)
pari = Pari("pair", 70.0)
println("Capital du joueur : ", joueur.capital)
println("Type de pari : ", pari.type_pari)
println("Montant misé : ", pari.mise) 

pari1 = Pari("imPAir", 50.0)
verifier_pari(pari1, joueur)

prelever_mise(joueur, pari)

println(pari_gagnant(Pari("rouge", 10.0),lancer_roulette()))

pari2 = Pari("Impair", 10.0)

numero = 3

println(calculer_gain(pari2, numero))


gain = calculer_gain(pari, numero)
ajouter_gain(joueur, gain)
println("Gain reçu : ", gain)
println("Capital final : ", joueur.capital)