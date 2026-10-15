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

    types_valides = ["rouge","noir", "pair", "impair", "manque", "passe"] # gere le problemes des majuscules et minuscules
    type = lowercase(pari.type_pari)
    if !(type in types_valides)
        error("Type de pari invalide. Les types valides sont : $(types_valides).")
    elseif pari.mise <= 0
        error("La mise doit être un montant positif.")
    elseif pari.mise > joueur.capital
        error("Vous n'avez pas assez de capital pour ce pari.")
    else
        println("Pari valide : $(pari.type_pari) avec une mise de $(pari.mise)€.")
        return true
    end
    
end

function prelever_mise(joueur::Joueur, pari::Pari)
    if verifier_pari(pari, joueur)
        joueur.capital = joueur.capital - pari.mise
        println("Mise de $(pari.mise)€ prélevée. Capital restant : $(joueur.capital)€.")
    end
end

function pari_gagnant(pari::Pari, numero::Int)
    type=lowercase(pari.type_pari)

    if type == "rouge" && lowercase(couleur(numero)) == "rouge"
        return true
    elseif type == "noir" && lowercase(couleur(numero)) == "noir"
        return true
    elseif type == "pair" && parite(numero) == :pair
        return true
    elseif type == "impair" && parite(numero) == :impair
        return true
    elseif type == "manque" && lowercase(manque_passe(numero)) == "manque"
        return true
    elseif type == "passe" && lowercase(manque_passe(numero)) == "passe"
        return true
    else
        return false
    end
end

function calculer_gain(pari::Pari, numero::Int)
    if pari_gagnant(pari, numero)
        return pari.mise * 2
    else
        return 0.0
    end
    
end

function ajouter_gain(joueur::Joueur, gain::Float64)
    joueur.capital = joueur.capital + gain
    return  joueur.capital
    println("Gain de $(gain)€ ajouté. Nouveau capital : $(joueur.capital)€.")
end