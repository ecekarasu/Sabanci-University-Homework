@echo off
REM ****************************************************************************
REM Vivado (TM) v2018.2 (64-bit)
REM
REM Filename    : elaborate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for elaborating the compiled design
REM
REM Generated by Vivado on Mon Nov 29 02:04:08 +0300 2021
REM SW Build 2258646 on Thu Jun 14 20:03:12 MDT 2018
REM
REM Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
REM
REM usage: elaborate.bat
REM
REM ****************************************************************************
call xelab  -wto 018b763295404db3a59e5bc18cb3383d --incr --debug typical --relax --mt 2 --maxdelay -L xil_defaultlib -L simprims_ver -L secureip --snapshot cla_sim_time_impl -transport_int_delays -pulse_r 0 -pulse_int_r 0 -pulse_e 0 -pulse_int_e 0 xil_defaultlib.cla_sim xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0