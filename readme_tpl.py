#!/usr/bin/python3

import sys, shutil

PROJECT_NAME = sys.argv[1]
choice = sys.argv[2]

def license_template():
    if choice == "GPL3":
       shutil.copyfile('/usr/share/common-licenses/GPL-3', 'COPYING')    
    else:
        shutil.copyfile('/usr/share/common-licenses/Apache-2.0', 'COPYING')

def write_readme():
    TEMPLATE = """{}
----

### Getting Started
<hr>

#### Prerequisites
        
#### Installing

### Running the tests
<hr>

### Built With
<hr>
*
*
*

### Authors
<hr>
* faraco <skelic3@gmail.com>
        
### License
<hr>
This project is licensed under the {} License - see the COPYING file for details.

    """.format(PROJECT_NAME, "Apache 2.0")

    with open('README.md','w') as f:
        f.write(TEMPLATE)


write_readme()
license_template()
