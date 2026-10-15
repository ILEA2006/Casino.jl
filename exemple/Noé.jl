using Casino

#Noé = Joueur_Yams("Noé", 100.0, 0)

println("Solde initial : ", Noé.solde)

partie = jouer_yams(Noé, 10.0)

println("Dés : ", partie.des)
println("Combinaison : ", partie.combinaison)
println("Gain : ", partie.gain)

println("Solde final : ", Noé.solde)
println("Nombre de parties : ", Noé.nb_parties)