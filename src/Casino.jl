module Casino

using StatsBase

include("yams.jl")
include("roulette.jl")
export lancer_des
export combinaison
export lancer_jusqua_yams
export Joueur
export lancer_roulette
export rouge
export couleur
export parite
export manque_passe
export Pari
end