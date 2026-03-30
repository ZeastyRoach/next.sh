# next.sh; Bash script for the natas wargame. Made to save time on commands, get more done. 
======
Script works by reading file: natas.md
If you do not have this file make one.
Essential layout of passwords:
(anything before is optional) natas(number of level) is (password)
======
There are two read commands:
* Current level:
  - Accepted inputs: #(0-9), ?
  - ?: searches natas.md for highest number variant of natas password
  - Anything else returns: If unsure, use: ?
* curl? :
  - Accepted inputs: all valid curl flags
  - Anything else gets discarded
That's all you need to know. Happy hacking!
