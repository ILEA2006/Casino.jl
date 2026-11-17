mutable struct CrapsGamer <: AbstractGamer
    capital :: Int
    mise::Int
end

mutable struct ResultatCraps <: AbstractGame
    bet::Int
    sumd::Int 
    res::String 
    fres::String  
end

struct CrapsGame <: AbstractGame 
end


#Base.rand((lanceur::CrapsGame))

function Base.rand(craps:: CrapsGame)
craps=rand(1:6, 2)
sumd=craps[1]+craps[2]
return sumd
end

function lanceurcraps(craps::CrapsGame)
b=rand(craps)
return b
end

#a prends le 1er lancer de des
#b prends tous les lancers sur le point
#pari le plus general du craps (facile de gagner)
function passline(craps::CrapsGame, gamer:: AbstractGamer)
 bet=1
if(craps==7) || (craps==11)
    #gagné
    ResultatCraps.sumd=craps
    gamer.capital = gamer.capital + gamer.mise #puisqu'on a pas enlevé la mise avant
    res="gagné"
elseif (craps==2)|| (craps==3)||(craps==12)
    #perdu
    gamer.capital= gamer.capital - gamer.mise
    res="perdu"
else
    #jeu sur le point
    res="neutre"  #sans ca la fonction beugue
    sumd=craps

    b=rand(craps)
    while (b!=7) & (b!=a)
       b=rand(craps)
        if(b==a)
        res="gagne au point"
        #gagné  #joueur reprends sa mise donc pas de changement de capital 
        elseif (b==7)
        #perdu 7 qui prend
        gamer.capital=gamer.capital-gamer.mise
        res="perdu"
        end
    end
end
return gamer, bet, res
end

#même fonctionnement que passLine en inversé
function dontpass(craps::CrapsGame, gamer:: AbstractGamer)  #pari don't pass
bet=2
    if(craps==7) || (craps==11)
    #perds la mise
    gamer.capital=gamer.capital-gamer.mise
    res="perdu"
elseif (craps==2)|| (craps==3)
    #gagne ce que tu as mise
    gamer.capital=gamer.capital + gamer.mise
    res="gagné"
elseif(craps==12)
    #reprends la mise
    res="fin de manche"
else
    #joue sur le point
   #ResultatCraps.sumd=a

    b =rand(craps)
    while (b!=7) & (b!=a)
       b=rand(craps)
        if(b==craps)
          #perds la mise
          res="perdu"
        gamer.capital=gamer.capital-gamer.mise
        elseif (b==7)
          #gagne la mise 
        gamer.capital=gamer.capital+gamer.mise
        res="gagné"
        else 
        #relance le de
        end
    end 
    #sumd=a
end
return gamer, bet ,res
end

#pari proposition (chiffre precis) sur un lancer
function prop(x, gamer:: AbstractGamer)  
bet=3
s=readline()  
print("lancer= ",x)
if(x==s)
   #gagne ta mise 
  gamer.capital=gamer.mise*30
  res="gagné"
else
    gamer.capital=gamer.capital-gamer.mise
    res="perdu"
end
return gamer, bet, res
end

#comme passline mais a placer n'importe quand
function come(craps::CrapsGame, gamer:: AbstractGamer) 
bet=4
if(craps==7) || (craps==11)
    ResultatCraps.sumd=a
    gamer.capital=gamer.capital+gamer.mise
    res="gagné"
elseif (craps==2)|| (craps==3)||(craps==12)
    #preds la mise
    gamer.capital=gamer.capital-gamer.mise
    res="perdu"
else
    #jeu sur le point
    #ResultatCraps.sumd=a

    b=rand(craps)
    while (b!=7) & (b!=a)
       b=rand(craps)
        if(b==a)
        #gagne ta mise
        gamer.capital=gamer.capital+gamer.mise
        res="gagné"
        elseif (b==7)
        #perdu
        gamer.capital=gamer.capital-gamer.mise
        res="perdu"
        else 
        #relance
        end
   #ResultatCraps.sumd
    end
end
return gamer, bet, res
end

#comme dontpass mais a placer n'import quand
#a modifier pour gérer le come out roll personalisé (pareil pour come bet)
function dontcome(craps::CrapsGame, gamer:: AbstractGamer)
bet=5
if(craps==7) || (craps==11)
    ResultatCraps.sumd=a
    #perdu
    gamer.capital=gamer.capital-gamer.mise
    res="perdu"
elseif (craps==2)|| (craps==3)
    #gagne ta mise
    gamer.capital=gamer.capital+gamer.mise
    res="gagné"
elseif(craps==12)
    #reprends ta mise
    res="neutre"
else
   #ResultatCraps.sumd=a
    b=rand(craps)
    while (b!=7) & (b!=a)
       b=rand(craps)
        if(b==craps)
       #perdu au point
        gamer.capital=gamer.capital-gamer.mise
        res="perdu"
        elseif (b==7)
        #gagne ta mise
        gamer.capital=gamer.capital+gamer.mise
        res="gagné"
        end
    end 
end
return gamer, bet , res
end