



import inspect


def generate_tree(input):
    input = input.strip()
    input = input[1:-1]
    if not input:
        return None

    inputValues = [s.strip() for s in input.split(",")]
    root = TreeNode(int(inputValues[0]))
    nodeQueue = [root]
    front = 0
    index = 1
    while index < len(inputValues):
        node = nodeQueue[front]
        front = front + 1

        item = inputValues[index]
        index = index + 1
        if item != "null":
            leftNumber = int(item)
            node.left = TreeNode(leftNumber)
            nodeQueue.append(node.left)

        if index >= len(inputValues):
            break

        item = inputValues[index]
        index = index + 1
        if item != "null":
            rightNumber = int(item)
            node.right = TreeNode(rightNumber)
            nodeQueue.append(node.right)
    return root


def pretty_print_tree(node, prefix="", isLeft=True):
    if not node:
        print("Empty Tree")
        return

    if node.right:
        pretty_print_tree(node.right, prefix + ("│   " if isLeft else "    "), False)

    print(prefix + ("└── " if isLeft else "┌── ") + str(node.val))

    if node.left:
        pretty_print_tree(node.left, prefix + ("    " if isLeft else "│   "), True)


def main():
    methods = inspect.getmembers(Solution, predicate=inspect.isfunction)
    # exclude the util funtions, main function is always the last one
    _, method = methods[-1]
    params = inspect.signature(method).parameters

    n = len(params) - 1

    with open("input.txt") as f:
        lines = f.readlines()

    i = 0
    while i <= len(lines) - n:
        args = []
        for j in range(n):
            line = lines[i + j]
            if "[" in line:
                root = generate_tree(line)
                args.append(root)
            else:
                args.append(eval(line))

        sol = Solution()
        ans = method(sol, *args)
        if ans and type(ans) == list and ans[0] and type(ans[0]) == list:
            # prettier output for 2-dimension arrays
            for j, a in enumerate(ans):
                if j == 0:
                    a = "[" + str(a)
                if j == len(ans) - 1:
                    a = str(a) + "]"
                print(a)
        else:
            print(ans)
        i += n


if __name__ == "__main__":
    main()
