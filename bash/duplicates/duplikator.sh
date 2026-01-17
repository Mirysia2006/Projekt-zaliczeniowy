


#!/bin/bash

# Katalog do przeszukania (argument 1 lub domyślnie "files")
SEARCH_DIR=${1:-"files"}

if [ ! -d "$SEARCH_DIR" ]; then
    echo "Katalog '$SEARCH_DIR' nie istnieje."
    exit 1
fi

# ZADANIE: (Zaawansowane) Użycie tablicy asocjacyjnej
declare -A file_hashes

echo "Analizowanie plików w katalogu $SEARCH_DIR..."

# 1. Obliczanie sum kontrolnych i grupowanie plików
# Iterujemy po wszystkich plikach w katalogu
for file in "$SEARCH_DIR"/*; do
    if [ -f "$file" ]; then
        # Oblicz sumę MD5 (pierwsze pole wyniku md5sum)
        checksum=$(md5sum "$file" | awk '{print $1}')
        
        # Dopisz ścieżkę pliku do tablicy pod kluczem sumy kontrolnej
        # Oddzielamy pliki znakiem nowej linii, aby łatwo je potem czytać
        file_hashes["$checksum"]+="$file"$'\n'
    fi
done

# 2. Raportowanie i usuwanie
echo "--- Raport Duplikatów ---"

for checksum in "${!file_hashes[@]}"; do
    # Pobierz listę plików dla danej sumy
    file_list="${file_hashes[$checksum]}"
    
    # Policz ile plików ma tę samą sumę (liczymy linie)
    count=$(echo -n "$file_list" | grep -c '^')

    # Jeśli jest więcej niż 1 plik, to mamy duplikaty
    if [ "$count" -gt 1 ]; then
        echo ""
        echo "Znaleziono duplikaty dla sumy: $checksum ($count pliki):"
        echo "$file_list"
        echo "--- Interaktywne usuwanie ---"

        # Iterujemy po każdym pliku w grupie duplikatów
        # Używamy konstrukcji 'while read' z przekierowaniem stringa
        while IFS= read -r file_path; do
            if [ -n "$file_path" ]; then
                # ZADANIE: Interaktywne usuwanie (read -p i if)
                # < /dev/tty jest potrzebne, żeby read działał wewnątrz pętli
                read -p "Czy usunąć plik $(basename "$file_path")? [t/N] " odpowiedz < /dev/tty
                
                if [[ "$odpowiedz" == "t" || "$odpowiedz" == "T" ]]; then
                    rm "$file_path"
                    echo "-> Usunięto: $file_path"
                else
                    echo "-> Pozostawiono: $file_path"
                fi
            fi
        done <<< "$file_list"
    fi
done

echo ""
echo "Zakończono pracę."