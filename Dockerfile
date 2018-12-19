FROM mono:5.16.0
COPY . /usr/src/app
RUN cd /usr/src/app && msbuild MahjongAI.sln /t:Build /p:Configuration=Release
RUN curl -sL https://deb.nodesource.com/setup_11.x | bash - \
    && apt-get install -y nodejs
RUN cd /usr/src/app/MajsoulHelper && npm install
CMD cd /usr/src/app/MahjongAI/bin/Release && mono ./MahjongAI.exe | grep -v Information
