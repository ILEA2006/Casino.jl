using Casino

Noé = Joueur_Yams("Noé", 1000.0, 0)

historique = simule_Yams(Noé, 100, 10.0)

println("Solde final : ", Noé.solde)
println("Nombre de parties : ", Noé.nb_parties)
println("Historique : ", historique)