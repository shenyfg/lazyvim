

def main():
    methods = inspect.getmembers(Solution, predicate=inspect.isfunction)
    _, method = methods[-1]
    params = inspect.signature(method).parameters
    n = len(params) - 1

    with open("input.txt") as f:
        lines = f.readlines()

    i = 0
    while i <= len(lines) - n:
        args = [eval(x) for x in lines[i : i + n]]
        sol = Solution()
        ans = method(sol, *args)
        print(ans)
        i += n


def pl(p):
    while p:
        print(p.val)
        p = p.next


if __name__ == "__main__":
    main()
