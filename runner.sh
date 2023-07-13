#!/bin/bash

base_path=$PWD

print_menu() {

    clear

    echo ""
    echo "Select an option:"
    echo ""
    echo "1.- Infrastructure"
    echo "2.- Infrastructure with monitoring"
    echo ""
    echo "101.- Infrastructure (down)"
    echo "102.- Infrastructure with monitoring (down)"
    echo ""
    echo "0.- Salir"
    echo ""

    read -p "Select and option: " option_selected

    return $option_selected

}

docker_compose_up() {
   
   local docker_compose="$base_path/docker-compose.yaml"
   local docker_compose_override="$base_path/docker-compose.override.yaml"

    local profile=$1
    local domain=$2

    docker-compose --file $docker_compose --file $docker_compose_override --project-name $profile -p $domain up -d

}

docker_compose_down() {
   
    local docker_compose="$base_path/docker-compose.yaml"

    local profile=$1

    docker-compose --file $docker_compose --project-name $profile down

}

print_menu
current_selection=$?

while [[ $current_selection -gt 0 ]];  
do  

    case $current_selection in

        1)
            docker_compose_up "infrastructure" "infrastructure"
            print_menu
            current_selection=$?
        ;;

        2)
            docker_compose_up "infrastructure" "infrastructure-monitoring"
            print_menu
            current_selection=$?
        ;;

        101)
            docker_compose_down "infrastructure"
            print_menu
            current_selection=$?
        ;;

        102)
            docker_compose_down "infrastructure-monitoring"
            print_menu
            current_selection=$?
        ;;

    esac

done  

