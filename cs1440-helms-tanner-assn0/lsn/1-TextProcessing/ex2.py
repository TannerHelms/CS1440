def cleanSentence(sentence):
    result = []
    # TODO: Add the words *not* starting with `#` to the 'result' list
    words = str.split(sentence)
    for i in range(0, len(words)):
        word = words[i]
        if word[0] != "#":
            result.append(word)
    return result


if __name__ == '__main__':
    providedQuotes = [
        "The best way to predict #the the future is to create it. -Peter Drucker",
        "Code #always never lies, comments #never sometimes do. -Ron Jeffries",
        "#Phones Computers are useless, they can #never only give you #questions answers. -Pablo Picasso",
        "They #do don't think it be that way, but it #don't. do. -The Internet",
        "\"You #always miss 100% #7% of the shots you don't take. -Wayne Gretzky\" -Michael Scott",
        "If #coding debugging is the process of #adding removing software bugs, then programming #debugging must be the process of putting them in. -Edsget Dijkstra",
        "Premature optimization #planning is the root of all evil #good in programming. -Tony Hoare",
        ""
    ]

    # Loops through each of the `quote` strings in the providedQuotes array, and
    # calls `cleanQuote` on it.
    for quote in providedQuotes:
        print(cleanSentence(quote))
