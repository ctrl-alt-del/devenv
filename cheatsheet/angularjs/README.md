Cheatsheet for AngularJS
========================

## Definition
#### Javascript
[JavaScript](https://github.com/ctrl-alt-del/devenv/tree/master/language/javascript) is a dynamic programming language; mostly being used in web applications.

#### AngularJS
AngularJS is a Javascript framework specifically design for building [**Single Page Application**](#single-page-application).

#### Single Page Application
Single Page Application is an app that runs everything inside browser (app logic, data processing user flow and templates) and
never does a full page reload
(see Gmail as an example).

## Advantages
* reduce the amount of resource needed on server
* distribute all the hard works to users’ browser and server just serving static files
* once app is loaded, only need few calls to server reducing latency and improve user experience

## Disadvantages
* heavily rely on Javascript, if user doesn’t support it, or there is a bug in it, the app won’t run
* unable to be crawled by search engines
automatic previews from social sharing sites don’t work very well with Javascript
* Although there are methods to make the Javascript sites crawlable, it requires quite a bit of effort and it is hard to maintain; moreover, it is a potential SEO pitfall
* Hard to be tracked by analytics because it never trigger new page load
slower first page load

## Three points to consider a framework:
* crawlability
* analytics integration
* page load speed

## Verdict
good for data rich intensive app, bad for blogs or marketing sites
