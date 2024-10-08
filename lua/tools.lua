local tools = {}
tools.symbols = {
  Affirmative = "✓ ",
  Array = " ",
  Boolean = " ",
  Class = "󰠱 ",
  CodeAction = " ",
  Color = "󰏘 ",
  Component = "󰡀 ",
  Constant = "󰏿 ",
  Constructor = " ",
  Definition = " ",
  Diagnostic = " ",
  Dice1 = "󰇊 ",
  Dice2 = "󰇋 ",
  Dice3 = "󰇌 ",
  Dice4 = "󰇍 ",
  Dice5 = "󰇎 ",
  Dice6 = "󰇏 ",
  Dos = " ",
  Enum = " ",
  EnumMember = " ",
  Error = " ",
  Event = " ",
  Field = "󰜢 ",
  File = "󰈙 ",
  Folder = "󰉋 ",
  Fragment = " ",
  Function = "󰊕 ",
  Hint = " ",
  Info = " ",
  Interface = " ",
  Key = " ",
  Keyword = "󰌋 ",
  LspSagaFinder = " ",
  Mac = " ",
  Method = "󰆧 ",
  Module = "󰆧 ",
  Namespace = " ",
  Negative = "✗ ",
  Null = "󰟢 ",
  Number = " ",
  Object = " ",
  Operator = "󰆕 ",
  Package = " ",
  Pending = "➜ ",
  Property = "󰜢 ",
  Reference = "󰈇 ",
  RenamePrompt = "➤ ",
  Snippet = " ",
  String = " ",
  Struct = "󰙅 ",
  Text = "󰉿 ",
  TypeParameter = "󰉺 ",
  Unit = "󰑭 ",
  Unix = " ",
  Value = "󰎠 ",
  Variable = "󰀫 ",
  Warn = " ",
}
tools.keymap = function(key)
  return key
end

tools.isenable = function(status)
  --NOTE:盘点插件是否启用

  -- status 0 两个环境, 1 vscode 2 neovide
  if status == 0 then
    if vim.g.vscode then
      return false
    end
    if vim.g.neovide then
      return false
    end
  end
  if status == 1 then
    if vim.g.vscode then
      return false
    end
  end
  if status == 2 then
    if vim.g.neovide then
      return false
    end
  end
  return true
end
return tools
