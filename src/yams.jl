mutable struct Joueur_Yams
    nom::String
    solde::Float64
    nb_parties::Int
end


struct ResultatYams
    des::Vector{Int}
    combinaison::String
    mise::Float64
    gain::Float64
end


function lancer_des()
    return rand(1:6, 5)
end


function combinaison(des)
    freq = sort(collect(values(countmap(des))))

    if freq == [5]
        return "yams"

    elseif freq == [1,4]
        return "carre"

    elseif freq == [2,3]
        return "full"

    elseif  freq == [1,1,3]
        return "brelan"

    elseif freq == [1,2,2]
        return "double paire"

    elseif freq == [1,1,1,2]
        return "paire"

    else
        return "autre"
    end
end

function lancer_jusqua_yams()
    i = 0

    while true
        i += 1
        des = lancer_des()

        if combinaison(des) == "yams"
            break
        end
    end

    return i
end

function multiplicateur(combinaison)
    if combinaison == "paire"
        return 1
    elseif combinaison == "double_paire"
        return 2
    elseif combinaison == "brelan"
        return 3
    elseif combinaison == "full"
        return 5
    elseif combinaison == "carre"
        return 10
    elseif combinaison == "yams"
        return 50
    else
        return 0
    end
end

function gain(mise, combinaison)
    return mise * multiplicateur(combinaison)
end

function jouer_yams(mise)
    if mise <= 0
        throw(ArgumentError("La mise doit être positive"))
    end
    des = lancer_des()
    comb = combinaison(des)
    montant = gain(mise, comb)

    return ResultatYams(des, comb, mise, montant)
end

function jouer_yams(joueur::Joueur_Yams, mise::Real)

    # Vérifier que la mise est valide
    if mise <= 0
        throw(ArgumentError("La mise doit être positive"))
    end

    # Vérifier que le joueur a suffisamment d'argent
    if joueur.solde < mise
        throw(ArgumentError("Solde insuffisant"))
    end

    # Déduire la mise du solde
    joueur.solde -= mise

    # Jouer une partie avec la première méthode
    resultat = jouer_yams(mise)

    # Ajouter le gain au solde
    joueur.solde += resultat.gain

    # Incrémenter le nombre de parties
    joueur.nb_parties += 1

    return resultat
end