if __name__ == '__main__':
    finalStr = ""

    f = open("2019.annual.singlefile.csv")

    finalStr = f.readline()

    for line in f.readlines():
        if line.startswith('"11'):
            finalStr += line

    finalStr2 = ""

    for line in finalStr.split("\n"):
        if line.__contains__('"0","10"'):
            finalStr2 += line + "\n"
    print(finalStr2)
    f.close()

    f = open("2019.annual.singlefile.csv", "w")
    f.write(finalStr)
    f.close()
