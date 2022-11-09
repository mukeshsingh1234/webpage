<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Register yourself</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="css/style.css">

<script type="text/javascript" src="/tracker/unomi-web-tracker.min.js"></script>
<script type="text/javascript">
        (function () {
            const unomiTrackerTestConf = {
                "scope": "unomi-tracker-test",
                "site": {
                    "siteInfo": {
                        "siteID": "http://localhost:8091/webpage"
                    }
                },
                "page": {
                    "pageInfo": {
                        "pageID": "unomi-tracker-test-page",
                        "pageName": document.title,
                        "pagePath": document.location.pathname,
                        "destinationURL": document.location.origin + document.location.pathname,
                        "language": "en",
                        "categories": [],
                        "tags": []
                    },
                    "attributes": {},
                    "consentTypes": []
                },
                "events:": [],
                "wemInitConfig": {
                    "contextServerUrl": document.location.origin,
                    "timeoutInMilliseconds": "1500",
                    "contextServerCookieName": "context-profile-id",
                    "activateWem": true,
                    "trackerSessionIdCookieName": "unomi-tracker-test-session-id",
                    "trackerProfileIdCookieName": "unomi-tracker-test-profile-id"
                }
            }

            // generate a new session
            if (unomiWebTracker.getCookie(unomiTrackerTestConf.wemInitConfig.trackerSessionIdCookieName) == null) {
                unomiWebTracker.setCookie(unomiTrackerTestConf.wemInitConfig.trackerSessionIdCookieName, unomiWebTracker.generateGuid(), 1);
            }

            // init tracker with our conf
            unomiWebTracker.initTracker(unomiTrackerTestConf);

            unomiWebTracker._registerCallback(() => {
                console.log("Unomi tracker test successfully loaded context", unomiWebTracker.getLoadedContext());
            }, 'Unomi tracker test callback example');

            // start the tracker
            unomiWebTracker.startTracker();
        })();
    </script>

</head>
<body>

<input type ="hidden" id ="status" value="<%=  request.getAttribute("status") %>">
	<div class="main">

		<!-- Sign up form -->
		<section class="signup">
			<div class="container">
				<div class="signup-content">
					<div class="signup-form">
						<h2 class="form-title">Sign up</h2>
					
						<form method="post" action="register" class="register-form"
							id="register-form">
							<div class="form-group">
								<label for="name"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="name" id="name" placeholder="Your Name" />
							</div>
							<div class="form-group">
								<label for="email"><i class="zmdi zmdi-email"></i></label> <input
									required type="email" name="email" id="email" placeholder="Your Email" />
							</div>
							<div class="form-group">
								<label for="pass"><i class="zmdi zmdi-lock"></i></label> <input
									required type="password" name="pass" id="pass" placeholder="Password" />
							</div>
							<div class="form-group">
								<label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
								<input required type="password" name="re_pass" id="re_pass"
									placeholder="Repeat your password" />
							</div>
							<div class="form-group">
								<label for="contact"><i class="zmdi zmdi-lock-outline"></i></label>
								<input required type="text" name="contact" id="contact"
									placeholder="Contact no" />
							</div>
							<div class="form-group">
								<input required type="checkbox" name="agree-term" id="agree-term"
									class="agree-term" /> <label for="agree-term"
									class="label-agree-term"><span><span></span></span>I
									agree all statements in <a href="#" class="term-service">Terms
										of service</a></label>
							</div>
							<div class="form-group form-button">
								<input type="submit" name="signup" id="signup"
									class="form-submit" value="Register" />
							</div>
						</form>
					</div>
					<div class="signup-image">
						<figure>
							<img src="images/signup-image.jpg" alt="sing up image">
						</figure>
						<a href="login.jsp" class="signup-image-link">I am already
							member</a>
					</div>
				</div>
			</div>
		</section>


	</div>
	<!-- JS -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">

<script type="text/javascript">

	var status = document.getElementById("status").value;
	if (status == "success"){
		 swal("Account Created Successfull","Please Return To Login Page","success")
	}
	
</script>

<script>

document.getElementById('register-form').addEventListener("submit", function(e){

	 var email = document.getElementById("email").value;
	 var pageUrl = document.location.href;

	 rudderanalytics.identify(email,{'email': email,
	 					'page_url' : pageUrl
	 			});
	 			
	 rudderanalytics.track('new registration', {
	 	'email' : email,
	 	'page_url' : pageUrl
	 			});
	
	console.log("email", email);
	console.log("pageUrl", pageUrl);
})



	</script>

</body>

</html>








;

