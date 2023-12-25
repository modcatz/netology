class Stack:
    def __init__(self, initial_stack=None):
        if initial_stack == None:
            self.stack = []
        else:
            self.stack = initial_stack

    def __str__(self) -> str:
        return str(self.stack)
    
    def is_empty(self):
        return True if len(self.stack) == 0 else False

    def push(self, element):
        self.stack.append(element)

    
    def pop(self):
        return self.stack.pop()
    
    def peek(self):
        return self.stack[-1]

    def size(self):
        return len(self.stack)

    