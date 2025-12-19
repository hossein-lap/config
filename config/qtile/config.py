from libqtile import bar, layout, widget
from libqtile.widget import base
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

alt = "mod1"
sup = "mod4"

term = guess_terminal()
term = "tabbed -ck -r 2 st -w ''"
prompt = "dmenu_run -p Run"

def latest_group(qtile):
    qtile.current_screen.set_group(qtile.current_screen.previous_group)

# keys += [Key(["mod4"], "s", lazy.function(latest_group))]

keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    # Key([alt], "h", lazy.layout.left(), desc="Move focus to left"),
    # Key([alt], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([alt], "j", lazy.layout.down(), desc="Move focus down"),
    Key([alt], "k", lazy.layout.up(), desc="Move focus up"),
    # Key([alt], "Return", lazy.layout.next(), desc="Move window focus to other window"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    # Key([alt, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    # Key([alt, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    # Key([alt, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    # Key([alt, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # # Grow windows. If current window is on the edge of screen and direction
    # # will be to screen edge - window would shrink.
    # Key([alt, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    # Key([alt, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    # Key([alt, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    # Key([alt, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([alt], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    # Key(
    #     [alt], "Return", lazy.layout.toggle_split(),
    #     desc="Toggle between split and unsplit sides of stack",
    # ),
    Key([alt, "shift"], "Return", lazy.spawn(term), desc="Launch term"),
    Key([alt], "p", lazy.spawn(prompt), desc="Launch run prompt"),
    # Toggle between different layouts as defined below
    # Key([alt], "space", lazy.next_layout(), desc="Toggle between layouts"),
    Key([alt, "shift"], "c", lazy.window.kill(), desc="Kill focused window"),
    Key([alt, "shift"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([alt, "shift"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    # Key([alt], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
    Key([alt], "Tab", lazy.function(latest_group), desc="Switching back and fourth between groups"),
    Key([alt, "shift"], "space", lazy.window.toggle_floating()),

	# Key([], 'XF86AudioMute', lazy.spawn('amixer -D pulse set Master toggle')),
	# #Key([], 'XF86AudioMicMute', lazy.spawn('amixer -D pulse set Master toggle')),
	# Key([], 'XF86AudioRaiseVolume', lazy.spawn('amixer -c 0 -q set Master 2dB+')),
	# Key([], 'XF86AudioLowerVolume', lazy.spawn('amixer -c 0 -q set Master 2dB-')),

]

def window_to_previous_screen(qtile, switch_group = False, switch_screen = False):
    i = qtile.screens.index(qtile.current_screen)
    if i != 0:
        group = qtile.screens[i - 1].group.name
        qtile.current_window.togroup(group, switch_group=switch_group)
        if switch_screen == True:
            qtile.cmd_to_screen(i - 1)
def window_to_next_screen(qtile, switch_group=False, switch_screen=False):
    i = qtile.screens.index(qtile.current_screen)
    if i + 1 != len(qtile.screens):
        group = qtile.screens[i + 1].group.name
        qtile.current_window.togroup(group, switch_group=switch_group)
        if switch_screen == True:
            qtile.cmd_to_screen(i + 1)

keys.extend([
    # MOVE WINDOW TO NEXT SCREEN
    Key([alt, "shift"],
        "period", lazy.function(window_to_next_screen, switch_screen = False)
    ),
    Key([alt, "shift"],
        "Up", lazy.function(window_to_previous_screen, switch_screen = False)
    ),
])

default_layout = "tile"

groups = []
group_names   = ["1", "2", "3", "4", "5", "6", "7", "8", "9",]
group_labels  = ["", "", "", "", "", "", "", "", "",]
group_layouts = [
    "monadtall", "monadtall", "monadtall",
    "monadtall", "monadtall", "monadtall",
    "monadtall", "monadtall", "monadtall",
]

for i in range(len(group_names)):
    groups.append(
        Group(
            name=group_names[i],
            layout=group_layouts[i].lower(),
            label=group_labels[i],
        ),
    )
    keys.extend([
        Key(  # switch to tag
            [alt],
            group_names[i],
            lazy.group[group_names[i]].toscreen(),
            desc="Switch to group {}".format(group_names[i]),
        ),
        Key(  # move a window to a tag
            [alt, "shift"],
            group_names[i],
            lazy.window.togroup(group_names[i], switch_group = False),
            desc="Switch to & move focused window to group {}".format(group_names[i]),
        ),
    ])

color_normal = "#121212"
color_background = "#121212"
color_focus  = "#770000"
border_width = 2
gap_outter = 8
bar_width = 26


layouts = [
    layout.Tile(
        border_normal = color_normal,
        border_focus = color_focus,
        border_width = border_width,
        margin = [gap_outter, gap_outter, gap_outter, gap_outter],
    ),
    layout.Max(),
    layout.Columns(border_focus_stack=["#d75f5f", "#8f3d3d"], border_width = border_width),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadTall(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

# # custom widgets {{{
# def humanize_bytes(value):
#     suff = ["B", "K", "M", "G", "T"]
#     while value > 1024. and len(suff) > 1:
#         value /= 1024.
#         suff.pop(0)
#     return "%03d%s" % (value, suff[0])
#
# class Metrics(base.InLoopPollText):
#     def __init__(self, **config):
#         self.cpu_usage, self.cpu_total = self.get_cpu_stat()
#         self.interfaces = {}
#         self.idle_ifaces = {}
#         base.InLoopPollText.__init__(self, **config)
#         self.update_interval = 1
#
#     def get_cpu_stat(self):
#         stat = [int(i) for i in open('/proc/stat').readline().split()[1:]]
#         return sum(stat[:3]), sum(stat)
#
#     def get_cpu_usage(self):
#         new_cpu_usage, new_cpu_total = self.get_cpu_stat()
#         cpu_usage = new_cpu_usage - self.cpu_usage
#         cpu_total = new_cpu_total - self.cpu_total
#         self.cpu_usage = new_cpu_usage
#         self.cpu_total = new_cpu_total
#         if cpu_total != 0:
#             cpu_percents = "%d%%" % (float(cpu_usage) / float(cpu_total) * 100.)
#         else:
#             cpu_percents = "nan"
#         return 'cpu:%s' % cpu_percents
#
#     def get_mem_usage(self):
#         info = {}
#         for line in open('/proc/meminfo'):
#             key, val = line.split(':')
#             info[key] = int(val.split()[0])
#         mem = info['MemTotal']
#         mem -= info['MemFree']
#         mem -= info['Buffers']
#         mem -= info['Cached']
#         if int(info['MemTotal']) != 0:
#             mem_percents = '%d%%' % (float(mem) / float(info['MemTotal']) * 100)
#         else:
#             mem_percents = 'nan'
#         return 'mem:%s' % mem_percents
#
#     def get_net_usage(self):
#         interfaces = []
#         basedir = '/sys/class/net'
#         for iface in os.listdir(basedir):
#             if iface in ('lo', ):
#                 continue
#             j = os.path.join
#             ifacedir = j(basedir, iface)
#             statdir = j(ifacedir, 'statistics')
#             idle = iface in self.idle_ifaces
#             try:
#                 if int(open(j(ifacedir, 'carrier')).read()):
#                     rx = int(open(j(statdir, 'rx_bytes')).read())
#                     tx = int(open(j(statdir, 'tx_bytes')).read())
#                     if iface not in self.interfaces:
#                         self.interfaces[iface] = (rx, tx)
#                     old_rx, old_tx = self.interfaces[iface]
#                     self.interfaces[iface] = (rx, tx)
#                     rx = rx - old_rx
#                     tx = tx - old_tx
#                     if rx or tx:
#                         idle = False
#                         self.idle_ifaces[iface] = 0
#                         rx = humanize_bytes(rx)
#                         tx = humanize_bytes(tx)
#                         interfaces.append('%s:%s/%s' % (iface, rx, tx))
#             except:
#                 pass
#             if idle:
#                 interfaces.append(
#                     '%s:%-9s' % (iface, ("idle:%02d" % self.idle_ifaces[iface]))
#                 )
#                 self.idle_ifaces[iface] += 1
#                 if self.idle_ifaces[iface] > 30:
#                     del self.idle_ifaces[iface]
#         return " ".join(interfaces)
#
#     def poll(self):
#         stat = [self.get_cpu_usage(), self.get_mem_usage()]
#         net = self.get_net_usage()
#         if net:
#             stat.append(net)
#         return " ".join(stat)
# # }}}

font = 'Monospace'
foreground = '#BBBBBB'
color_foreground = "#005577"
color_text = "#fefefe"
alert = "#FFFF00"
color_alert = "#FF0000"
fontsize = 16
font_params = {
    'font': font,
    'fontsize': fontsize,
    'foreground': foreground,
}
color_separator = "#555555"
soft_sep = {'linewidth': 2, 'size_percent': 70,
            'foreground': '393939', 'padding': 7}
widget_defaults = dict(
    font = font,
    fontsize = fontsize,
    padding = 4,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(

        # top bar {{{
        top = bar.Bar(
            [
                widget.GroupBox(),
                widget.Sep(**soft_sep),
                widget.CurrentLayout(),
                widget.Sep(**soft_sep),
                # widget.Prompt(),
                widget.WindowName(background = color_foreground, foreground = color_text),
                # widget.TextBox("default config", name="default"),
                # widget.TextBox("Press &lt;M-r&gt; to spawn", foreground="#d75f5f"),
                # NB Systray is incompatible with Wayland, consider using StatusNotifier instead
                widget.Mpd2(
                    update_interval = 5,
                ),
                widget.Sep(**soft_sep),
                widget.DoNotDisturb(),
                widget.Sep(**soft_sep),
                widget.Battery(
                    format = '{char}: {percent:2.0%}',
                    update_interval = 5,
                ),

                widget.Sep(**soft_sep),
                widget.Clock(format = "%Y-%m-%d %H:%M:%S"),
                widget.Systray(icon_size = 15),
                # widget.QuickExit(),
            ],
            bar_width,
            # margin = gap_outter,
            reserve = True,
            # border_width=[2, 0, 2, 0],  # Draw top and bottom borders
            # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
        ),
        # }}}

        # buttom bar {{{
        bottom = bar.Bar(
            [
                widget.CPU(
                     # width=30,
                     # border_width=1,
                     # border_color="#000000",
                     update_interval = 5,
                     # line_width=1,
                     # samples=50,
                ),
                widget.Sep(**soft_sep),
                widget.TextBox("Mem:", spacing=0, padding=0),
                widget.Memory( update_interval = 5,),
                widget.Sep(**soft_sep),
                # widget.Memory(),
                # widget.Sep(**soft_sep),
                widget.TextBox("Dev:", spacing=0, padding=0),
                widget.DF(
                    partition = "/",
                    update_interval = 5,
                ),
                widget.DF(
                    partition = "/home",
                    update_interval = 5,
                ),
                widget.DF(
                    partition = "/boot",
                    update_interval = 5
                ),
                widget.Sep(**soft_sep),
                widget.TextBox("Vol:", spacing=0, padding=0),
                widget.Volume(),
                # widget.Sep(**soft_sep),
                widget.WindowName(foreground = color_background),
                # widget.Bluetooth(
                #     update_interval = 5,
                # ),
                # widget.Sep(**soft_sep),
                # widget.Volume(fmt="Vol: {}"),
                # split
                widget.Net(
                    interface = "wlp2s0",
                    update_interval = 5,
                ),
                widget.Net(
                    interface = "docker0",
                    update_interval = 5,
                ),
                # widget.Sep(**soft_sep),
                # widget.Net(),
            ],
            bar_width,
            # margin = gap_outter,
            reserve = True,
            # border_width=[2, 0, 2, 0],  # Draw top and bottom borders
            # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
        ),
        # }}}

        # right = bar.Gap(gap_outter),

        # left = bar.Gap(gap_outter),

        # bottom=bar.Gap(gap_outter)
    ),
]

# Drag floating layouts.
mouse = [
    Drag([alt], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([alt], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([alt], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
