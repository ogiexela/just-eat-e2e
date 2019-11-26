# just-eat-e2e

# Requirements
1. [Python 3](https://www.python.org/downloads/release/python-380/)
1. [Robot Framework](https://github.com/robotframework/robotframework/blob/master/INSTALL.rst)
1. [SeleniumLibrary](https://github.com/robotframework/SeleniumLibrary)
1. [WebdriverManager](https://github.com/rasjani/webdrivermanager)

# Running Tests
1. In a terminal change directory to root directory containing `just-eat-e2e` folder
2. Run `robot --variable BROWSER_TYPE:firefox --outputdir out ./just-eat-e2e`

# Test results
Test results are stored in `out/report.html`

# Comments
1. Just-eat.co.uk use custom ids in their html which makes it easy to identify elements using css selectors
