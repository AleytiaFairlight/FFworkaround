﻿# The MIT License (MIT)
# 
# Copyright (c) 2024 AleytiaFairlight
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy of
# this software and associated documentation files (the "Software"), to deal in
# the Software without restriction, including without limitation the rights to
# use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
# the Software, and to permit persons to whom the Software is furnished to do so,
# subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
# FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
# COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
# IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
# CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

param([string]$Hostname = "www.fanfiction.net")
# Remove entry from hosts file. Removes all entries that match the hostname (i.e. both IPv4 and IPv6).
#Requires -RunAsAdministrator
$hostsFilePath = "$($Env:WinDir)\system32\Drivers\etc\hosts"
$hostsFile = Get-Content $hostsFilePath
Write-Host "About to remove $Hostname from hosts file" -ForegroundColor Gray
$escapedHostname = [Regex]::Escape($Hostname)
If (($hostsFile) -match ".*\s+$escapedHostname.*")  {
    Write-Host "$Hostname - removing from hosts file... " -ForegroundColor Yellow -NoNewline
    $hostsFile -notmatch ".*\s+$escapedHostname.*" | Out-File $hostsFilePath 
    Write-Host " done"
} 
Else {
    Write-Host "$Hostname - not in hosts file (perhaps already removed); nothing to do" -ForegroundColor DarkYellow
}