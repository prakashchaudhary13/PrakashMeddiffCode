def group_by_owners(input):

res = {}

for key, value in input.items():
    if value in res:
        res[value].append(key)
    else:
        res[value] = [key]
return res


input = {
    'Input.txt': 'Randy',
    'Code.py': 'Stan',
    'Output.txt': 'Randy'
}
print(group_by_owners(input))