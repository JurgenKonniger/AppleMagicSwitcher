#
# Original code from Project MonkeySwitcher (https://github.com/gyptazy/MonkeySwitcher)
#
#  Copyright (c) 2022 Florian Paul Azim Hoberg @gyptazy <gyptazy@gyptazy.ch>
#  
#  Bundles "blueutil" (https://github.com/toy/blueutil/) binaries
#  for amd64 and arm64 hardware architectures which are written
#  and maintained by:
#   * Frederik Seiffert <ego@frederikseiffert.de>
#  * Ivan Kuchin (@toy)
#  * Friedrich (@friedrich)
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


# Replace the placeholder of the variable BTMAC with the MAC address of your device.
# If necessary Adjust the variable BIN with your location of blueutil.
BTMAC="replace-with-your-mac-address"
BIN="/opt/homebrew/bin/blueutil"

# Switch device
CMD_VAL="$($BIN --is-connected $BTMAC)"
CMD_UNPAIR="$BIN --unpair $BTMAC"
CMD_PAIR="$BIN --pair $BTMAC"
CMD_CONN="$BIN --connect $BTMAC"
if [[ "$CMD_VAL" -eq 1 ]]; then
    echo "Connected to $BTMAC"
    echo "Going to disconnect $BTMAC"
    $($CMD_UNPAIR)
    if [[ $? -eq 0 ]]; then
        echo "Disconnected from $BTMAC"
    else
        echo "Failed to disconnect from $BTMAC"
        exit 1
    fi
else
    echo "Not connected to $BTMAC"
    $($CMD_PAIR)
    sleep 1
    $($CMD_CONN)
    if [[ $? -eq 0 ]]; then
        echo "Connected to $BTMAC"
    else
        echo "Failed to connect to $BTMAC"
        exit 1
    fi
fi
