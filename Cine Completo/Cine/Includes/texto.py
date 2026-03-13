import json

textos = [
    "¡Bienvenido al Mejor Cine de la Ciudad!",
    "Disfruta de nuestras ofertas y estrenos exclusivos",
    "Compra tu boleto online y evita filas",
    "No te pierdas nuestras películas 3D y IMAX"
]

# Concatenamos todos los textos en línea, separados por guion
texto_unico = " — ".join(textos)

# Repetimos 2 veces para el marquee infinito
texto_unico = texto_unico + " — " + texto_unico

print(json.dumps({"texto": texto_unico}))
