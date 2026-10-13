mutable struct Joueur
    capital::Float64
end

function lancer_roulette()
    numero = rand(0:36)
    return numero
end

rouge = [1,3,5,7,9,12,14,16,18,19,21,23,25,27,30,32,34,36]

function couleur(numero)
    if numero == 0
        return "vert"
    elseif numero in rouge
        return "rouge"
    else
        return "noir"
    end
end

function parite(numero)
    if numero == 0
        return :aucune
    elseif iseven(numero)
        return :pair
     else
        return :impair
    end
end

function manque_passe(numero)
    if numero == 0
        return "aucune"
    elseif numero in 1:18
        return "manque"
    else
        return "passe"
    end
end

struct Pari
    type_pari::String
    mise::Float64
end