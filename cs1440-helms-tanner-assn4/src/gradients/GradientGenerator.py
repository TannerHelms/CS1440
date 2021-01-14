from colour import Color


def setGradient(iterations, colors: []) -> []:
    iterationLength = int(iterations / len(colors))
    colorGradient = list(Color(colors[0]).range_to(Color(colors[1]), iterationLength))
    for i in range(1, len(colors) - 1):
        colorGradient += list(Color(colors[i]).range_to(Color(colors[i + 1]), iterationLength))
    return colorGradient
    pass
