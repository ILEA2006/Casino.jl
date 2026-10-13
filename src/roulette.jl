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

function verifier_pari(pari::Pari, joueur::Joueur)

    types_valides = ["numero", "rouge","noir", "pair", "impair", "manque", "passe"] # gere le problemes des majuscules et minuscules
    if !(pari.type_pari in types_valides)
        error("Type de pari invalide. Les types valides sont : $(types_valides).")
    elseif pari.mise <= 0
        error("La mise doit être un montant positif.")
    elseif pari.mise > joueur.capital
        error("Vous n'avez pas assez de capital pour ce pari.")
    else
        println("Pari valide : $(pari.type_pari) avec une mise de $(pari.mise).")
        #return true
    end
    
end