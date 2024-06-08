# Создаем пустой JSON массив
json="["

# Проходимся по всем директориям в текущем каталоге
for dir in */; do
    # Удаляем последний символ '/'
    dir=${dir%/}
    
    # Проверяем, существуют ли необходимые файлы
    if [[ -f "$dir/index.md" && -f "$dir/title.txt" && -f "$dir/description.txt" ]]; then
        # Читаем содержимое файлов
        title=$(<"$dir/title.txt")
        description=$(<"$dir/description.txt")
        content=$(<"$dir/index.md")

        # Добавляем объект в JSON массив
        json+="{\"path\":\"$dir\",\"title\":\"$title\",\"description\":\"$description\",\"content\":\"$content\"},"
    fi
done

# Удаляем последнюю запятую и закрываем JSON массив
json=${json%,}
json+="]"

# Записываем JSON в файл
echo "$json" > output.json