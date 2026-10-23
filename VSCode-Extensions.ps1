$codeExtensions = @(
  'DavidAnson.vscode-markdownlint'	         # https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint
  'esbenp.prettier-vscode'	                 # https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode
 ' Gruntfuggly.todo-tree'                  	 # https://marketplace.visualstudio.com/items?itemName=Gruntfuggly.todo-tree
  'mechatroner.rainbow-csv'	                 # https://marketplace.visualstudio.com/items?itemName=mechatroner.rainbow-csv
  'ms-python.python'	                       # https://marketplace.visualstudio.com/items?itemName=ms-python.python
  'ms-python.vscode-pylance'	               # https://marketplace.visualstudio.com/items?itemName=ms-python.vscode-pylance
  'ms-python.vscode-python-envs'	           # https://marketplace.visualstudio.com/items?itemName=ms-python.vscode-python-envs
  'ms-python.debugpy'	                       # https://marketplace.visualstudio.com/items?itemName=ms-python.debugpy
  'ms-vscode.powershell'	                   # https://marketplace.visualstudio.com/items?itemName=ms-vscode.PowerShell
  'phoihos.csv-to-md-table'	                 # https://marketplace.visualstudio.com/items?itemName=phoihos.csv-to-md-table
  'streetsidesoftware.code-spell-checker'    # https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker
  'tinkertrain.theme-panda'	                 # https://marketplace.visualstudio.com/items?itemName=tinkertrain.theme-panda
  'tlahmann.alex-linter'	                   # https://marketplace.visualstudio.com/items?itemName=TLahmann.alex-linter
)

$codeExtensions.ForEach({code --install-extension $_})
