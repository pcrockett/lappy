# shellcheck shell=bash

template() {
    # generate **AND EVAL** some bash
    #
    # to see what templates we have, look in the `templates` directory for `.bash.template` files.
    #
    # the templates are rendered using Python's built-in `string.Template` class. any environment
    # variables referenced in the template file will be replaced with their actual value.
    #
    # there are good use cases for this, and there are BAD use cases for this:
    #
    # * GOOD: when you find yourself duplicating target files A LOT, yet suspect that some day
    #   you'll need to refactor THEM ALL and it will be a massive pain in the ass.
    # * BAD: when you're just trying to keep your code DRY, even though the code you'd otherwise
    #   duplicate has little or no reason to change, and refactoring wouldn't be a pain in the ass
    #   anyway.
    #
    # if you're considering using it the BAD way, you should instead rely on the `bin/newtarget`
    # script and allow a little repetition into your life.
    #
    local template_name python_program
    template_name="${1:?must specify template name}"
    python_program=$(cat <<EOF
import os
from pathlib import Path
from string import Template


if __name__ == "__main__":
    file_name = os.environ["BLARG_TEMPLATE_NAME"] + ".bash.template"
    file = Path.cwd() / "templates" / file_name
    file_contents = "".join(open(file, encoding="utf8").readlines())
    print(
        Template(file_contents).substitute(os.environ)
    )
EOF
)
    rendered_template="$(
        BLARG_TEMPLATE_NAME="${template_name}" \
            python3 <(echo "${python_program}")
    )"

    eval "${rendered_template}"
}
