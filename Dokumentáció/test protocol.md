# Test report

| 1. | Test report
| ---- | ---- |
| Description and purpose of the test case Log in only by entering the correct data. |
| Description of the process / function tested during the test we made sure that only registered people can access the site. So only a username and password pair stored in the database can be accessed. |
| Prerequisites for testing The username and password stored in the database are paired, Loginform available on the website. |
| Date and time of testing The username and password stored in the database are paired, Loginform available on the website. |
| Date of testing 04/30/2020. |
| Type of test data Text
| Person (s) performing the test Marton Benjámin |
| Settings of the tested system Closed system with developer access only. |
| Expected result of the test case Error message if you enter incorrect login details or if the field is not filled in. Entering the page if you enter the correct login details. |
| Test result With appropriate comments
| Note In the absence of a frontend, it could only be verified by querying the database. |

| 2. | Test report
| ---- | ---- |
| Description and purpose of the test case Secure storage of data
| Description of the process / function tested Ensure that the data cannot be accessed by unauthorized persons only by those authorized to do so. |
| Prerequisites for testing Proper construction of data storage in the database. |
| Date of testing 11/15/2019. |
| Type of test data Text
| Person (s) performing the test Marton Benjámin |
| Settings of the tested system Closed system with developer access only. |
| Expected result of the test case No non-logged in or only simple users have access to any non-public information about the company. |
| Test result Not complied with
| Note The reason for the failure was that there was no frontend so intrusion from the website could not be simulated in this form. |

| 3. | Test report
| ---- | ---- |
| Description and purpose of the test case Display information easily and clearly for users
| Description of the process / function tested For users, all content displayed on the site is clear and unambiguous. |
| Prerequisites for testing Access to backend data
| Date of testing 05/05/2020. |
| Type of test data Able
| Person (s) performing the test Sass-Gyarmati Norbert |
| Settings of the tested system Closed system with developer access only. |
| Expected result of the test case - |
| Test result Not complied with
| Note In the absence of a frontend, this test failed. |

| 4. | Test report
| ---- | ---- |
| Description and purpose of the test case Appropriate listing of garage doors on the website for both users and workers
| Description of the process / function tested Users can only see the currently available garage doors and their parts, while for employees all products and their current status as well as the supervisor can modify all data |
| Prerequisites for testing Users can only see the currently available garage doors, while the supervisor can also see all garage doors, parts and their current status, as well as be able to change the status of products. |
| Date and time of testing 04/25/2020. |
| Type of test data Image / Text
| Person (s) performing the test Sass-Gyarmati Norbert |
| Settings of the tested system Closed system with developer access only. |
| Expected result of the test case - |
| Test result With appropriate comments
| Note Database queries worked, but could not be performed through the interface. |
