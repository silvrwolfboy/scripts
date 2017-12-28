#!/usr/bin/perl -ln

# Append GPL3 license notice after matched the "use strict"; pattern in place.
# Usage:
# perl -i cap.pl file
#
use strict;
use warnings;

my $GPL_LICENSE = <<'END_LICENSE';

/*
    blue-beanie - A 2D run-and-collect web video game.
    Copyright (C) 2017 faraco <skelic3@gmail.com>

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
END_LICENSE

print $_;
print $GPL_LICENSE if $_ =~ /\"use strict\";/;