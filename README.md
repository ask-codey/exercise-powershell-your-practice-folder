# Exercise: Your Practice Folder

Exercise code for the lesson **Exercise: Your Practice Folder** in PowerShell in Depth on [ask-codey.com](https://www.ask-codey.com).

Before you explore anything, make sure your setup is ready: PowerShell 7 installed and opening in Windows Terminal, and a practice folder where every exercise in the course will live. You'll ask PowerShell four questions about itself, write the answers in `my-setup.txt`, and run your first check with Pester.

## What's here

- `my-setup.txt`: one line for each question, waiting for your answer. For you to finish.
- `Check.Tests.ps1`: the check that reads your answers and looks at your setup. You don't need to change it.

## What to do

1. Put this folder inside your practice folder, `$HOME\terminal-practice`. If you haven't made the practice folder yet, the lesson *Setup: Windows Terminal and PowerShell 7* shows the one command that makes it.
2. Open PowerShell 7 in this folder. In File Explorer, right-click an empty part of the folder and choose **Open in Terminal**, or run this, with your own folder's name if it differs:

   ```powershell
   Set-Location -Path "$HOME\terminal-practice\exercise-powershell-your-practice-folder"
   ```

3. Answer each question, and write the answer after its number in `my-setup.txt`, on the same line, for example `2) Core`.

   1. Which version of PowerShell are you running? Run `$PSVersionTable.PSVersion` and write its Major, Minor and Patch numbers with dots between them, such as `7.6.9`.
   2. Which edition is it? Run `$PSVersionTable.PSEdition`.
   3. What is your user name, the last part of your home folder's path? Run `$HOME`: in `C:\Users\Sam`, it's `Sam`.
   4. Which shell does Windows Terminal open in a new tab? Open its settings with **Ctrl+,** and read **Default profile** on the **Startup** page. Write its name as it appears there. On a Mac or Linux, write `PowerShell`.

## Check your work

The check uses Pester, PowerShell's test tool. Install it once:

```powershell
Install-PSResource Pester
```

The first time, PowerShell asks whether you're sure you want to install from `PSGallery`, the PowerShell Gallery, because a new computer doesn't mark it as trusted yet. Type `Y` and press Enter. Pester installs for your user account only, so it needs no administrator window.

Then, from this folder:

```powershell
Invoke-Pester
```

At first the tests fail: that is expected. Each answer you write turns its test green, and test 5 turns green when this folder sits inside your practice folder. A failing test's message says which question it is and where to look.

If PowerShell says the check *cannot be loaded because running scripts is disabled* or *is not digitally signed*, the folder came from a download that Windows marked as from the internet. Unblock its files once with `Get-ChildItem -Recurse | Unblock-File`, from this folder, and run `Invoke-Pester` again. *Why a Script Won't Run: The Execution Policy*, in Module 5, explains what that does.

## Tips

- Run the check in PowerShell 7, not in Windows PowerShell 5.1. `$PSVersionTable.PSEdition` tells you which one you're in.
- Copy and paste beats typing: select the answer PowerShell printed, and paste it into `my-setup.txt`.
- Save `my-setup.txt` before you run `Invoke-Pester` again.

## Hand it in

When it works, push your solution to a public repo of your own on GitHub, then paste that repo's address into **Submit your exercise** on the lesson page at [ask-codey.com](https://www.ask-codey.com). That's what completes the lesson. The lesson page shows the Git commands, step by step.
