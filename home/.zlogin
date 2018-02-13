# cowsay with a random cow
function randomsay() {
    cows=(`cowsay -l | grep -v '/'`)
    cow=${cows[$RANDOM % ${#cows[@]} ]}
    cowsay -f $cow "$@"
    echo $cow
}

fortune | randomsay
