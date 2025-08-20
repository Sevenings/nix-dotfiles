#!/usr/bin/env bash

# Use: workspace.sh <action> <workspace> [workspaces per monitor]
# Actions:
#   workspace, movetoworkspace, movetoworkspacesilent


# ARGUMENTOS:
# Acao do hyprland utilizada
action=$1

# Workspace para o qual o usuario deseja trocar 
workspace=$2

# Workspaces por monitor
workspacesPerMonitor=9


# Encontrar monitor que esta focado
workspaceAtual=$(hyprctl activeworkspace -j | jq .id)
focusedMonitor=$(hyprctl monitors -j | jq "(.[] | select(.activeWorkspace.id == $workspaceAtual)).id")


# Realizar a troca de workspace baseada em cada monitor
if [[ $focusedMonitor == 1 ]]; then
    hyprctl dispatch "$action" "$workspace"
elif [[ $focusedMonitor == 0 ]]; then
    hyprctl dispatch "$action" $(("$workspace" + "$workspacesPerMonitor"))
else
    echo "Focused Monitor $focusedMonitor is not listed"
fi
