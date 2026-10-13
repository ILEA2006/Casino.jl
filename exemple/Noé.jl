using Casino


Noé = Joueur("Noé", 100.0, 0)

Noé.solde -= 10
Noé.nb_parties += 1

println(Noé.solde)  # 90.0

partie = jouer_yams(10.0)

println(partie.des)
println(partie.combinaison)
println(partie.gain)