belowwater:
    type: world
    events:
        on player steps on water:
            - if <player.eye_location.up[5].material.name> == water:
                - determine passively cancelled
        after player dies:
        - adjust <player> gravity:true