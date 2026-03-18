$file = "C:\Users\fmrom\source\repos\fmromanv\regex_limpio.yml"

# Leer el archivo y cortar hasta la linea 1184 (elimina " #" y blancos al final)
$lines = Get-Content $file -Encoding UTF8
$trimmed = $lines[0..1183]

# Construir los 8 nuevos entries con indentacion correcta (2sp entry, 4sp fields, 6sp content, 8sp items)
$newEntries = @'

  regex_cafeterias:
    categoria_codigo: D10500
    categoria_nombre: Entretenimiento
    subcategoria_codigo: D10502
    subcategoria_nombre: Cafeterias
    regex: |
      (?ix)
      (?!.*\b(
        restaurante|parrilla|asadero|bistro|brasserie|
        fast@?food|hamburguesa|burger|pizza|hot@dog|
        bar|pub|discoteca|
        supermercado|market|streaming|netflix
      )\b)
      \b(
        cafeter[ii]a(s)?|
        cafe\b|
        coff?e?e?@?(?:shop|corner|time|station)?|
        espresso|capuccino|latte|moka|
        tostao'?s?|
        juan@valde[z]?|
        starbucks|
        dunkin|
        mccafe|
        oma|
        panader[ii]a|
        pasteler[ii]a|
        reposter[ii]a|
        helader[ii]a|
        hornitos?|
        crepes(?:@?(?:y|and)@?waffles)?
      )\b

  regex_comida_rapida:
    categoria_codigo: D10500
    categoria_nombre: Entretenimiento
    subcategoria_codigo: D10503
    subcategoria_nombre: Comida rapida
    regex: |
      (?ix)
      (?!.*\b(
        restaurante(?:@(?:gourmet|bar))?|
        parrilla|asadero|bistro|buffet|
        cafeter[ii]a|cafe\b|coffee|espresso|
        bar|pub|discoteca|
        cine|teatro|
        supermercado|market
      )\b)
      \b(
        fast[-\s]?food|
        comidas?@rapidas?|
        hamburguesa(?:s)?|
        burger(?:s)?|
        pizza(?:s|eria)?|
        pizzer[ii]a|
        hot@dogs?|
        perro@caliente|
        alitas|wings|
        pollo@(?:broaster|frito|rostizado)|
        subway|kfc|mcdonald(?:'|')?s?|
        burger@king|
        dominos?|
        papa@john(?:'s)?|
        frisby|presto|kokoriko|brasa@roja|
        el@corral(?!@gourmet)|
        empanadas?|arepas?|
        tacos?|taqueria|
        sushi(?:@bar)?|
        wok|
        rappi(?:@(?:co|colombia|mx))?|
        foodtruck|
        food@court
      )\b

  regex_streaming:
    categoria_codigo: D10500
    categoria_nombre: Entretenimiento
    subcategoria_codigo: D10504
    subcategoria_nombre: Streaming
    regex: |
      (?ix)
      (?!.*\b(
        cafe|restaurant[e]?|bar|pub|
        hotel|uber|didi|rappi|
        falabella|exito|jumbo|
        peluqueria|spa|supermercado|market
      )\b)
      (
        \b(
          netflix|spotify|disney\+?|prime@?video|amazon@prime|
          hbo(@max)?|hbomax|max\b|paramount|
          youtube(@premium)?|
          deezer|apple@(music|tv)|
          crunchyroll|twitch|pluto@tv|tubi|
          chatgpt|duolingo|coursera|canva|
          steam|playstation|xbox|
          microsoft@365|office@365|
          adobe|figma
        )\b
        |
        \bdlo@google.*amazon\b
        |
        \bgoogle\*?.*(youtube(?:premium)?|one|cloud|ads|store)\b
        |
        \b(amazon\.com|apple\.com|netflix\.com|primevideo\.com)\b
      )

  regex_cine:
    categoria_codigo: D10500
    categoria_nombre: Entretenimiento
    subcategoria_codigo: D10505
    subcategoria_nombre: Cine
    regex: |
      (?ix)
      (?!.*\b(
        cafe|cafeteria|tienda|hotel|
        restaurante|bus|taxi|
        supermercado|market
      )\b)
      \b(
        cine|cinema(s)?|movies?|
        cinepolis(@[a-z]+)?|
        cinecolombia|
        procinal(@cinemas)?|
        royal@films|
        cinemark|
        multiplex|
        autocine|
        boletas?|boleteria(s)?|ticket(?:ing)?
      )\b

  regex_conciertos:
    categoria_codigo: D10500
    categoria_nombre: Entretenimiento
    subcategoria_codigo: D10506
    subcategoria_nombre: Conciertos y espectaculos
    regex: |
      (?ix)
      (?!.*\b(
        cine|cinema|restaurante|cafe|bar|
        streaming|supermercado|hotel|farmacia
      )\b)
      \b(
        concierto(s)?|
        recital(es)?|
        teatro|
        anfiteatro|
        festival(es)?@musical(es)?|
        evento(s)?@musical(es)?|
        boletas?@concierto|
        ticket(master|ing)?|
        tu@boleta|
        viagogo
      )\b

  regex_juegos:
    categoria_codigo: D10500
    categoria_nombre: Entretenimiento
    subcategoria_codigo: D10507
    subcategoria_nombre: Juegos
    regex: |
      (?ix)
      (?!.*\b(
        restaurante|cafeteria|supermercado|streaming|
        hotel|cafe|market|farmacia
      )\b)
      \b(
        videojuegos?|gaming|gamer|
        playstation|xbox|nintendo|steam|epic@games|roblox|
        casino(s)?|apuestas?|ruleta|blackjack|tragamonedas?|
        slot|betplay|rushbet|bwin|wplay|zamba|
        playland|divercity|mundo@aventura|salitre@magico|
        parques@de@diversion|diversion(es)?
      )\b

  regex_salidas_sociales:
    categoria_codigo: D10500
    categoria_nombre: Entretenimiento
    subcategoria_codigo: D10508
    subcategoria_nombre: Salidas sociales
    regex: |
      (?ix)
      (?!.*\b(
        restaurante|cafeteria|cine|supermercado|
        tienda|drogueria|charcuteria|minimarket|market
      )\b)
      \b(
        (?<!\w)bar(?!\w)|pub|sport@?bar|
        discoteca|nightclub|night\s?club|cantina|taberna|rumba|estadero|
        karaoke|
        licorera(s)?|licores?|licorexpress|distrilicor(es)?|
        dislicores|distri[-_]?licores|super@licores|
        country@licores|rancho@y@licores|
        la@\d{1,2}@licores|licor@artesanal|
        hielo[s]?@y@licores|
        (bold|rbm|sumup|izi)\*?(artur)?licor(es|era|eria|express)?|
        beer(?!@?(market|store|shop|import|distribu|mayor|factory))|
        cerve(?:za|zas|cerveria|cerverias)|
        (bold\*|rbm\*|sumup\*|izi\*)?@?cigarreria(s)?|
        estan(co|ca)|tabacos?|tabacalera|smoke@shop|
        bzamba.*(casino|sport@bar|(?<!\w)bar(?!\w)|&@?bar|plaza@del@parque)|
        luxxel@zamba|zamba(?!.*(hotel|restaurante|restaurant|gastro))|
        bolera|bowling(?!.*\b(cafe|restaurant[e]?|bar|sports?|grupo@comercial|futbolera)\b)
      )\b

  regex_eventos_culturales:
    categoria_codigo: D10500
    categoria_nombre: Entretenimiento
    subcategoria_codigo: D10509
    subcategoria_nombre: Eventos culturales
    regex: |
      (?ix)
      (?!.*\b(
        concierto|cine|cinema|bar|restaurante|
        cafe|cafeteria|supermercado|hotel
      )\b)
      \b(
        museo(s)?|galeria@de@arte|
        exposicion(es)?|feria(s)?|
        festival(es)?(?!.*musical)|
        evento(s)?@cultural(es)?|
        teatro|obra@teatral|anfiteatro
      )\b
'@

# Combinar y escribir
$content = ($trimmed -join "`n") + "`n" + $newEntries
[System.IO.File]::WriteAllText($file, $content, [System.Text.Encoding]::UTF8)
Write-Host "Done. Lines written: $(($content -split "`n").Count)"
