import MenuOption


class Menu:
    def __init__(self, header):
        """Menu constructor"""
        self.__m_header = header
        self.__m_optionCount = 0
        self.__m_options = []

    def addOption(self, command, description):
        """Add an option to the menu"""
        if command is not None and command != "":
            self.__m_options.append(MenuOption.MenuOption(command, description))
            self.__m_optionCount += 1

    def __isValidCommand(self, command):
        """Check that a command is contained in our list of menu options"""
        isValid = False
        if command == "X":
            isValid = True
        else:
            for i in range(self.getOptionCount()):
                if command == self.getOption(i).getCommand():
                    isValid = True
                    break
        return isValid

    def getOption(self, optionIndex):
        option = None
        if 0 <= optionIndex < self.getOptionCount():
            option = self.__m_options[optionIndex]
        return option

    def getHeader(self):
        return self.__m_header

    def getOptionCount(self):
        return self.__m_optionCount

    def show(self):
        """Display the menu and take a command from the user"""
        command, keepGoing = '', True

        while keepGoing:
            optionList = ''

            print(self.getHeader(), "menu:")

            for i in range(self.getOptionCount()):
                option = self.getOption(i)
                if option is not None:
                    # 1st field is 6 chars wide
                    print(f"{option.getCommand()} - {option.getDescription()}")
                    optionList += option.getCommand() + ", "

            print("X - Exit")
            optionList += "X"

            print(f"\nEnter a {self.getHeader()} command ({optionList})")
            command = input()
            valid = self.__isValidCommand(command)
            if not valid:
                print()
                print(f"Invalid Menu Command {command}")
            keepGoing = not valid

        return command
