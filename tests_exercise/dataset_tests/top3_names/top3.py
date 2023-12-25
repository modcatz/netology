# https://netology.ru/profile/program/py-86/lessons/278595/lesson_items/1494981
#решила по фану написать qsort
def desc_sort(arr):
    if len(arr)<=1:
        return arr
    else:
        pivot = arr[0]
        less = []
        more = []
        for x in arr[1:]:
            less.append(x) if x[1] > pivot[1] else more.append(x)
        result = desc_sort(less) + [pivot]+ desc_sort(more)
        return result

def top3_function(mentors):
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

    # Подсчитайте встречаемость каждого имени через list.count()
    popular = []
    for name in unique_names:
        count = all_names_list.count(name)
        popular.append([name, count]) # Добавьте подсчёт имён
    # Это код для сортировки списка с элементами вида [имя, количество] по убыванию встречаемости
    # Используйте его, как есть, или напишите собственный :)
    #popular.sort(key=lambda x:x[1], reverse=True)

    # Получите топ-3 часто встречающихся имён из списка popular
    # Подсказка: возьмите срез списка

    return ', '.join(f'{name}: {count} раз(а)' for name,count in desc_sort(popular)[:3])

# for name,count in desc_sort(popular)[:3]: print(f"{name}: {count} раз(а), ",end="")