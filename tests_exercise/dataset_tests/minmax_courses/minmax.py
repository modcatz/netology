# https://netology.ru/profile/program/py-86/lessons/278596/lesson_items/1494987
def minmax_function(courses,mentors,durations):
    # В этот список будут добавляться словари-курсы
    courses_list = []
    # Допишите код, который генерирует словарь-курс с тремя ключами: "title", "mentors", "duration"
    for name, teacher, time in zip(courses,mentors,durations):
        course_dict = {"title": name, "mentors": teacher, "duration": time}
        courses_list.append(course_dict)
    # Найдите самое маленькое и самое большое значение длительности курса
    # Подсказка: используйте функции min и max для списка durations
    minx = min(durations)
    maxx = max(durations)
    # Как видите, в duration встречаются одинаковые длительности курса. Допишите код, который это учитывает
    # Подсказка 1: найдите индексы, по которым в списке durations встречается самое маленькое и самое большое значение
    # Подсказка 2: не забудьте, что индекс можно удобно получить функцией enumerate
    maxes = []
    minis = []
    for id, time in enumerate(durations):
        if time == maxx:
            maxes.append(id)
        elif time == minx:
            minis.append(id)

    # # Соберите все названия самых коротких и самых длинных курсов
    # # Так как курсов с одной длительностью может быть больше одного,
    # # создайте список названий самых коротких (courses_min) и самых длинных (courses_max) курсов
    courses_min = []
    courses_max = []
    for id in minis:
        courses_min.append(courses_list[id]["title"]) # Допишите код, который берёт по id нужный курс из courses_list и получает название курса из ключа "title"
    for id in maxes:
        courses_max.append(courses_list[id]["title"]) # По аналогии допишите такой же код для курсов максимальной длительности

    # # Допишите конструкцию вывода результата. Можете использовать string.join()
    return (f'Самый короткий курс(ы): {", ".join(courses_min)} - {minx} месяца(ев)\n'
    f'Самый длинный курс(ы): {", ".join(courses_max)} - {maxx} месяца(ев)')


