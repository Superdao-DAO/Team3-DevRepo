@set PATH=%WINDIR%\System32;%~dp0Import\Node;%~dp0Import\Git\bin;%~dp0Import\Git\usr\bin;%~dp0Import\Code;%~dp0Import\Python;%~dp0Import\OpenSSL
@echo Installing Ethereum test development environment

@if not exist Import\Git (
	@call Import\Downloads\PortableGit-2.8.1-64-bit.7z.exe -y -gm1
	@move Import\Downloads\PortableGit Import\Git
)

@echo Installing Node.js
@set source=https://nodejs.org/dist/v5.10.1/win-x64
@set target=node-5.10.1.exe
@if not exist Import\Downloads\%target% call curl -#L "%source%/node.exe" -o Import\Downloads\%target%
@if not exist Import\Node (
	@md Import\Node
	@copy Import\Downloads\%target% Import\Node\node.exe
)

@echo Installing NPM
@set source=https://nodejs.org/dist/npm
@set target=npm-1.4.12.zip
@if not exist Import\Downloads\%target% call curl -#L "%source%/%target%" -o Import\Downloads\%target%
@if not exist Import\Node\npm.cmd (
	@call unzip -n Import\Downloads\%target% -d Import\Node
	@call npm i -g npm@latest
)

@echo Installing Ethereum Geth
@set source=https://github.com/ethereum/go-ethereum/releases/download/v1.3.6
@set target=Geth-Win64-20160401105807-1.3.6-9e323d6.zip
@if not exist Import\Downloads\%target% call curl -#L "%source%/%target%" -o Import\Downloads\%target%
@if not exist Import\Geth (
	@md Import\Geth
	@call unzip -n Import\Downloads\%target% -d Import\Geth
)

@echo Installing Visual Studio Code
@set source=https://go.microsoft.com/fwlink/?LinkID=623231
@set target=vscode-0.10.11.zip
@if not exist Import\Downloads\vscode-0.10.11.zip call curl -#L "%source%" -o Import\Downloads\%target%
@if not exist Import\Code (
	@md Import\Code
	@call unzip -n Import\Downloads\%target% -d Import\Code
)

@echo Installing Python
@set source=https://www.python.org/ftp/python/2.7.11
@set target=python-2.7.11.amd64.msi
@if not exist Import\Downloads\%target% call curl -#L "%source%/%target%" -o Import\Downloads\%target%
@if not exist Import\Python (
	@md Import\Python
	@call msiexec /a Import\Downloads\%target% /qb TARGETDIR="%~dp0Import\Python"
)

@echo Installing OpenSSL
@set source=https://indy.fulgan.com/SSL
@set target=openssl-1.0.2g-x64_86-win64.zip
@if not exist Import\Downloads\%target% call curl -#L "%source%/%target%" -o Import\Downloads\%target%
@if not exist Import\OpenSSL (
	@md Import\OpenSSL
	@call unzip -n Import\Downloads\%target% -d Import\OpenSSL
)

@echo Installing OpenSSL Libraries
@set source=https://indy.fulgan.com/SSL/LinkLibs
@set target=openssl-1.0.2g-x64_86-win64_LinkLibs.zip
@if not exist Import\Downloads\%target% call curl -#L "%source%/%target%" -o Import\Downloads\%target%
@if not exist Import\OpenSSL\Lib (
	@md Import\OpenSSL\Lib
	@call unzip -n Import\Downloads\%target% -d Import\OpenSSL\Lib
)

@echo Installing Truffle
@if not exist Import\Node\testrpc.cmd (
	@if not exist C:\OpenSSL-Win64\lib md C:\OpenSSL-Win64\lib
	@copy Import\OpenSSL\Lib\*.lib C:\OpenSSL-Win64\lib
	@call npm i -g ethereumjs-testrpc
	@if not exist C:\OpenSSL-Win64\bin rd /s /q C:\OpenSSL-Win64
)
@if not exist Import\Node\truffle.cmd call npm i -g truffle