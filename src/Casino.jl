module Casino

using StatsBase

#Yams
export Joueur
export ResultatYams
export lancer_des
export combinaison
export lancer_jusqua_yams
export multiplicateur
export gain
export jouer_yams

include("yams.jl")

# Roulette
export Joueur
export lancer_roulette
export rouge
export couleur
export parite
export manque_passe
export Pari
export verifier_pari
export prelever_mise
export pari_gagnant
export calculer_gain
export ajouter_gain

include("roulette.jl")

#Craps

export PassLine, sumdes, DontPass, prop

include("craps.jl")


end