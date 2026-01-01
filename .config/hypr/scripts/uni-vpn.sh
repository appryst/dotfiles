#!/usr/bin/env bash

VPN_STATE_FILE="/tmp/vpn_state"

status() {
    if [ -f "$VPN_STATE_FILE" ]; then
        echo '{"text": "󰺀", "tooltip": "Uni VPN: Active", "class": "on"}'
    else
        echo '{"text": "󱙗", "tooltip": "Uni VPN: Inactive", "class": "off"}'
    fi
}

toggle() {
    if [ -f "$VPN_STATE_FILE" ]; then
        rm "$VPN_STATE_FILE"
        nmcli connection down Uni_VPN
        mullvad connect
        notify-send -i vpn-off "󱙗 Uni VPN" "Disabled"
    else
        touch "$VPN_STATE_FILE"
        mullvad disconnect
        nmcli connection up Uni_VPN
        notify-send -i vpn-on "󰺀 Uni VPN" "Enabled"
    fi
}

case "$1" in
    "status")
        status
        ;;
    "toggle")
        toggle
        ;;
esac

