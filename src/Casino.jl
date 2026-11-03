module Casino

using StatsBase

#abstract types communs
abstract type AbstractGamer end
abstract type AbstractGame end

#Yams
export Joueur_Yams
export ResultatYams
export combinaison
export lancer_jusqua_yams
export multiplicateur
export gain
export jouer_yams
export simule_Yams

include("yams.jl")

# Roulette
export RouletteGamer, RouletteGame,  RouletteResult 
export Pari, bet!
export RougeBet, NumeroBet, NoirBet, PairBet, ImpairBet, ManqueBet, PasseBet
export parite, manque_passe, couleur
export verifier_pari, prelever_mise, pari_gagnant
export calculer_gain, ajouter_gain


include("roulette.jl")

#Craps
export AbstractGame
export AbstractGamer
export passline
export sumdes
export dontpass
export prop
export dontcome
export come



include("craps.jl")


end