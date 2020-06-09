local m_buffer = textadept.menu.menubar[_L['Buffer']]
local keys, OSX, GUI, CURSES, _L = keys, OSX, not CURSES, CURSES, _L

-- Switch tab switching to what's common on macOS
keys[OSX and 'm}' or 'mn'] = m_buffer[_L['Next Buffer']][2]
keys[OSX and 'm{' or 'mp'] = m_buffer[_L['Previous Buffer']][2]

buffer.use_tabs = true
buffer.tab_width = 4
textadept.editing.auto_pairs = nil

events.connect(events.SUSPEND, function()
	buffer:undo()
	return true
end, 1)

--textadept.editing.ver_chars = nil
--textadept.editing.strip_trailing_spaces = true
--textadept.editing.comment_string.ansi_c = '//'
