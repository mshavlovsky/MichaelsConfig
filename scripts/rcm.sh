read -p "Do you want to delete [Y/n]? " ans
case $ans in
    [yY]*) rm "$@" ;;
    *) echo "Nothing deleted";;
esac
