--------------------------------------------------
ChangeTextReplace.vbs
Readme.txt
--------------------------------------------------
Standard Software
2015/01/31
--------------------------------------------------
���@�\
ChangeTextReplace.vbs �̓e�L�X�g���̕������u�������ϊ�����
�R�}���h�v���O�����ł��B

���g����
���̂悤�ɃR�}���h���w�肵�Ď��s���܂��B

    ChangeTextReplace.vbs
        ���t�@�C���G���R�[�h��
        ���t�@�C���p�X
        �ϊ��w��
        [�ϊ���t�@�C���p�X]

������3��������4�ɂ��ăR�}���h���Ăяo���܂��B
[�ϊ���t�@�C���p�X]���ȗ������ꍇ��
���t�@�C���𒼐ڃG���R�[�h�ϊ����܂��B

���g�p��

ChangeTextReplace.vbs "SHIFT_JIS" .\TestFile\File_SJIS.txt "123��456,�����������˂���������" .\TestFile\File_SJIS-Replace.txt

�G���R�[�h����t�@�C���p�X��
�_�u���N�E�H�[�e�[�V�����ň͂��Ă��͂�Ȃ��Ă�OK�ł���
�󔒂��܂ރt�@�C���p�X�̏ꍇ��
�_�u���N�E�H�[�e�[�V�������K�v�ɂȂ�܂��B

���Ή��g���q
    �G���R�[�h          �w�蕶��
    ShiftJIS            SHIFT_JIS
    UTF-16LE BOM�L��    UNICODEFFFE/UNICODE/UTF-16
    UTF-16LE BOM����    UTF-16LE
    UTF-16BE BOM�L��    UNICODEFEFF
    UTF-16BE BOM����    UTF-16BE
    UTF-8 BOM�L��       UTF-8
    UTF-8 BOM����       UTF-8N
    JIS                 ISO-2022-JP
    EUC-JP              EUC-JP
    UTF-7               UTF-7

�ǂݍ��ݎ��� UTF-8 �� UTF-16LE �̏ꍇ��
BOM�̗L���֌W�Ȃ��ǂݍ��ގ��͉\�ł��B

���ϊ��w��
�g�p��Ŏ����Ă���Ƃ���A
�J���}��؂�ŁA�����w�肷�邱�Ƃ��ł�
    �ϊ��O�˕ϊ���
�Ƃ����`���Ŏw�肵�Ă��������B


