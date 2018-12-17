echo ".profile sourced"
PATH=/usr/local/bin:/usr/local/sbin:/usr/bin/:/usr/sbin:/bin:/sbin

if [ -d "/usr/lib64/qt-3.3/bin/" ]; then PATH="$PATH:/usr/lib64/qt-3.3/bin"; fi

if [ -d "/usr/lib64/ccache" ]; then PATH="/usr/lib64/ccache:$PATH"; fi

if [ -d "/var/lib/snapd/snap/bin" ]; then PATH="$PATH:/var/lib/snapd/snap/bin"; fi

if [ -d "/opt/anaconda3/bin/" ]; then PATH="$PATH:/opt/anaconda3/bin/"; fi

if [ -d "/opt/sublime_text" ]; then PATH="$PATH:/opt/sublime_text/"; fi

if [ -d "/usr/local/go/bin" ]; then PATH="$PATH:/usr/local/go/bin/"; fi

export PATH
