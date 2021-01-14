class MenuOption:
    def __init__(self, command, description):
        self.__m_command = command
        self.__m_description = description

    def getCommand(self):
        return self.__m_command

    def getDescription(self):
        return self.__m_description
