from stack import Stack

brackets_dict = {"{":"}", "[":"]","(":")"}

def check_balance(user_string):
    stack = Stack()
    for bracket in user_string:
        if bracket in brackets_dict:
            stack.push(bracket)
        else:
            if not stack.is_empty() and bracket == brackets_dict[stack.peek()]:
                stack.pop()
            else:
                return "Unbalanced"
    return "Balanced" if stack.is_empty() else "Unbalanced"

print(check_balance("]"))
print(check_balance("(({[}]))"))
print(check_balance("[([])((([[[]]])))]{()}"))