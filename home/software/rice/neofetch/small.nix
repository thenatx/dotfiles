''
# Source: https://github.com/Chick2D/neofetch-themes/ 
# And the theme name is ozosfetch

print_info() {
		prin "$(color 4) T H E N A T"
    prin "$(color 1) ├──────────────────────────────"
		prin "$(color 3) ├─  Distro      Nixos" 
		prin "$(color 3) ├─  DE/WM       Hyprland" 
		prin "$(color 3) ├─  Terminal    Kitty" 
    info "$(color 3) ├─ 󰍛 CPU         " cpu
    info "$(color 3) ├─ 󰍹 GPU         " gpu
    info "$(color 3) ├─  Disk        " disk 
    info "$(color 3) ├─ 󰅐 Up Time     " uptime
    prin "$(color 1) └──────────────────────────────"
}

uptime_shorthand="on"
speed_type="bios_limit"
speed_shorthand="off"
cpu_brand="on"
cpu_speed="off"
cpu_cores="off"
cpu_temp="off"
gpu_brand="on"
gpu_type="dedicated"
de_version="on"
disk_subtitle="mount"
disk_percent="on"
bold="on"
separator=""
color_blocks="on"
cpu_display="off"
disk_display="off"
ascii_distro="nixos_small"
ascii_bold="on"
stdout="off"
''
