function Copy_path()
  VSCodeNotify("copyFilePath")
end

function Copy_relative_path()
  VSCodeNotify("copyRelativeFilePath")
end

-- this is for the whichkey extension in vscode, I am probably not going to use it
-- function Whichkey_show() VSCodeNotify("whichkey.show") end

-- toggle the file explorer
function Toggle_file_explorer()
  VSCodeNotify("workbench.view.explorer")
end
