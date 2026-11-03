# Neovim C/S 模式命令(由 PowerShell $PROFILE dot-source 加载)
# 用法:
#   nvims - 在当前 wt 页签启动可交互的服务端实例(能看界面)
#   nvimc 文件... - 将文件发送到服务端,以 tab 打开
#   nvimf [关键词] - fd 文件名模糊搜索(fzf),选中后发送到服务端打开
#   nvimg 关键词 - ripgrep 内容搜索(fzf),选中后发送到服务端打开
#   yv - 用 yazi 浏览,按 o 将选中文件发送到服务端打开
$global:NvimPipe = "\\.\pipe\nvim-server"

# 命名管道存在性检测(PowerShell 的 Test-Path 对管道不可靠,会误报)
function Test-NvimPipe {
    [System.IO.Directory]::GetFiles("\\.\pipe\") -contains $global:NvimPipe
}

function nvims {
    if (Test-NvimPipe) {
        Write-Host "服务端已在运行: $global:NvimPipe" -ForegroundColor Yellow
        return
    }
    nvim.exe --listen $global:NvimPipe @args
}

function nvimc {
    param([Parameter(ValueFromRemainingArguments)]$rest)
    if (-not (Test-NvimPipe)) {
        Write-Host "服务端未启动,先在任意页签运行: nvims" -ForegroundColor Red
        return
    }
    if ($rest) {
        nvim.exe --server $global:NvimPipe --remote-tab @rest
    } else {
        # 不带文件时:让服务端打开文件树(neo-tree)并定位当前 shell 目录
        $dir = ($PWD.Path -replace '\\', '/')
        nvim.exe --server $global:NvimPipe --remote-send ":Neotree reveal left dir=$dir<CR>"
    }
}

function nvimf {
    param([Parameter(ValueFromRemainingArguments)]$query)
    $file = fd $query | fzf --preview 'bat --style=numbers --color=always {}'
    if ($file) { nvimc $file }
}

function nvimg {
    param([Parameter(Mandatory)]$query)
    $sel = rg -n --hidden --glob '!.git' -- $query | fzf --delimiter ':' --preview 'bat --style=numbers --color=always {1}'
    if ($sel) {
        # 从 "路径:行号:内容" 中提取路径(兼容路径含冒号的情况:取最后一段冒号前的部分按行号截断)
        $file = ($sel -replace ':\d+:.*$', '')
        nvimc $file
    }
}

function yv {
    # 用 yazi 浏览,按 o 选定文件后,将其发送到 nvim 服务端打开
    $tmp = [System.IO.Path]::GetTempFileName()
    yazi --chooser-file="$tmp"
    $files = Get-Content -Path $tmp -Encoding UTF8 | Where-Object { $_ }
    Remove-Item -Path $tmp
    if ($files) {
        nvimc @files
    }
}
