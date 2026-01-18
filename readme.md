
# 🐧 Projekt Zaliczeniowy: Wstęp do Systemów Linux

Witaj w repozytorium projektu zaliczeniowego. Projekt ten stanowi cyfrowe portfolio demonstrujące praktyczne umiejętności z zakresu automatyzacji w powłoce **Bash**, składu tekstu w systemie **LaTeX** oraz kontroli wersji **Git**.

---

## 🎯 Cel Projektu
Głównym celem repozytorium jest prezentacja rozwiązań z zakresu:
- **Automatyzacji zadań administracyjnych** (sortowanie plików, zarządzanie duplikatami).
- **Tworzenia profesjonalnej dokumentacji technicznej** przy użyciu systemu LaTeX.
- **Pracy z systemem kontroli wersji** zgodnie z dobrymi praktykami (Git Flow, gałęzie `main`/`develop`, Pull Requesty).

---

## 📂 Struktura i Zawartość

### 1. Skrypty Bash (`/bash`)
Katalog zawiera narzędzia usprawniające pracę z plikami w systemie Linux.

*   **`bash/classification/organizer.sh`** – Skrypt do automatycznego sortowania plików.
    *   **Funkcjonalność:** Przenosi pliki (mv) z katalogu wejściowego do podkatalogów opartych na rozszerzeniach plików.
    *   **Cechy:** Obsługuje dynamiczny argument katalogu docelowego (domyślnie `classified/`).
*   **`bash/duplicates/duplikator.sh`** – Zaawansowane narzędzie do usuwania duplikatów.
    *   **Funkcjonalność:** Wyszukuje pliki o identycznej sumie kontrolnej (MD5).
    *   **Zaawansowane:** Wykorzystuje **tablice asocjacyjne** do grupowania wszystkich kopii pliku przed wyświetleniem raportu.
    *   **Interakcja:** Umożliwia użytkownikowi interaktywne decydowanie o usunięciu każdego znalezionego duplikatu (`[t/N]`).

### 2. Dokumentacja LaTeX (`/latex`)
Katalog zawiera pliki źródłowe `.tex` oraz skompilowane dokumenty PDF.

*   **`latex/instruction/`** – Instrukcja techniczna: *"Konfiguracja połączenia zdalnego (VPN + WinSCP)"*.
    *   Dokumentacja procesu łączenia z siecią uniwersytecką.
    *   Zawiera autorskie zrzuty ekranu, w tym diagnostykę sieci (analiza problemów z `ping`) oraz weryfikację logowania.
*   **`latex/script/`** – Połączony skrypt dla studentów.
    *   Demonstracja łączenia wielu plików źródłowych (`\input`) w jeden spójny dokument.

---

## 🚀 Instrukcja Użytkowania

### Uruchamianie skryptów Bash
Aby skorzystać ze skryptów, należy nadać im uprawnienia do wykonywania:

```bash
chmod +x bash/classification/organizer.sh
chmod +x bash/duplicates/duplikator.sh
```

**Przykłady użycia:**

1.  **Sortowanie plików:**
    ```bash
    ./bash/classification/organizer.sh [katalog_źródłowy] [katalog_docelowy]
    # Np.: ./organizer.sh inbox my_sorted_files
    ```

2.  **Wyszukiwanie duplikatów:**
    ```bash
    ./bash/duplicates/duplikator.sh [katalog_do_przeszukania]
    ```

### Kompilacja dokumentów LaTeX
Wymagane środowisko TeX (np. MiKTeX/TeX Live) oraz Perl (dla `latexmk`).

1.  Otwórz folder projektu w **VS Code** z rozszerzeniem *LaTeX Workshop*.
2.  Otwórz plik `main.tex` w wybranym podkatalogu.
3.  Użyj polecenia **Build LaTeX project**.

Gotowe pliki PDF (`instruction.pdf`, `script_wdlk.pdf`) znajdują się w odpowiednich katalogach.

---

## 🛠 Technologie
*   **System:** Linux / Windows (Git Bash/WSL)
*   **Języki:** Bash, LaTeX
*   **Narzędzia:** Git, Visual Studio Code, MiKTeX, Strawberry Perl

---

## 👤 Autor
**Imię i Nazwisko:** Maria Junak
**Projekt wykonany w ramach przedmiotu:** Wstęp do laboratorium komputerowego
*Wygenerowano przy wsparciu asystenta AI zgodnie z wymogami zadania.*
