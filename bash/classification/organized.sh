

#!/bin/bash

# Ustawienie katalogu wejściowego (pierwszy argument lub domyślnie "inbox")
INDIR=${1:-"inbox"}

# ZADANIE: Dynamiczny katalog wyjściowy
# Drugi argument to katalog docelowy. Jeśli nie podano, domyślnie "classified".
OUTDIR=${2:-"classified"}

# Sprawdzenie czy katalog wejściowy istnieje
if [ ! -d "$INDIR" ]; then
    echo "Błąd: Katalog wejściowy '$INDIR' nie istnieje."
    exit 1
fi

# Tworzenie katalogu wyjściowego jeśli nie istnieje
mkdir -p "$OUTDIR"

echo "Rozpoczynam sortowanie z '$INDIR' do '$OUTDIR'..."

# Pętla po plikach w katalogu wejściowym
for file in "$INDIR"/*; do
    # Sprawdzenie czy to plik (a nie katalog)
    if [ -f "$file" ]; then
        # Wyciągnięcie rozszerzenia pliku
        filename=$(basename "$file")
        extension="${filename##*.}"
        
        # Jeśli plik nie ma rozszerzenia, wrzuć go do folderu "other"
        if [ "$filename" == "$extension" ]; then
            extension="other"
        fi

        # Tworzenie podkatalogu dla danego rozszerzenia
        mkdir -p "$OUTDIR/$extension"

        # ZADANIE: Zamiana kopii na przenoszenie (mv zamiast cp)
        mv "$file" "$OUTDIR/$extension/"
        
        echo "Przeniesiono: $filename -> $OUTDIR/$extension/"
    fi
done

echo "Sortowanie zakończone."