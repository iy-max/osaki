local commands = {}

commands.volume = {
    get = 'sh -c "wpctl get-volume @DEFAULT_AUDIO_SINK@ | cut -d : -f 2"',
    increase10_limit1_5 = 'wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 10%+',
    decrease10_limit1_5 = 'wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 10%-',
    toggle_mute = 'wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle',
    toggle_mute_off = 'wpctl set-mute @DEFAULT_AUDIO_SINK 0',
    toggle_mute_on = 'wpctl set-mute @DEFAULT_AUDIO_SINK 1'
}

commands.network = {

}

commands.media = {
    play_pause = 'playerctl play-pause',
}

return commands
