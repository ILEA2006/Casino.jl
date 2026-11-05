using Casino

# tester la roulette 
roulette = RouletteGame()
joueur = RouletteGamer(100.0)

pari = Pari(17, NumeroBet, 10.0)

resultat = bet!(roulette, joueur, pari)

resultat
joueur.capital
joueur.results