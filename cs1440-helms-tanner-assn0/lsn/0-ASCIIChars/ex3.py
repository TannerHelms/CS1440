def scoreWord(word):
    score = 0
    # TODO: Score the word
    for ch in word:
        v = ord(ch.upper())
        if v >= 65:
            if v <= 90:
                score += (v - 65)
    return score


if __name__ == '__main__':
    provided = [
        "One",
        "oNE",
        "supercalifragilisticexpialidocious",
        "t",
        "aAaA",
        "Zap!",
        "Tr!ck3d y4!",
        "G0t it!",
        "-62"
    ]

    # For each word in the provided list, give the word to the function score word and print some fancy formatted output
    for word in provided:
        print(f"The score of {word} is: {scoreWord(word)}")
