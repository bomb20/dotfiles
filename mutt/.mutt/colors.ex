# Colours for items in the index
color index brightgreen black ~N
# Hmm, don't like this.
#color index brightgreen black "~N (~x byers.world)|(~x byers.x)|(~x langly.levallois123.axialys.net)|(~x the.earth.li)"
color index black black ~F
color index black green ~T
color index brightred black ~D
mono index bold ~N
mono index bold ~F
mono index bold ~T
mono index bold ~D

# Highlights inside the body of a message.

# URLs
color body brightgreen default "(http|ftp|news|telnet|finger)://[^ \"\t\r\n]*"
color body brightgreen default "mailto:[-a-z_0-9.]+@[-a-z_0-9.]+"
mono body bold "(http|ftp|news|telnet|finger)://[^ \"\t\r\n]*"
mono body bold "mailto:[-a-z_0-9.]+@[-a-z_0-9.]+"

# email addresses
color body brightgreen black "[-a-z_0-9.%$]+@[-a-z_0-9.]+\\.[-a-z][-a-z]+"
#mono body bold "[-a-z_0-9.%$]+@[-a-z_0-9.]+\\.[-a-z][-a-z]+"

# header
color header green black "^from:"
color header green black "^to:"
color header green black "^cc:"
color header green black "^date:"
color header yellow black "^newsgroups:"
color header yellow black "^reply-to:"
color header black black "^subject:"
color header red black "^x-spam-rule:"
color header green black "^x-mailer:"
color header yellow black "^message-id:"
color header yellow black "^Organization:"
color header yellow black "^Organisation:"
color header yellow black "^User-Agent:"
color header yellow black "^message-id: .*pine"
color header yellow black "^X-Fnord:"
color header yellow black "^X-WebTV-Stationery:"
color header yellow black "^X-Message-Flag:"
color header yellow black "^X-Spam-Status:"
color header yellow black "^X-SpamProbe:"
color header red black "^X-SpamProbe: SPAM"


# Coloring quoted text - coloring the first 7 levels:
color quoted cyan black
color quoted1 yellow black
color quoted2 red black
color quoted3 green black
color quoted4 cyan black
color quoted5 yellow black
color quoted6 red black
color quoted7 green black


# Default color definitions
#color hdrdefault white green
color signature brightmagenta black
color indicator black green
color attachment black green
color error red black
color message white black
color search brightwhite magenta
color status black blue
color tree brightblue black
color normal white default
color tilde green black
color bold black black
#color underline magenta black
color markers brightgreen black
# Colour definitions when on a mono screen
mono bold bold
mono underline underline
mono indicator reverse

