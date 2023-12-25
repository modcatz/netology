# https://netology.ru/profile/program/py-86/lessons/278595/lesson_items/1494980
def unames(mentors):
    # Добавьте в список всех преподавателей со всех курсов
    all_list = []
    for m in mentors:
        all_list.extend(m)
        # Допишите здесь ваш код, который заполнит all_list. Можете как складывать списки, так и использовать метод extend
    # Сделайте список all_names_list, состоящий только из имён, и заполните его
    all_names_list = []
    for mentor in all_list:
        name = mentor.split()[0]
        all_names_list.append(name)
        
    # Сделайте так, чтобы остались только уникальные имена (без повторений) - допишите ниже ваш код
    unique_names = set(all_names_list)

    # # Теперь необходимо отсортировать имена в алфавитном порядке. Подсказка: используйте sorted() для списка
    # # Допишите код ниже
    all_names_sorted = sorted(unique_names)
    # # Допишите конструкцию вывода результата. Можете использовать string.join()
    # # Результат будет в all_names_sorted
    # print(f'Уникальные имена преподавателей: {", ".join(all_names_sorted)}')
    return all_names_sorted


