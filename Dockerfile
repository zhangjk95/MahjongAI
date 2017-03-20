FROM mono:3.10-onbuild
CMD ["sh", "-c", "mono ./Tenhou.exe | grep -v Information"]
