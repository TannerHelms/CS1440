def listOfASCIIInts(charList):
    list = []
    # TODO: convert a list of characters into a list of ints based on ASCII
    # Ranch over the charList and append it to the list based on ASCII
    for i in charList:
        list.append(ord(i))
    return list


if __name__ == '__main__':
    provided = ["A", "B", "c", "1", "-", "_", "~", " ", "z", "Y", "x"]
    provided2 = "Will you pass this test too?"

    print(listOfASCIIInts(provided))
    print(listOfASCIIInts(provided2))
