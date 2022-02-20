belowwater:
    type: world
    events:
        on player steps on water:
            - if <player.eye_location.up[8].material.name> == water:
                - if <context.previous_location.y.sub[<context.location.y>]> < 1:
                    - determine passively cancelled
                    #- title title:<&color[#00008b]>The<&sp>Depths