cscript ..\ChangeTextReplace\ChangeTextReplace.vbs "shift_jis" .\TestFile\File_SJIS.txt "123��456,�����������˂���������" .\TestFile\File_SJIS-Replace.txt

cscript ..\ChangeTextReplace\ChangeTextReplace.vbs "utf-8" .\TestFile\File_UTF8.txt "123��456,�����������˂���������" .\TestFile\File_UTF8-Replace.txt

cscript ..\ChangeTextReplace\ChangeTextReplace.vbs "utf-8n" .\TestFile\File_UTF8N.txt "123��456,�����������˂���������" .\TestFile\File_UTF8N-Replace.txt

pause