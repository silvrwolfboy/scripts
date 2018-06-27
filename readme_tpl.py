#!/usr/bin/python3

import sys, shutil

PROJECT_NAME = sys.argv[1]
choice = sys.argv[2]

def license_template():
    if choice == "APACHE2" or choice == "apache" or choice == "apache2":
        shutil.copyfile('/usr/share/common-licenses/Apache-2.0', 'LICENSE')
        return "Apache 2.0"

    elif choice == "MIT" or choice == "mit":
        shutil.copyfile('/usr/share/common-licenses/MIT', 'LICENSE')
        return "MIT"

    elif choice == "AGPL" or choice == "agpl":
        shutil.copyfile('/usr/share/common-licenses/AGPL-3', 'LICENSE')
        return "AGPL-3.0"
    else:
        shutil.copyfile('/usr/share/common-licenses/GPL-3', 'LICENSE')
        return "GPL-3.0"

def write_readme():
    TEMPLATE = """# {}

## Getting Started

### Prerequisites

### Running the program


## Running the tests


## Author

* [faraco](https://github.com/faraco) <skelic3@gmail.com>
        
## License

This project is licensed under the {} License - see the LICENSE file for details.
    """.format(PROJECT_NAME, license_template())

    with open('README.md','w') as f:
        f.write(TEMPLATE)

write_readme()
