local ok, hop = pcall(require, 'hop')
if not ok then
  print('Unable to procure hop')
  return
end

hop.setup {
    keys = 'etovxqpdygfblzhckisuran', 
    jump_on_sole_occurrence = false
}
