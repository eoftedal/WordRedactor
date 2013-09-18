Command line utility for redacting Word documents on Mac OS X. Will replace highlighted text with garbage.


### Installation

	git clone https://github.com/eoftedal/WordRedactor.git


### How to use
1. Open the document to be redacted in Word, and highlight the text with pink background (why pink and not black? see 4.)
2. Save the document under a new name
3. Run `/path/to/WordRedactor/redact.sh <new file>`
4. Check that all pink sections have been changed to black in the resulting file.

