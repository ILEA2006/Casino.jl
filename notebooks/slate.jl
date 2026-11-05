try; import KaimonSlate; catch; error("This is a Kaimon Slate notebook — running it as plain Julia needs the KaimonSlate runtime in this environment. Add it with `import Pkg; Pkg.add(\"KaimonSlate\")`, or open it in Kaimon Slate."); end; KaimonSlate.standalone!(@__MODULE__; dir=@__DIR__)

#%% md id=intro
@md"""
# Mon notebook
"""

#%% code id=f3c9e0
import Pkg; Pkg.activate(".")

#%% code id=5dc8fa
using Casino

#%% code id=1701e2

# ╔═╡ Slate.config · per-notebook settings (Settings panel)
#   docid = 349d6240-7636-4e8e-bb5f-f2e82b54fc8a
# ╚═╡
