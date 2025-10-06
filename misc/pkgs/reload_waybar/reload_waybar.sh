#!/usr/bin/env bash

kill "$(pidof waybar)" 2>/dev/null
waybar &

