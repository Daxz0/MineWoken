attribute_apply:
    type: world
    events:
        on player clicks addsign_*:
        - if <player.flag[<context.item.script.name>]> < 8:
            - flag player <context.item.script.name>:+:1
            - narrate "added one point into <context.item.script.name>"