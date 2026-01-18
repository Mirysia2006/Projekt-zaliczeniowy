


SEARCH_DIR=${1:-"files"}

if [ ! -d "$SEARCH_DIR" ]; then
    echo "Katalog '$SEARCH_DIR' nie istnieje."
    exit 1
fi


declare -A file_hashes

echo "Analizowanie plików w katalogu $SEARCH_DIR..."


for file in "$SEARCH_DIR"/*; do
    if [ -f "$file" ]; then

        checksum=$(md5sum "$file" | awk '{print $1}')
        

        file_hashes["$checksum"]+="$file"$'\n'
    fi
done


echo "--- Raport Duplikatów ---"

for checksum in "${!file_hashes[@]}"; do

    file_list="${file_hashes[$checksum]}"
    

    count=$(echo -n "$file_list" | grep -c '^')


    if [ "$count" -gt 1 ]; then
        echo ""
        echo "Znaleziono duplikaty dla sumy: $checksum ($count pliki):"
        echo "$file_list"
        echo "--- Interaktywne usuwanie ---"


        while IFS= read -r file_path; do
            if [ -n "$file_path" ]; then
 
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