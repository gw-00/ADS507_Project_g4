@echo off

REM change directory to this folder where the batch file is.
cd /d %~dp0

REM activate main anaconda environment
call "C:\Users\Username\anaconda3\Scripts\activate.bat" main

REM run Jupyter notebook
jupyter nbconvert --to notebook --execute notebook_name.ipynb --stdout > run_log.txt 2>&1

REM deactivate main anaconda environment
call conda deactivate

echo Task completed at %DATE% %TIME% >> run_log.txt