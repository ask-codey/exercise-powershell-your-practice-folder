# Checks your setup, and your answers in my-setup.txt, one test per question.
# Run it from this folder with: Invoke-Pester
# You don't need to change this file.

BeforeAll {
    $script:answers = @{}
    foreach ($line in Get-Content (Join-Path $PSScriptRoot 'my-setup.txt')) {
        if ($line -match '^\s*(\d+)\)\s*(.*)$') {
            $script:answers[[int]$Matches[1]] = $Matches[2].Trim().Trim("'", '"')
        }
    }

    # A path written with / or \, with or without one at the end, reads the same.
    function ConvertTo-PathText([string] $text) {
        ($text -replace '/', '\').TrimEnd('\')
    }
}

Describe 'Exercise: Your Practice Folder' {

    It '1) the version of PowerShell you are running' {
        $answers[1] | Should -Not -BeNullOrEmpty -Because 'question 1 has no answer yet. Run $PSVersionTable.PSVersion and write its three numbers with dots between them'
        $PSVersionTable.PSVersion.Major | Should -BeGreaterOrEqual 7 -Because 'this check has to run in PowerShell 7. Windows PowerShell 5.1 is the older one: open PowerShell 7 and run Invoke-Pester there'
        $running = '{0}.{1}.{2}' -f $PSVersionTable.PSVersion.Major, $PSVersionTable.PSVersion.Minor, $PSVersionTable.PSVersion.Patch
        $answers[1] | Should -Be $running -Because 'the answer is the Major, Minor and Patch numbers of the PowerShell running this check, such as 7.6.9'
    }

    It '2) the edition of PowerShell you are running' {
        $answers[2] | Should -Not -BeNullOrEmpty -Because 'question 2 has no answer yet. Run $PSVersionTable.PSEdition'
        $answers[2] | Should -Be $PSVersionTable.PSEdition -Because 'PowerShell 7 says Core, and Windows PowerShell 5.1 says Desktop'
    }

    It '3) your user name, the last part of your home folder' {
        $answers[3] | Should -Not -BeNullOrEmpty -Because 'question 3 has no answer yet. Run $HOME and write the last part of the path it prints'
        $answers[3] | Should -Be (Split-Path -Path $HOME -Leaf) -Because 'in C:\Users\Sam the last part is Sam; write the last part of your own home folder'
    }

    It '4) the shell Windows Terminal opens in a new tab' {
        $answers[4] | Should -Not -BeNullOrEmpty -Because 'question 4 has no answer yet. Open Windows Terminal settings (Ctrl+,) and look at Default profile on the Startup page'
        $answers[4] | Should -Match '^PowerShell( 7)?$' -Because 'the default profile should be PowerShell (version 7), not Windows PowerShell. On a Mac or Linux, write PowerShell'
    }

    It '5) this exercise folder is inside your practice folder' {
        $practice = ConvertTo-PathText (Join-Path -Path $HOME -ChildPath 'terminal-practice')
        (ConvertTo-PathText $PSScriptRoot) | Should -BeLike "$practice\*" -Because "the exercise folder belongs inside your practice folder, $practice. Move or unzip it there"
    }
}
