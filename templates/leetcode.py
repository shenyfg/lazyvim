


import inspect


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
        args = [eval(x) for x in lines[i : i + n]]
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

