# This file is part of ranger, the console file manager.
# License: GNU GPL version 3, see the file "AUTHORS" for details.

from __future__ import (absolute_import, division, print_function)

from ranger.gui.colorscheme import ColorScheme
from ranger.gui.color import (
    black, blue, cyan, green, magenta, red, white, yellow, default,
    normal, bold, reverse, underline,
    default_colors,
)


class Default(ColorScheme):
    progress_bar_color = blue

    def use(self, context):  # pylint: disable=too-many-branches,too-many-statements
        fg, bg, attr = default_colors

        if context.reset:
            return default_colors

        elif context.in_browser:
            if context.selected:
                bg = black
                attr = normal
            else:
                attr = normal
            if context.empty or context.error:
                fg = red
            if context.border:
                fg = default
            if context.media:
                fg = yellow
            if context.container:
                fg = green
            if context.directory:
                fg = blue
            elif context.executable:
                fg = 9
            if context.socket:
                fg = magenta
            if context.fifo or context.device:
                fg = yellow
                if context.device:
                    attr |= bold
            if context.link:
                fg = cyan if context.good else magenta
            if context.tag_marker:
                attr |= bold
                fg = 9
            if not context.selected and (context.cut or context.copied):
                fg = black
            if context.main_column:
                if context.marked:
                    fg = 13
            if context.badinfo:
                if attr & reverse:
                    bg = magenta
                else:
                    fg = magenta

            if context.inactive_pane:
                fg = cyan

        elif context.in_titlebar:
            if context.hostname:
                fg = 9 if context.bad else yellow
            elif context.directory:
                fg = default
            elif context.file:
                fg = blue
                attr |= bold
            elif context.tab:
                fg = yellow
                if context.good:
                    fg = blue
                    bg = black
                    attr |= bold
            elif context.link:
                fg = cyan

        elif context.in_statusbar:
            if context.permissions:
                if context.good:
                    fg = blue
                elif context.bad:
                    attr |= bold
                    fg = red
            elif context.nlink:
                attr |= bold
                fg = magenta
            elif context.owner:
                fg = yellow
            elif context.group:
                fg = yellow
            elif context.mtime:
                fg = blue
            elif context.marked:
                attr |= bold
                fg = yellow
            elif context.frozen:
                attr |= bold
                fg = cyan
            elif context.message:
                if context.bad:
                    attr |= bold
                    fg = red
            elif context.loaded:
                bg = self.progress_bar_color
            elif context.all or context.bot or context.top or context.percentage:
                attr |= bold
                fg = blue
            elif context.scroll:
                attr |= bold

        if context.text:
            if context.highlight:
                attr |= reverse

        if context.in_taskview:
            if context.title:
                fg = blue

            if context.selected:
                bg = black

            if context.loaded:
                if context.selected:
                    fg = self.progress_bar_color
                else:
                    bg = self.progress_bar_color

        if context.vcsfile and not context.selected:
            attr &= ~bold
            if context.vcsconflict:
                fg = magenta
            elif context.vcsuntracked:
                fg = cyan
            elif context.vcschanged:
                fg = red
            elif context.vcsunknown:
                fg = red
            elif context.vcsstaged:
                fg = green
            elif context.vcssync:
                fg = green
            elif context.vcsignored:
                fg = default

        elif context.vcsremote and not context.selected:
            attr &= ~bold
            if context.vcssync or context.vcsnone:
                fg = green
            elif context.vcsbehind:
                fg = red
            elif context.vcsahead:
                fg = blue
            elif context.vcsdiverged:
                fg = magenta
            elif context.vcsunknown:
                fg = red

        return fg, bg, attr
