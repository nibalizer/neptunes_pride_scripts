#!/bin/bash

username=$1
password=$2
game_id=$3

rm -f mycookie

curl 'https://np.ironhelmet.com/arequest/login' -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:67.0) Gecko/20100101 Firefox/67.0' -H 'Accept: application/json, text/javascript, */*; q=0.01' -H 'Accept-Language: en-US,en;q=0.5' --compressed -H 'Content-Type: application/x-www-form-urlencoded; charset=UTF-8' -H 'X-Requested-With: XMLHttpRequest' -H 'DNT: 1' -H 'Connection: keep-alive' -H 'TE: Trailers' --data "type=login&alias=${username}&password=${password}" -c mycookie

sleep 1

curl 'https://np.ironhelmet.com/trequest/order' -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:67.0) Gecko/20100101 Firefox/67.0' -H 'Accept: application/json, text/javascript, */*; q=0.01' -H 'Accept-Language: en-US,en;q=0.5' --compressed -H 'Content-Type: application/x-www-form-urlencoded; charset=UTF-8' -H 'X-Requested-With: XMLHttpRequest' -H 'DNT: 1' -H 'Connection: keep-alive' -b mycookie -H 'TE: Trailers' --data "type=order&order=toggle_pause_game&version=&game_number=${game_id}"

rm -f mycookie
