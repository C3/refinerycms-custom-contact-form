#Refinery Custom Contact Form

![Refinery Custom Contact Form](http://www.c3businesssolutions.com/system/images/BAhbBlsHOgZmIi0yMDEzLzA1LzE0LzE2XzIxXzI5XzQ3NV9jb250YWN0X2Zvcm0ucG5n/contact-form.png)

#### Installation on Refinery 2.0.0 or above.

To install the migrations, run:

    rails generate refinery:contact_form_fields
    rake db:migrate

Add pages to the database and you're done:

    rake db:seed

## About

__A customisable contact form for Refinery CMS with automatic field validation.__

Lets you:
* Define the fields in your contact form. You can choose from single-line text, multi-line text, email or phone number.
* Produce an HTML5 compliant form
* Define who the inquiries are sent to

## How do I set the receiving address?

Go into your 'Settings' tab in the Refinery admin area and edit the 'Contact Form Recipients' setting. Multiple recipients can be specified by seperating any email addresses with a comma.
