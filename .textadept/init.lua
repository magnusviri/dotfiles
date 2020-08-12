-- https://foicica.com/textadept/api.html

local keys, OSX, GUI, CURSES, _L = keys, OSX, not CURSES, CURSES, _L

-- Switch tab switching to what's common on macOS
local m_buffer = textadept.menu.menubar[_L['Buffer']]
local m_view = textadept.menu.menubar[_L['View']]

if OSX then
   print ("OSX")
   keys['cmd+}'] = m_buffer[_L['Next Buffer']][2]
   keys['cmd+{'] = m_buffer[_L['Previous Buffer']][2]

   keys['cmd+`'] = m_view[_L['Next View']][2]
   keys['cmd+~'] = m_view[_L['Previous View']][2]

   --keys['cr'] = function() textadept.run.run end
  keys['alt+left'] = buffer.word_left -- fixes a bug in 11 alpha 3
  keys['alt+right'] = buffer.word_right -- fixes a bug in 11 alpha 3

--    {'ctrl+left', {'ctrl+left', 'ctrl+cmd+b'}, 'ctrl+left'},
--    {'ctrl+right', {'ctrl+right', 'ctrl+cmd+f'}, 'ctrl+right'},

   keys['cmd+\b'] = buffer.del_word_left
   keys['alt+\b'] = buffer.del_line_left
   keys['cmd+shift+\b'] = buffer.del_line_right
   keys['cmd+del'] = buffer.del_line_right
   keys['alt+del'] = buffer.del_word_right

end

keys['alt+shift+left'] = keys['ctrl+shift+left']
keys['alt+shift+right'] = keys['ctrl+shift+right']
keys['alt+shift+up'] = keys['ctrl+shift+up']
keys['alt+shift+down'] = keys['ctrl+shift+down']
keys['ctrl+shift+left'] = buffer.char_left_rect_extend
keys['ctrl+shift+right'] = buffer.char_right_rect_extend
keys['ctrl+shift+up'] = buffer.char_up_rect_extend
keys['ctrl+shift+down'] = buffer.char_down_rect_extend

keys['cmd+right'] = buffer.line_end_display
keys['cmd+left'] = buffer.home_display

for key, val in pairs(keys) do
--print (key, val)
end

buffer.use_tabs = true
buffer.tab_width = 4
textadept.editing.auto_pairs = nil
buffer.wrap_mode = buffer.WRAP_WHITESPACE

events.connect(events.SUSPEND, function()
    buffer:undo()
    return true
end, 1)


events.connect(events.BUFFER_BEFORE_SWITCH, function()
  if buffer.modify then buffer:save() end
end)

timeout(60, function() if buffer.modify then buffer:save() end end)

--textadept.editing.ver_chars = nil
--textadept.editing.strip_trailing_spaces = true
--textadept.editing.comment_string.ansi_c = '//'