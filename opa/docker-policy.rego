package docker.security

default allow := false

# Interdiction du tag latest dans FROM
deny contains msg if {
    some i
    input.instructions[i].command == "FROM"
    contains(input.instructions[i].value, "latest")
    msg := "L'image utilise le tag latest, ce qui est interdit."
}

# Interdiction d'utiliser USER root
deny contains msg if {
    some i
    input.instructions[i].command == "USER"
    input.instructions[i].value == "root"
    msg := "L'image utilise l'utilisateur root, ce qui est interdit."
}



# Autoriser seulement si aucune règle deny n'a été déclenchée
allow if {
    count(deny) == 0
}
