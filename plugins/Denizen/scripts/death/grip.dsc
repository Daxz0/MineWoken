mortal_grip:
  type: task
  definitions: target
  script:
  - define target_player <[target].flag[mortal.copy]>
  - if !<[target_player].is_online>:
    - stop
  - flag <player> mortal.gripping
  - flag <[target_player]> mortal.griplog
  - define id grip_<[target_player].name>
  - define title "<red>Gripping <yellow><[target_player].name><green>..."
  - bossbar create <[id]> players:<player>|<[target_player]> color:red style:segmented_10 title:<[title]> progress:0.0
  - repeat 10 as:n:
    - wait 10t
    - if !<player.has_flag[mortal.gripping]>:
      - define err "Grip stopped."
      - run mortal_bossbar_update def:<&c>|<[id]>|<[err]>
      - flag <[target_player]> cblog:!
      - stop
    - ~run mortal_bossbar_player_online_check def:<[target_player]>
    - bossbar update <[id]> progress:<[n].div[10]>
  - wait 5t
  - playeffect effect:RED_DUST at:<[target].eye_location.relative[-1.3,0,0]> special_data:1.2|red offset:0,0,1 quantity:100
  - wait 2t
  - flag <[target_player]> mortal.mortem
  - run mortal_create_grave def:<[target].location>|<[target_player]>
  - adjust <[target_player]> gamemode:survival
  - hurt <[target_player].health> <[target_player]>
  - flag <player> mortal.gripping:!
  - flag <[target_player]> mortal.dying:!
  - flag <[target_player]> cblog:!
  - remove <[target]>
  - bossbar remove <[id]>

