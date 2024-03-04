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
        <link rel="stylesheet" href="css/indexJsp.css">
    </head>
     <body>
    <header class="header">
      <a href="index.jsp" class="logo heading-font">
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
              <a href="register.jsp"  class="CTA-link heading-font">Sign Up</a>
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
        <a href="register.jsp">Create account</a>
        <a href="login.jsp" class="Sign-in-link-foot">Sign in</a>
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
