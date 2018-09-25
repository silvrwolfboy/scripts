#!/usr/bin/env python3

# Append GPL3 license notice into the top of ian existing file.
# Note: If you just trying to append to an empty file, just use
# echo "data" | cat >> empty_file.txt
# Usage:
# cap <file>
#

import sys
gpl_license = '''/*    -Insert project name and what it does-
    Copyright (C) 2018 faraco <skelic3@gmail.com>

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.

*/
'''

with open(sys.argv[1], 'r+') as f:
    content = f.read()
    f.seek(0, 0)
    f.write(gpl_license.rstrip('\r\n') + '\n' + content)

