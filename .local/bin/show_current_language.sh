#!/bin/bash

case "$(xset -q|grep LED| awk '{ print $10 }')" in
    "00000000") echo "en" ;;
    "00001000") echo "ru" ;;
    *)          echo "-"  ;;
esac
