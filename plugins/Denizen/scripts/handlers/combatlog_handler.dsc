
log_player:
    type: world
    events:
        on player damaged by entity:
            - flag player cblog expire:30s
            - bossbar danger_<player.uuid> create title:<&color[#6E0997]>In<&sp>Danger color:<&color[#6E0997]>
            - wait 30s
            - bossbar remove danger_<player.uuid>


combat_log:
  type: world
  events:
    after player joins flagged:cblog:
    - inject mortal_find_dying_player
    - remove <[target]>
    - flag <player> mortal.mortem
    - flag <player> mortal.dying:!
    - run mortal_create_grave def:<player.location>|<player>
    - adjust <player> gamemode:survival
    - hurt <player.health> #add depths later
    - flag player cblog:!