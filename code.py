# %% [markdown]
# ## Carga de regex_limpio.yml → DataFrame

# %%
import yaml
import pandas as pd

def load_regexes(path: str = "regex_limpio.yml") -> pd.DataFrame:
    with open(path, encoding="utf-8") as f:
        data = yaml.safe_load(f)

    rows = []
    for nombre, campos in data["regexes"].items():
        rows.append({
            "nombre":              nombre,
            "categoria_codigo":    campos.get("categoria_codigo"),
            "categoria_nombre":    campos.get("categoria_nombre"),
            "subcategoria_codigo": campos.get("subcategoria_codigo"),
            "subcategoria_nombre": campos.get("subcategoria_nombre"),
            "regex":               campos.get("regex", "").strip(),
        })

    return pd.DataFrame(rows)

# %%
df = load_regexes("regex_limpio.yml")
df

# %%
print(f"Total entradas: {len(df)}")
df.groupby("categoria_nombre")["nombre"].count()
