from django.shortcuts import render, reverse
from django.http import HttpResponse
import copy

DATA = {
    'omlet': {
        'яйца, шт': 2,
        'молоко, л': 0.1,
        'соль, ч.л.': 0.5,
    },
    'pasta': {
        'макароны, г': 0.3,
        'сыр, г': 0.05,
    },
    'buter': {
        'хлеб, ломтик': 1,
        'колбаса, ломтик': 1,
        'сыр, ломтик': 1,
        'помидор, ломтик': 1,
    },
    'life': {
        'безумие': 1,
        'отвага': 3,
    }
    # можете добавить свои рецепты ;)
}

def home_view(request):
    template_name = 'calculator/home.html'
    context = {
    'cookbook': DATA,
    }
    return render(request, template_name, context)

def recipe_view(request,recipe_name):
    template_name = 'calculator/index.html'
    home_url = reverse('home')
    servings = request.GET.get("servings")
    if recipe_name in DATA:
        recipe = DATA[recipe_name].copy()
        if servings:
            for key in recipe:
                recipe[key] *= int(servings)
    else:
        recipe = {}
    context = {
        'recipe': recipe,
        'home_url': home_url

    }
    return render(request, template_name, context)

# Напишите ваш обработчик. Используйте DATA как источник данных
# Результат - render(request, 'calculator/index.html', context)
# В качестве контекста должен быть передан словарь с рецептом:
# context = {
#   'recipe': {
#     'ингредиент1': количество1,
#     'ингредиент2': количество2,
#   }
# }
