<%-- 
    Document   : landing
    Created on : 28-Feb-2024, 3:56:02 pm
    Author     : ROHIT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Landing Page</title>
        <%@include file="Components/common_css_js.jsp" %>
        <style>
            /* Header */
            html {
  font-size: 62.5%;
            behavior: smooth;
            }
.header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  /* background-color: #fdf2e9; */

  /* Because we want header to be sticky later */
  height: 9.6rem;
  padding: 0 4.8rem;
  position: relative;
}

.logo {
  height: 4.8rem;
  padding: 1px;
}
.logo *:focus {
  outline: 1px solid #cf711f;
}

/**************************/
/* NAVIGATION */
/**************************/

.main-nav-list {
  list-style: none;
  display: flex;
  align-items: center;
  gap: 4.8rem;
}

.main-nav-link:link,
.main-nav-link:visited {
  display: inline-block;
  text-decoration: none;
  color: #333;
  font-weight: 500;
  font-size: 1.8rem;
  transition: all 0.03s;
}

.main-nav-link:hover,
.main-nav-link:active {
  color: #cf711f;
}

.main-nav-link.nav-cta:link,
.main-nav-link.nav-cta:visited {
  padding: 1.2rem 2.4rem;
  border-radius: 9px;
  color: #fff;
  background-color: #7950f2;
}

.main-nav-link.nav-cta:hover,
.main-nav-link.nav-cta:active {
  background-color: #5f3dc4;
}

/* MOBILE */
.btn-mobile-nav {
  border: none;
  background: none;
  cursor: pointer;

  display: none;
}

.icon-mobile-nav {
  height: 4.8rem;
  width: 4.8rem;
  color: #333;
}

.icon-mobile-nav[name="close-outline"] {
  display: none;
}

/* STICKY NAVIGATION */
.sticky .header {
  position: fixed;
  top: 0;
  bottom: 0;
  width: 100%;
  height: 8rem;
  padding-top: 0;
  padding-bottom: 0;
  background-color: rgba(255, 255, 255, 0.97);
  z-index: 999;
  box-shadow: 0 1.2rem 3.2rem rgba(0, 0, 0, 0.03);
}

.sticky .section-hero {
  margin-top: 9.6rem;
}

.header-hero {
  background-color: #f3f0ff;
}
header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  background-color: #f3f0ff;
  padding: 2rem 4.8rem;
}
.sticky {
  position: fixed;
  top: 0;
  bottom: 0;
  width: 100%;
  height: 8rem;
  padding-top: 0;
  padding-bottom: 0;
  background-color: rgba(243, 240, 255, 0.95);
  z-index: 99;
  box-shadow: 0 1.2rem 3.2rem rgba(0, 0, 0, 0.03);
}
.logo {
  text-decoration: none;
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 1rem;
  border-radius: 1rem;
}
.logo-icon {
  font-size: 4.4rem;
  color: #523500;
  border-radius: 1.6rem;
}
.logo-text {
  font-size: 2.4rem;
  color: #523500;
}
.menu-icon {
  height: 3.6rem;
  width: 3.6rem;
  position: absolute;
  right: 5rem;
  opacity: 0;
  pointer-events: none;
  visibility: hidden;
}
.close-icon {
  height: 3.6rem;
  width: 3.6rem;
  position: absolute;
  right: 5rem;
  z-index: 9;
}

/* navigation */
.nav-list {
  display: flex;
  list-style: none;
  align-items: flex-end;
  gap: 3rem;
}
.nav-link {
  text-decoration: none;
  color: #333;
  font-size: 2rem;
  font-weight: 400;
  padding: 1rem;
  border-radius: 1rem;
}
.link-btn {
  background-color: #ff922b;
  border-radius: 1.6rem;
  color: #000;
  padding: 1rem;
}

/* Hero Section */
.hero-section {
  background-color: #f3f0ff;
  padding: 8rem;
  padding-top: 5rem;
  position: relative;
}
.container {
  max-width: 130rem;
  display: grid;

  grid-template-columns: 1fr 1fr;
  gap: 4rem;
  margin: 0 auto;
  align-content: center;
}
.hero-img {
  background-size: contain;
  background-repeat: no-repeat;
  border-radius: 2rem;
  margin-bottom: 1rem;
  opacity: 10;
  filter: hue-rotate(185deg);
}
.hero-text {
  display: flex;
  flex-direction: column;
  justify-content: center;
  gap: 4rem;
}
.hero-text p {
  font-size: 2rem;
  line-height: 1.5;
  color: #333;
}
.main-heading {
  font-size: 4.8rem;
  font-weight: 700;
  color: #111;
}
.link-btn-Explore {
  background-color: #7950f2 !important;
  opacity: 60%;
  color: #fff !important;
  padding: 1.8rem 2rem;
  border-radius: 1.6rem;
  border-radius: 1rem;
  transition: all 0.3s;
}
.link-btn-Explore:hover {
  opacity: 100%;
}

/* Steps */
.Steps-heading {
  font-size: 6.4rem;
  grid-column: 1/-1;
  padding: 8rem 0;
  align-self: center;
  color: #573800;
}
.steps {
  margin: 0 auto;
  max-width: 120rem;
  display: grid;
  grid-template-columns: 1fr 1fr;
  padding: 3rem;
  padding-top: 10rem;
}
.step {
  display: flex;
  flex-direction: column;
  color: #333;
  max-width: 80%;
  gap: 1.2rem;
  border: 2px solid #ff922b;
  border-radius: 2rem;
  transition: all 0.3s;
}
.step:hover {
  box-shadow: 0 1rem 1rem rgba(0, 0, 0, 0.2);
}
.step h3 {
  font-size: 9rem;
  color: #d0bfff;
}
.step h4 {
  font-size: 2.8rem;
}
.step-info {
  display: flex;
  flex-direction: column;
  justify-content: center;
  gap: 1rem;
  font-size: 2rem;
  padding: 1rem;
  color: #666;
}
.step-btn {
  padding: 1rem 0;
}
.step-link {
  padding: 1rem 1.6rem;
  background-color: #7950f2;
  text-decoration: none;
  border-radius: 1rem;

  color: #fff !important;
}
.step-link:hover {
  background-color: #5f3dc4;
}
.step-img img {
  border-bottom-left-radius: 2rem;
  border-bottom-right-radius: 2rem;
}
.step-1 {
  margin-bottom: 5rem;
}
.step-3 {
  margin-top: 8rem;
  margin-bottom: 5rem;
}
.step-2 {
  margin-top: 9rem;
  margin-bottom: 5rem;
}
.step-4 {
  margin-top: 12rem;
  margin-bottom: 5rem;
}

/* features */
.features {
  margin: 0 auto;
  max-width: 120rem;
  display: grid;
  grid-template-columns: 1fr 1fr 1fr 1fr;
  column-gap: 4rem;
  row-gap: 8rem;
  padding-top: 7rem;
  padding-left: 3rem;
  padding-right: 3rem;
}

.features h2 {
  font-size: 6.4rem;
  grid-column: 1/-1;
  padding-bottom: 2rem;
  color: #573800;
  padding-top: 8.4rem;
}
.features-box {
  display: grid;
  grid-template-columns: 1fr;
  grid-template-rows: 1.5fr 1fr 1fr;
  gap: 1rem;
  border: 1px solid #ff922b;
  align-items: center;
  border-radius: 2rem;
  overflow: hidden;
  transition: all 0.3s;
}
.features-box:hover {
  transform: translateY(-1rem);
  box-shadow: 0 1rem 1rem rgba(0, 0, 0, 0.2);
}
.features-box h3 {
  font-size: 3.2rem;
  padding: 1rem;
  line-height: 1;
  font-weight: 700;
  color: #333;
  align-self: center;
}
.features-box p {
  font-size: 1.8rem;
  padding: 1rem;
  color: #666;
  align-self: start;
}
/* CTA */
.CTA-container {
  padding: 3rem;
}
.empty {
  height: 25vh;
}
.CTA {
  max-width: 120rem;
  margin: 0 auto;
  display: grid;
  grid-template-columns: 1fr 1fr;
  border: 1px solid #ff922b;
  border-radius: 2rem;
  background-color: #f3f0ff;
  overflow: hidden;
  box-shadow: 0 1rem 1rem rgba(0, 0, 0, 0.4);
}

.CTA-heading {
  font-size: 6.4rem;
  padding-bottom: 2rem;
  color: #573800;
}
.CTA-text {
  display: grid;
  grid-template-columns: 1fr;
  gap: 2rem;
  padding: 2rem;
  border-right: 1px solid #333;
}
.CTA-text h3 {
  font-size: 3.2rem;
  letter-spacing: -1px;
  line-height: 0.9;
  align-self: center;
  font-weight: 700;
}
.CTA-text label {
  align-self: end;
  font-size: 1.8rem;
  padding: 3px;
}
.CTA-text p {
  font-size: 1.8rem;
  align-self: center;
  color: #666;
}
.CTA-btn {
  margin-top: 2rem;
}
.CTA-link {
  padding: 1.2rem 1.6rem;
  background-color: #7950f2;
  text-decoration: none;
  border-radius: 1rem;
  color: #fff !important;
  font-size: 1.6rem;
  text-decoration: none;
  transition: all 0.3s;
}
.CTA-link:hover {
  background-color: #5f3dc4;
}
.CTA input {
  border-radius: 0.8rem;
  padding: 1rem;
  border: none;
  font-size: 1.6rem;
}
.CTA input:focus {
  border: none;
  box-shadow: inset 0 0 0 3px #ff922b;
}

.seprate {
  border-top: 1px solid rgba(0, 0, 0, 0.151);
  margin-top: 15rem;
}

/* Footer */
footer {
  display: grid;
  grid-template-columns: 1fr 1fr 1fr;
  max-width: 120rem;
  margin: 0 auto;
  margin-top: 10rem;
  margin-bottom: 10rem;
  justify-content: center;
  justify-items: center;
  padding: 3rem;
}
.icon {
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  gap: 1rem;
}
.foot-icon-link {
  text-decoration: none;
  display: flex;
  align-items: center;
}
.Copyright-text {
  margin-top: 2rem;
  font-size: 1.8rem;
  color: #666;
}
.foot-logo {
  height: 3.6rem;
  width: 3.6rem;
}
.social {
  display: flex;
  gap: 2rem;
  padding-top: 1rem;
}
.social-icon {
  font-size: 2.4rem;
  color: #666;
}
.contact {
  display: flex;
  flex-direction: column;
  font-size: 1.8rem;
  color: #666;

  gap: 2.4rem;
}
.contact h3 {
  margin-bottom: 1rem;
}
.contact address {
  font-style: normal;
  padding: 1rem 0 0 0;
}
.contact a:link {
  margin-top: auto;
}
.contact a:link,
.contact a:visited {
  text-decoration: none;
  color: #666;
}
.account {
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}
.account h3 {
  font-size: 1.8rem;
  color: #666;
}
.account a:link,
.account a:visited {
  text-decoration: none;
  font-size: 1.8rem;
  color: #666;
}
/* Sign in modal */
.overlay {
  height: 100vh;
  width: 100vw;
  position: absolute;
  top: 0;
  backdrop-filter: blur(10px);
  transition: all 0.4s;
  z-index: 99;
}
.Sign-in-modal {
  height: 100%;
  width: 100%;
  margin: 0 auto;
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 2rem;
  position: absolute;
  top: 0;
  transition: all 0.2s;
}
.Sign-in-window {
  height: 75%;
  width: 50%;
  margin: 0 auto;
  display: grid;
  grid-template-columns: 1fr 1fr;
  justify-content: center;
  border: 1px solid #ff922b;
  box-shadow: 0 1rem 1rem 1rem rgba(0, 0, 0, 0.116);
  border-radius: 5rem;
  background-color: #f3f0ff;
  overflow: hidden;
  z-index: 999;
}
.Sign-in-img {
  overflow: hidden;
}
.Sign-in-window form {
  display: grid;
  grid-template-columns: 1fr;
  grid-template-rows: 1.5fr 1.5fr 1fr;
  align-items: center;
  justify-items: center;
  color: #111;
  padding: 1rem;
}
.Sign-in-window a:link,
.Sign-in-window a:visited {
  text-decoration: none;
  color: #333;
  background-color: #7950f2;
  padding: 1.6rem 2rem;
  border-radius: 1.6rem;
  color: #fff;
  transition: all 0.3s;
  font-size: 1.8rem;
}
.Sign-in-window a:hover,
.Sign-in-window a:active {
  background-color: #cf711f;
}
.Sign-in-window label {
  display: block;
}
.Sign-in-window input {
  border-radius: 0.5rem;
  padding: 1rem;
  border: none;
  font-size: 1.6rem;
}
.Sign-in-window input:focus {
  border: none;
  box-shadow: inset 0 0 0 3px #ff922b;
}
.Sign-in-window .email {
  align-self: end;
  font-size: 2rem;
}
.Sign-in-window .password {
  align-self: center;
  font-size: 2rem;
}

/* Help-Support modal */
.Help-Support {
  width: 40vw;
  height: 55vh;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -60%);
  z-index: 999;
}
.Help-Support form {
  display: flex;
  flex-direction: column;
  background-color: #f3f0ff;
  border: 1px solid #ff922b;
  padding: 3rem;
  gap: 3rem;
  border-radius: 2rem;
}
.Help-Support h2 {
  font-size: 3.6rem;
  color: #333;
}
.Help-Support label {
  font-size: 2.4rem;
  color: #333;
}
.Help-Support input,
.Help-Support textarea {
  font-size: 2rem;
  border: none;
  outline: 1px solid #ff922b;
  /* box-shadow: 0 0 2px 1px rgba(0, 0, 0, 0.479); */
  padding: 0.8rem;
  border-radius: 1rem;
  color: #666;
}

.Help-Support fieldset {
  display: flex;
  flex-direction: column;
  border: none;
}
.Help-Support button {
  align-self: start;
  padding: 1.4rem 1.8rem;
  text-align: center;
  border: none;
  border-radius: 1rem;
  background-color: #7950f2;
  color: #fff;
  font-size: 2rem;
}
.Help-Support button:hover {
  background-color: #5f3dc4;
}
input::placeholder {
  opacity: 50%;
}
textarea::placeholder {
  opacity: 50%;
}
@media (max-width: 70em) {
  html {
    /* 9px / 16px  */
    font-size: 56.25%;
  }
}
@media (max-width: 62em) {
  html {
    /* 9px / 16px  */
    font-size: 52.5%;
  }
  .main-heading {
    font-size: 4.2rem;
  }
  .hero-text p {
    font-size: 1.8rem;
  }
  .link-btn-Explore {
    padding: 1.6rem 1.8rem;
  }
  .CTA-text h3 {
    font-size: 2.8rem;
  }
  .features-box h3 {
    font-size: 2.8rem;
  }
  .features-box p {
    font-size: 1.6rem;
  }
  .btn-mobile-nav {
    display: block;
    z-index: 9999;
  }
  /* Omnifood -nav */

  /* MOBILE NAVIGATION */
  .btn-mobile-nav {
    display: block;
    z-index: 9;
  }

  .main-nav {
    background-color: rgba(255, 255, 255, 0.9);
    -webkit-backdrop-filter: blur(5px);
    backdrop-filter: blur(10px);
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100vh;
    transform: translateX(100%);

    display: flex;
    align-items: center;
    justify-content: center;
    transition: all 0.5s ease-in;
    z-index: 9;
    /* Hide navigation */
    /* Allows NO transitions at all */
    /* display: none; */

    /* 1) Hide it visually */
    opacity: 0;

    /* 2) Make it unaccessible to mouse and keyboard */
    pointer-events: none;

    /* 3) Hide it from screen readers */
    visibility: hidden;
  }

  .nav-open .main-nav {
    opacity: 1;
    pointer-events: auto;
    visibility: visible;
    transform: translateX(0);
  }

  .nav-open .icon-mobile-nav[name="close-outline"] {
    display: block;
  }

  .nav-open .icon-mobile-nav[name="menu-outline"] {
    display: none;
  }

  .main-nav-list {
    flex-direction: column;
    gap: 4.8rem;
  }

  .main-nav-link:link,
  .main-nav-link:visited {
    font-size: 3rem;
  }
  .Help-Support {
    width: 60%;
  }
}
@media (max-width: 44em) {
  html {
    font-size: 50%;
  }
  .container {
    grid-template-columns: 1fr;
    gap: 4rem;
    margin: 0 auto;
    align-content: center;
    text-align: center;
  }
  .main-heading {
    font-size: 4.8rem;
  }
  .hero-text p {
    font-size: 2.4rem;
  }
  .link-btn-Explore {
    padding: 2rem 2.4rem;
  }
  .main-nav {
    opacity: 0;
    pointer-events: none;
    visibility: hidden;
  }
  .menu-icon {
    opacity: 100%;
    pointer-events: auto;
    visibility: visible;
  }
  .step-4 {
    margin-bottom: 5rem;
  }
  .features-box h3 {
    font-size: 2.4rem;
  }
  .features {
    grid-template-columns: 1fr 1fr;
    column-gap: 2rem;
    row-gap: 4rem;
    margin-top: 5rem;
    justify-items: center;
  }
  .features-box {
    max-width: 75%;
  }
  .CTA {
    grid-template-columns: 1fr;
  }
  .Sign-in-window {
    grid-template-columns: 1fr;
    height: 80%;
    width: 60%;
    padding: 2px;
  }
  .Sign-in-window form {
    padding: 1px;
  }
  .Sign-in-window label {
    font-size: 1.6rem;
  }
  .Sign-in-window input {
    font-size: 1.6rem;
    padding: 3px;
  }
  .Sign-in-window a:link,
  .Sign-in-window a:visited {
    padding: 1.2rem 1.4rem;
  }
}

@media (max-width: 34em) {
  html {
    font-size: 47.5%;
  }
  .main-heading {
    font-size: 3.4rem;
  }
  .hero-text p {
    font-size: 1.8rem;
  }

  .link-btn-Explore {
    padding: 1.6rem 2rem;
  }
  .step h3 {
    font-size: 4.8rem;
  }

  .step {
    display: grid;
    grid-template-columns: 1fr;
    grid-template-rows: 1.5fr 1fr;
    align-content: center;
  }
  .step-info h4 {
    font-size: 1.8rem;
  }
  .step-link {
    padding: 1rem 1.2rem;
  }
  .step-info {
    font-size: 1.4rem;
  }
  .link-btn {
    padding: 1.4rem 1.6rem;
  }
  .features h2 {
    font-size: 4.6rem;
  }
  .CTA-text h3 {
    font-size: 2rem;
    letter-spacing: 0;
  }
  .CTA-text p {
    font-size: 1.6rem;
  }
  .CTA-text-link {
    padding: 1rem 1.4rem;
  }
  .CTA-text label {
    padding: 1px;
    font-size: 1.6rem;
  }
  .features-box h3 {
    font-size: 2rem;
    font-weight: 700;
  }
  .features-box p {
    font-size: 1.2rem;
    color: #222;
    font-weight: 500;
  }
  footer {
    gap: 2rem;
    padding: 1rem;
  }
  footer a {
    font-size: 1.6rem;
  }
  .Copyright-text {
    font-size: 1.6rem;
  }
  footer address {
    font-size: 1.6rem;
  }
  .Help-Support {
    width: 70%;
  }
  .Help-Support form {
    padding: 2rem;
  }
  .Help-Support h2 {
    font-size: 3rem;
  }
  .Help-Support label {
    font-size: 1.6rem;
  }
  .Help-Support input,
  .Help-Support textarea {
    font-size: 1.2rem;
    padding: 0.8rem;
  }
  .Help-Support button {
    padding: 1rem 1.2rem;
    font-size: 1.6rem;
  }
}


            </style>
    </head>
     <body>
    <header class="header">
      <a href="../html/index.html" class="logo heading-font">
        <ion-icon name="bus" class="logo-icon"></ion-icon>
        <p class="logo-text">SBTS</p>
      </a>

      <nav class="main-nav">
        <ul class="main-nav-list heading-font">
          <li><a class="main-nav-link" href="#steps">Steps</a></li>
          <li><a class="main-nav-link" href="#features">Features</a></li>
          <li>
            <a class="main-nav-link Sign-in-link" href="login.jsp">Sign in</a>
          </li>
          <!-- <li><a class="main-nav-link" href="#pricing">Pricing</a></li> -->
          <li><a class="main-nav-link nav-cta" href="register.jsp">Sign up</a></li>
        </ul>
      </nav>

      <button class="btn-mobile-nav">
        <ion-icon class="icon-mobile-nav" name="menu-outline"></ion-icon>
        <ion-icon class="icon-mobile-nav" name="close-outline"></ion-icon>
      </button>
    </header>
    <main>
      <section class="hero-section">
        <div class="container">
          <div class="hero-img">
            <img
              src="img/hero-img.jpg"
              width="100%"
              height="100%"
              alt="main-img"
            />
          </div>
          <div class="hero-text">
            <h1 class="main-heading heading-font">Track your bus with SBTS</h1>
            <p>
              The Smart Bus Tracking System is the best choice <br />for
              efficiently managing your buses with real-time location tracking.<br />
              we are a new start up with aim to make transportation more secure
              fast and convenient
            </p>
            <div class="explore">
              <a href="#steps" class="link link-btn-Explore">Explore</a>
            </div>
          </div>
        </div>
      </section>
      
      </div>
      <section class="steps" id="steps">
        <h2 class="Steps-heading heading-font">Steps</h2>
        <div class="step-1-3">
          <div class="step step-1">
            <div class="step-info">
              <h3>01</h3>
              <h4 class="heading-font">Create Account</h4>
              <p>
                Only Fill the form and become the member SBTS family and explore
                our various plans
              </p>
            </div>
            <div class="step-img">
              <img
                src="img/undraw_Sign_up_n6im.png"
                height="100%"
                width="100%"
              />
            </div>
          </div>
          <div class="step step-3">
            <div class="step-info">
              <h3>03</h3>
              <h4 class="heading-font">HardWare Installation</h4>
              <p>
                We will come to your place with all required things and setup
                all the equipments
              </p>
            </div>
            <div class="step-img">
              <img
                src="img/undraw_Order_delivered_re_v4ab.png"
                height="100%"
                width="100%"
              />
            </div>
          </div>
        </div>
        <div class="step-2-4">
          <div class="step step-2">
            <div class="step-info">
              <h3>02</h3>
              <h4 class="heading-font">Choose Number of vehicles</h4>
              <p>
                Choose how many vehicles you want to add for tracking and select
                the plan as per your need.
              </p>
            </div>
            <div class="step-img">
              <img
                src="img/undraw_search_app_oso2.png"
                height="100%"
                width="100%"
              />
            </div>
          </div>
          <div class="step step-4">
            <div class="step-info">
              <h3>04</h3>
              <h4 class="heading-font">Software Setup</h4>
              <p>
                We will create the admin user for your organization and provide
                you the all essential functionality to efficiently manage your
                buses.
              </p>
            </div>
            <div class="step-img">
              <img
                src="img/undraw_Software_engineer_re_tnjc.png"
                height="100%"
                width="100%"
              />
            </div>
          </div>
        </div>
      </section>
      <section class="features" id="features">
        <h2 class="heading-font features-heading">Features</h2>
        <div class="features-box box-1">
          <img
            src="img/undraw_My_location_re_r52x.png"
            height="100%"
            width="100%"
            alt="location tracking image"
          />
          <h3 class="heading-font">Live Bus Tracking</h3>
          <p>
            Track your organization bus live with SBTS accurate tracking ystem
          </p>
        </div>
        <div class="features-box box-1">
          <img
            src="img/undraw_Messenger_re_8bky.png"
            height="100%"
            width="100%"
            alt="location tracking image"
          />
          <h3 class="heading-font">Inform Passenger</h3>
          <p>
            Our automatic message sender will inform all passenger which are at
            next stop in how much time bus will reach there stop.
          </p>
        </div>
        <div class="features-box box-1">
          <img
            src="img/undraw_Surveillance_re_8tkl.png"
            height="100%"
            width="100%"
            alt="location tracking image"
          />
          <h3 class="heading-font">Monitor your drivers</h3>
          <p>
            With the help of live tracking you can monitor which routes drivers
            are taking are they following speed limits and much more..
          </p>
        </div>
        <div class="features-box box-1">
          <img
            src="img/undraw_Savings_re_eq4w.png"
            height="100%"
            width="100%"
            alt="location tracking image"
          />
          <h3 class="heading-font">Value For Money</h3>
          <p>
            We are new startup so we are not going to charge any brand cost to
            you will get all things at fair cost.
          </p>
        </div>
      </section>
      <div class="CTA-container">
        <div class="empty" id="cta"></div>
        <section class="CTA" >
          <div class="CTA-text">
            <h3 class="heading-font">
              Becoming member of SBTS family is one step away
            </h3>
            <p>
              Sign up to SBTS and explore our various plan's and give us chance
              to serve you the best bus tracking service
            </p>
            <div class="CTA-btn">
              <a href="../html/signup.html"  class="CTA-link heading-font">Sign Up</a>
            </div>
          </div>
          <div class="CTA-img">
            <img
              src="img/undraw_fill_form_re_cwyf.png"
              height="100%"
              width="100%"
              alt="form filling person"
            />
          </div>
        </section>
      </div>
    </main>
    <div class="seprate"></div>
    <footer>
      <div class="icon">
        <div>
          <a href="#" class="heading-font foot-icon-link">
            <ion-icon name="bus" class="foot-logo"></ion-icon>
            <p class="logo-text">SBTS</p>
          </a>
        </div>
        <div class="social">
          <a href="#">
            <ion-icon name="logo-instagram" class="social-icon"></ion-icon
          ></a>
          <a href="#"><ion-icon name="logo-facebook" class="social-icon"></ion-icon
          ></a>
          <a href="#"
            ><ion-icon name="logo-linkedin" class="social-icon"></ion-icon
          ></a>
        </div>
        <div class="Copyright-text">
          Copyright ©<span class="year"> 2023</span> by SBTS,Inc. <br />All rights reserved.
        </div>
      </div>
      <div class="contact">
        <h3>Contact us</h3>
        <address>
          R. S. No. 865 A-Ward, Salokhe Nagar, Kolhapur, Maharashtra 416001
        </address>
        <a href="tel:9359792781">9359792781</a>
        <a href="mailto:track@sbts.com">track@sbts.com</a>
      </div>
      <div class="account">
        <h3>Account</h3>
        <a href="#cta">Create account</a>
        <a href="#" class="Sign-in-link-foot">Sign in</a>
        <a href="#" class="Help">Help & Support</a>
      </div>
    </footer>
    <!-- ionicons -->
    <script
      type="module"
      src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"
    ></script>
    <script
      nomodule
      src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"
    ></script>

    <!-- My Script -->
    <script>
        // Make mobile navigation work

const btnNavEl = document.querySelector(".btn-mobile-nav");
const headerEl = document.querySelector(".header");

btnNavEl.addEventListener("click", function () {
  headerEl.classList.toggle("nav-open");
});

///////////////////////////////////////////////////////////
// Smooth scrolling animation

const allLinks = document.querySelectorAll("a:link");

allLinks.forEach(function (link) {
  link.addEventListener("click", function (e) {
    // e.preventDefault(); because of this we are not able to move from index.html to user.html
    const href = link.getAttribute("href");

    // Scroll back to top
    if (href === "#")
      window.scrollTo({
        top: 0,
        behavior: "smooth",
      });

    // Scroll to other links
    if (href !== "#" && href.startsWith("#")) {
      const sectionEl = document.querySelector(href);
      sectionEl.scrollIntoView({ behavior: "smooth" });
    }

    // Close mobile naviagtion
    if (link.classList.contains("main-nav-link"))
      headerEl.classList.toggle("nav-open");
  });
});

///////////////////////////////////////////////////////////
// Sticky navigation
const sectionHeroEl = document.querySelector(".hero-section");

const obs = new IntersectionObserver(
  function (entries) {
    const ent = entries[0];
    // console.log(ent);

    if (ent.isIntersecting === false) {
      document.querySelector("header").classList.add("sticky");
    }

    if (ent.isIntersecting === true) {
      document.querySelector("header").classList.remove("sticky");
    }
    if (ent.isIntersecting === false) {
      overLay.classList.add("hidden");
      helpWindow.classList.add("hidden");
      signInModal.classList.add("hidden");
      signInLink1.computedStyleMap.border = "none";
    }
  },
  {
    // In the viewport
    root: null,
    threshold: 0,
    rootMargin: "-80px",
  }
);
obs.observe(sectionHeroEl);

    </script>
  </body>
</html>
