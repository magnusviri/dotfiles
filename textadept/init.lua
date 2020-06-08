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
