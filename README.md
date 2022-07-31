
# Mailgun SendMail with Coldfusion

A simple Coldfusion script to send mail with the Mailgun API


## Authors

- [@convurt](https://github.com/convurt/)


## Usage/Examples

```javascript
Set the DOMAIN.COM to your sending DOMAIN in the below line

url="https://api.mailgun.net/v3/DOMAIN.COM/messages",

Set the password="MAILGUN API KEY" to your MAILGUN API
```

Custom paramaters and templates
```javascript
In the lines below I am using a template I built in MAILGUN.  If you are not using a template, you could remove these.
If you are passing in HTML, the templates use 3 handlebars for HTML. {{{content}}}

param template = "template-name";

param t_variables = serializeJSON({
    "content":"#email_content#",
    "company_contact":"#contact_name#",
    "email_button_text":"#email_button_text#",
    "email_button_link":"#email_button_link#"
});

cfhttpparam(name="t:variables", type="formfield", value="#t_variables#");

```


## Installation

Add the file to your website project and include the file where needed.  Pass in dynamic parameters as needed. 

```bash
<cfinclude template="/mailgun.cfm"> 
```
    
## License

[MIT](https://choosealicense.com/licenses/mit/)

