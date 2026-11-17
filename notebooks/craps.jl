try; import KaimonSlate; catch; error("This is a Kaimon Slate notebook — running it as plain Julia needs the KaimonSlate runtime in this environment. Add it with `import Pkg; Pkg.add(\"KaimonSlate\")`, or open it in Kaimon Slate."); end; KaimonSlate.standalone!(@__MODULE__; dir=@__DIR__)

#%% md id=intro
@md"""
# New Notebook
"""

#%% code id=187732
using Casino

#%% code id=45bbef
using WGLMakie
joueur1=CrapsGamer(100,20)
#les boutons ne sont pas encore interractifs
#figC=Figure()
#figC = Figure(size = (1000, 600))
#btn1 = Makie.Button(figC[1,1], label="pass line", tellwidth=false)
#btn2 = Makie.Button(figC[2,1], label="don't pass", tellwidth=false)
#ici faudra un moyen de donner le pari (entre 1 et 6 sur un lancer de des)
#btn3= Makie.Button(figC[3,1], label="prop", tellwidth=false)
#btn4= Makie.Button(figC[4,1],label="come", tellwidth=false)
#btn5= Makie.Button(figC[5,1], label="don't come", tellwidth=false)

#%% code id=dad4d9
#gestion bouton pass line
#ne fonctionne pas encore 
#if (btn1.clicks==true) then
 #   passline(a,joueur1)
  #  #pour voir le solde et la mise
   # test1=Label(figC[6,1], joueur1)
#end

#%% code id=7ff7f3
function lancer_interface_craps(solde_depart=100.0)
    # 1. Initialisation du joueur
    joueur = CrapsGamer(solde_depart, 20)

    # 2. Création des Observables
    obs_solde = Observable(joueur.capital)
    obs_historique = Observable(Float64[joueur.capital])
    #obs_dernier_lance = Observable([0, 0, 0, 0, 0])
    obs_message = Observable("Prêt à lancer les dés !")

    # 3. Création de la figure (élargie pour le côte à côte)
    figC = Figure(size = (1300, 600))

    # ==========================================
    # --- COLONNE GAUCHE : PANNEAU DE CONTRÔLE
    # ==========================================
    panneau_gauche = figC[1, 1] = GridLayout(tellwidth=true)

    # Zone 1 : Jouer 1 partie
    Makie.Label(panneau_gauche[1, 1], "Mise unitaire :", halign=:left)
    slider_mise = Makie.Slider(panneau_gauche[1, 2], range = 1:1:50, startvalue = 5, width=150)
    Makie.Label(panneau_gauche[1, 3], @lift("$($(slider_mise.value)) €"), halign=:left) 
    btn_jouer = Makie.Button(panneau_gauche[2, 1:3], label = "Miser", buttoncolor = :lightblue)

    # Zone 2 : Simuler N parties
    Makie.Label(panneau_gauche[3, 1], "Nb parties :", halign=:left)
    slider_n = Makie.Slider(panneau_gauche[3, 2], range = 10:5:50, startvalue = 10, width=150)
    Makie.Label(panneau_gauche[3, 3], @lift("$($(slider_n.value))"), halign=:left)
    btn_jouer_n = Makie.Button(panneau_gauche[4, 1:3], label = "Simuler N parties", buttoncolor = :lightgreen)

    # Zone 3 : Reset
    btn_reset = Makie.Button(panneau_gauche[5, 1:3], label = "Réinitialiser la partie", buttoncolor = :lightcoral)

    # Espace vide pour aérer entre les boutons et le texte
    Makie.Label(panneau_gauche[6, 1:3], "", height=20) 

    # Zone 4 : Affichage des résultats en direct
    Makie.Label(panneau_gauche[7, 1:3], @lift("Solde : $(round($(obs_solde), digits=2)) €"), fontsize = 24, font = :bold)
    #Makie.Label(panneau_gauche[8, 1:3], @lift("Dés : $(join($(obs_dernier_lance), " - "))"), fontsize = 18)
    Makie.Label(panneau_gauche[9, 1:3], obs_message, fontsize = 16, color = :purple)


    # ==========================================
    # --- COLONNE DROITE : BOUTONS
    # ==========================================
    panneau_droite= figC[1,3]
    btn1 = Makie.Button(panneau_droite[1,2], label="pass line", tellwidth=false)
    btn2 = Makie.Button(panneau_droite[2,2], label="don't pass", tellwidth=false)
    #ici faudra un moyen de donner le pari (entre 1 et 6 sur un lancer de des)
    btn3= Makie.Button(panneau_droite[3,2], label="prop", tellwidth=false)
    btn4= Makie.Button(panneau_droite[4,2],label="come", tellwidth=false)
    btn5= Makie.Button(panneau_droite[5,2], label="don't come", tellwidth=false)
    btnd=Makie.Button(panneau_droite[6,2], label="Lancer le des", tellwidth=false, buttoncolor= :red)
    
    ax = Axis(figC[1, 2], 
              title = "Évolution du solde au fil du temps", 
              xlabel = "Nombre de parties jouées", 
              ylabel = "Solde (€)")
    
    lines!(ax, obs_historique, color = :blue, linewidth = 2)


    # ==========================================
    # --- LOGIQUE INTERACTIVE (Callbacks)
    # ==========================================
    on(btn_jouer.clicks) do _
        mise = slider_mise.value[]
        if joueur.capital >= mise
            obs_message="vous pouvez parier"
        else
            obs_message[] = "❌ Solde insuffisant pour miser $(mise) € !"
        end
    end

    on(btnd.clicks) do _
        a=sumdes
        obs_message[]="res dés= $(a)"
    end
    
    on(btn1.clicks) do _
        #pass line 
        if btnd.clicks>0
            passline(a,joueur)
            obs_message[]="pass line fait $(a), $(joueur)"
        else
            obs_message="Vous n'avez pas lacé les dés"
        end
    end

    on(btn2.clicks) do _
        #dont pass
        if btnd.clicks>0
            dontpass(a,joueur)
            obs_message[]="dont pass fait $(a), $(joueur)"
        else
            obs_message="Vous n'avez pas lacé les dés"
        end
    end

    on(btn3.clicks) do _
        #proposition (trouver comment mettre une zone à éditer)
    obs_message[]="prop fait"
    end

    on(btn4.clicks) do _
        #come bet
        if btnd.clicks>0
            come(a,joueur)
            obs_message[]="come bet: $(a), $(joueur)"
         else
            obs_message="Vous n'avez pas lacé les dés"
        end   
    end

    on(btn5.clicks) do _
        #don't come bet
        if btnd.clicks>0
            dontcome(a, joueur)
            obs_message[]="dont come bet: $(a), $(joueur)"
        else
            obs_message="Vous n'avez pas lacé les dés"
        end  
    end

    on(btn_reset.clicks) do _
        joueur.solde = solde_depart
        joueur.nb_parties = 0

        obs_solde[] = solde_depart
        obs_historique[] = [solde_depart]
        obs_dernier_lance[] = [0,0,0,0,0]
        obs_message[] = "Prêt à lancer les dés !"
        autolimits!(ax)
    end

    return figC
end

#%% code id=54ffd1
WGLMakie.activate!()
figC=lancer_interface_craps(100.0)
display(figC)

# ╔═╡ Slate.config · per-notebook settings (Settings panel)
#   docid = 94ba17ce-80e2-4afd-8610-97f415bfc05f
#   format = 2
# ╚═╡
