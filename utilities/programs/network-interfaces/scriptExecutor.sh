#!/usr/bin/env bash

# const
login="<login>"
password="<password>"
hostName="ldapw.iem.pw.edu.pl"
script="netInterfacesSetup.sh"

POSITIONAL=()
while [[ $# -gt 0 ]]
do
key="$1"

case ${key} in
    -l|--login)
    login="$2"
    shift
    shift
    ;;
    -p|--password)
    password="$2"
    shift
    shift
    ;;
    -h|--hostname)
    hostName="$2"
    shift
    shift
    ;;
    -s|--script)
    scriptPath="$3"
    shift
    shift
    ;;
    *)
    POSITIONAL+=("$1")
    shift
    ;;
esac
done

set -- "${POSITIONAL[@]}"

isExpectAvailable () {
    if which expect >/dev/null;
        then
            return 0
        else
            return 1
    fi
}

installExpectIfNotExists () {
    if isExpectAvailable;
        then
            return 0
        else
            sudo apt install expect
            installExpectIfNotExists
    fi
}

sendScript () {
    ./sendScript.sh "${login}@${hostName}" "${password}" "${script}"
}

executeScript () {
    ./executeScript.sh "${login}@${hostName}" "${password}" "${script} -s"
    ./executeScript.sh "${login}@${hostName}" "${password}" "${script} -d"
}

main () {
    installExpectIfNotExists
    sendScript
    executeScript

}

main
exit 0
