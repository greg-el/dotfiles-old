import subprocess
import requests
import re

class Package:
    def __init__(self, name, local):
        self.name = name
        self.local = local
        self.current = None
        self.get_current_version()

    def __repr__(self):
        return f"Package: {self.name} // Local Version {self.local} // AUR Version {self.current}"

    def get_current_version(self):
        BASE = "https://aur.archlinux.org/packages/"
        request = BASE + self.name
        response = requests.get(BASE + self.name).text
        current = re.search("(?<=Package Details: )(.*)(?=<)", response).group(0).split()
        self.current = current[1]

    def update(self):
        UPDATER = "/home/greg/scripts/aur-auto " + self.name 
        process = subprocess.Popen(UPDATER.split(), stdout=subprocess.PIPE)
        output, error = process.communicate()
        if error:
            print(error)
            exit(1)

        print(f"{self.name} updated. \n Previous Version: {self.local} \n Installed Version: {self.current}")
        self.local = self.current

    
def get_packages():
    AUR_PACKAGES = "pacman -Qm"
    process = subprocess.Popen(AUR_PACKAGES.split(), stdout=subprocess.PIPE)
    output, error = process.communicate()
    if error:
        print(error)
        exit(1)
    
    non_bytes_output = output.decode("utf-8").replace(" ", "\n")
    package_version = non_bytes_output.split("\n")
    packages = []
    for i in range(0, len(package_version)-1,2):
        packages.append(Package(package_version[i], package_version[i+1]))
    
    return packages


def get_out_of_date_packages(packages):
    return [x for x in packages if x.local != x.current]



    
if __name__ == "__main__":
    packages = get_packages()
    updateable_packages = get_out_of_date_packages(packages)
    for package in updateable_packages:
        package.update()

