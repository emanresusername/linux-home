# cowsay with a random cow
function randomsay() {
    cows=(`cowsay -l | rg -v '/'`)
    cow=${cows[$RANDOM % ${#cows[@]} ]}
    cowsay -f $cow "$@"
    echo $cow
}

case "$(( $RANDOM % 2 ))" in
    0) quote
       ;;
    1) fortune
       ;;
esac | randomsay
