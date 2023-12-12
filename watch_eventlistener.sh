#!/bin/bash

watch_dir=/home/serg/watch
state_file="$watch_dir/.watch_state"
previous_files=()

# Перевірка наявності каталогу
if [ ! -d "$watch_dir" ]; then
    echo "Помилка: Каталог $watch_dir не існує."
    exit 1
fi

# Створення файлу стану, якщо його ще немає
touch "$state_file"

# Головний цикл
while true; do
    current_files=($(find "$watch_dir" -type f -not -path "$watch_dir/*/*" -not -name "*.back" -not -name ".*"))

    # Видалення зі списку файлів, які були переглянуті раніше
    new_files=()
    for file in "${current_files[@]}"; do
        grep -q "$file" "$state_file" || new_files+=("$file")
    done

    if [ "${#new_files[@]}" -gt 0 ]; then
        for file in "${new_files[@]}"; do
            echo "У папці $watch_dir знайдено новий файл: $file"

            # Визначення імені файлу без шляху
            file_name=$(basename "$file")

            # Визначення нового імені для файлу
            new_name="${file_name}.back"

            # Перевірка, чи файл вже має розширення .back
            if [[ "$file_name" != *".back" ]]; then
                # Перейменування файлу
                mv "$watch_dir/$file_name" "$watch_dir/$new_name"

                # Вивід вмісту нового файлу
                cat "$watch_dir/$new_name"

                # Додавання ідентифікатора файлу до файлу стану
                echo "$file" >> "$state_file"
            else
                echo "Файл вже має розширення .back: $file"
            fi
        done
    fi

    sleep 30  # Засинання на 30 секунд перед наступною перевіркою
done
