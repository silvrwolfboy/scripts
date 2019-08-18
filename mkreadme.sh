#!/bin/sh

choose_license ()
{
    license="$1"
    gpl3_path="/usr/share/common-licenses/GPL-3"

    case "$license" in
        "gpl3") current_license="$gpl3_path"
               ;;
    esac
}

project_license="$2"
if test -z "$2"
then
        # default to gpl3 if no license name given
        choose_license "gpl3"
else
        case "$project_license" in
                "gpl3"|"GPL3"|"gpl-3") choose_license "gpl3"
                        ;;
                *)
                        echo "Project license is not recognized." >&2
                        exit 1
                        ;;
        esac
fi

project_name="$1"

if test -z "$1"
then
        echo "Error! No project name was given." >&2
        exit 1
fi

mkdir "$project_name" && cd "$project_name" \
        && cat "$current_license" > LICENSE

echo "# $project_name" >> README.md
echo "" >> README.md
echo "## Getting Started" >> README.md
echo "" >> README.md
echo "## Author" >> README.md
echo "" >> README.md
echo "## License" >> README.md
echo "" >> README.md

case "$license" in
    "gpl3")
        readme_license="GPL-3.0"
        type=" and free"
esac

echo "This project is an open source$type software." >> README.md
echo "It is also released under the $readme_license license." >> README.md
echo "Please see LICENSE file for further details." >> README.md


