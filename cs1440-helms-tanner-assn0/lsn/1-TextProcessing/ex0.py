def findWords(sentence):
    wordsToReturn = []
    # TODO: Return the words in `sentence` that are five characters or less
    # Range over each word that is in the sentence
    for word in sentence:
        # Check to see if the word has a length that is less then or equal to 5
        if len(word) <= 5:
            # If so, add it to the array
            wordsToReturn.append(word)
    return wordsToReturn


if __name__ == '__main__':

    provided = [
        "Craftsman",
        "Keep",
        "Reveal",
        "personal",
        "it",
        "harmful",
        "engine",
        "short",
        "friendly",
        "killer",
        "honest",
        "season",
        "and",
        "camera",
        "strange",
        "hiccup",
        "horseshoe",
        "sphere",
        "charismatic",
        "ceiling",
        "sweet",
        "formation",
        "substitute"
        "daughter",
        "perfect"
    ]

    words = findWords(provided)
    # Prints the `words` list formatted like a sentence.
    for i in range(len(words)):
        if i != (len(words) - 1):
            print(words[i], end=" ")
        else:
            print(words[i] + "!")
