#!/usr/bin/python
import sys
from gi.repository import Notify

title = sys.argv[1]
message = sys.argv[2]
Notify.init ("%s" % title)

notify_message = Notify.Notification.new ("%s" % title,"%s" % message,"dialog-information")
notify_message.show ()