import tomli
from urllib import request
from project import Project

# Tässä virheitä

class ProjectReader:
    def __init__(self, url):
        self._url = url

    def get_project(self):
        # tiedoston merkkijonomuotoinen sisältö
        content = request.urlopen(self._url).read().decode("utf-8")
        print(content)

        # deserialisoi TOML-formaatissa oleva merkkijono ja muodosta Project-olio sen tietojen perusteella
        toml_merkkijono = tomli.loads(content)
        print(toml_merkkijono)

        # luodaan project-olio derealisoidun merkkijonon perusteella
        name = toml_merkkijono.get("name", "Default name")
        description = toml_merkkijono.get("description", "Default description")
        dependencies = toml_merkkijono.get("dependecies", [])
        dev_dependencies = toml_merkkijono.get("dev-dependencies", [])

        # palautetaan project-olio
        return Project(name, description, dependencies, dev_dependencies)
