# Yanit - Yet Another (Netzke) Issue Tracker

Yanit is a demo application that illustrates usage of [Netzke](http://netzke.org). It is a very simple issue tracker driven by the following models and relationships between them:

`Issue` that `belongs_to` `User` and `belongs_to` `Project`.

This application is deployed on [Heroku](http://yanit.netzke.org) - try it out live.

## Installation

* Create your database.yml
* bundle install
* rake db:setup

Test data is included.

Have fun!

---

(c) 2015 [Max Gorin](http://twitter.com/mxgrn)

Released under the MIT license **except for**:

* Sencha Ext JS: http://www.sencha.com/products/extjs/license/
* FamFamFam icons (public/images/icons): http://creativecommons.org/licenses/by/2.5/
