
#a =somme a ajouter au porte feuille du joueur
#peut etre negatif si joueur perds sa mise
#mets pas a jour ses valeurs
function joueur(fonds,a)
fonds = fonds +a
print(fonds)
end

function sumdes()
v=rand(1:6, 2)
v=v[1]+v[2]
end

#a prends le 1er lancer de des
#b prends tous les lancers sur le point
#manque gestion des mises
function PassLine(a) #pari le plus general du craps (facile de gagner)
x=(-10)
joueur(fonds,x)
if(a==7) || (a==11)
    print("gagné")  #remise de la mise
    x=20
    joueur(fonds,x)  #fonctionne pas fonction réinitialise pas la valeur
elseif (a==2)|| (a==3)||(a==12)
    print("perdu")   #mise perdue
else
    #jeu sur le point
    print("point = ", a)

    b=sumdes()
    while (b!=7) & (b!=a)
       b=sumdes()
        if(b==a)
        print("gagné ") #remise de la mise
        elseif (b==7)
        print(", 7 qui prend ")  #perds la mise
        else 
        print("relance: ")
        end
    print("des tirés: ",b, ' ')
    end
end
end


#même fonctionnement que passLine en inversé
function DontPass(a)  #pari don't pass
if(a==7) || (a==11)
    print("perdu ")  #perds la mise
elseif (a==2)|| (a==3)
    print("gagné ")   #remise du gain
elseif(a==12)
    print("reprends ta mise ")
else
   print("point = ", a)

    b=sumdes()
    while (b!=7) & (b!=a)
       b=sumdes()
        if(b==a)
        print("perdu au point ")  #perds la mise
        elseif (b==7)
        print(", 7 qui prend ")   #gagne la mise 
        else 
        print("relance: ")
        end
    print("des tirés: ",b, ' ')
    end 
end
end

function prop(x)  #pari proposition (chiffre precis)
s=readline()  
print("lancer= ",x)
if(x==s)
  print("gagné")   #gagne ta mise 
else
    print("perdu")
end
end

function come(a) #comme passline mais a placer n'importe quand
if(a==7) || (a==11)
    print("gagné ")   #prends gros gain (pari risqué)
elseif (a==2)|| (a==3)||(a==12)
    print("perdu ")
else
    #jeu sur le point
    print("point = ", a)

    b=sumdes()
    while (b!=7) & (b!=a)
       b=sumdes()
        if(b==a)
        print("gagné au point ")  #reprends ta mise
        elseif (b==7)
        print(", 7 qui prend ")  #perdu
        else 
        print("relance: ")
        end
    print("des tirés: ",b, ' ')
    end
end
end

function dontcome(a) #comme dontpass mais a placer n'import quand
if(a==7) || (a==11)
    print("perdu ")
elseif (a==2)|| (a==3)
    print("gagné ")  #gagne ta mise
elseif(a==12)
    print("reprends ta mise ")
else
   print("point = ", a)

    b=sumdes()
    while (b!=7) & (b!=a)
       b=sumdes()
        if(b==a)
        print("perdu au point ")  
        elseif (b==7)
        print(", 7 qui prend ")  #gagne ta mise
        else 
        print("relance: ")
        end
    print("des tirés: ",b, ' ')
    end 
end
end