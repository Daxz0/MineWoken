mortal:
  type: world
  events:
    on player dies flagged:!mortal.dying|!mortal.mortem:
    - determine passively cancelled
    - flag player cblog
    - adjust <player> gamemode:spectator
    - create player <player.name> save:copy
    - adjust <entry[copy].created_npc> skin_blob:<player.skin_blob>
    - spawn <entry[copy].created_npc> <player.location>
    - adjust <entry[copy].created_npc> gravity:false
    - animate <entry[copy].created_npc> sleep
    - flag <player> mortal.dying
    - flag <entry[copy].created_npc> mortal.copy:<player>
    - determine passively no_message
    - customevent id:mortal_mortem save:result
    - if keep_flag not in <entry[result].determination_list>:
      - flag <player> mortal.mortem:!

    - wait 10s
    - adjust <player> gamemode:survival
    - adjust <player> health:1