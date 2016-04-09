@call .\Shell /c

@if not exist Import\Git call md Import\Git
@call Import\Downloads\PortableGit-2.8.1-64-bit.7z.exe -y -oImport\Git

@if not exist Import\Node call md Import\Node
@if not exist Import\Node\node.exe call curl -#L https://nodejs.org/dist/latest/win-x64/node.exe -o Import\Node\node.exe
@if not exist Import\Downloads\npm-1.4.12.zip call curl -#L https://nodejs.org/dist/npm/npm-1.4.12.zip -o Import\Downloads\npm-1.4.12.zip
@call unzip -n Import\Downloads\npm-1.4.12.zip -d Import\Node
@call npm up -g

@if not exist Import\Geth call md Import\Geth
@if not exist Import\Downloads\geth-1.3.6.zip call curl -#L https://github.com/ethereum/go-ethereum/releases/download/v1.3.6/Geth-Win64-20160401105807-1.3.6-9e323d6.zip -o Import\Downloads\geth-1.3.6.zip
@call unzip -n Import\Downloads\geth-1.3.6.zip -do Import\Geth

@if not exist Import\Code call md Import\Code
@if not exist Import\Downloads\vscode-0.10.11.zip call curl -#L https://go.microsoft.com/fwlink/?LinkID=623231 -o Import\Downloads\vscode-0.10.11.zip
@call unzip -n Import\Downloads\vscode-0.10.11.zip -do Import\Code