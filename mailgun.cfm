<cfscript>
// default params
param email_from = "fromemail@domain.com";
param email_to = "toemail@domain.com";
param reply_to = "replyto@domain.com";
param contact_name = "Joel";
param email_bcc = "";
param email_subject = "Featured in a blog post: Your quote request";

// custom paramamter for template start
param email_content = "<p>Welcome to Convurt, the agency marketplace.</p>";
param email_button_link = ""; 
param email_button_text = "";
param template = "template-name";
param tags =  ['coldfusion', 'info'];
param t_variables = serializeJSON({
    "content":"#email_content#",
    "company_contact":"#contact_name#",
    "email_button_text":"#email_button_text#",
    "email_button_link":"#email_button_link#"
});
// custom paramamter for template end

// send the email via mailgun api
cfhttp(method="POST", url="https://api.mailgun.net/v3/DOMAIN.COM/messages", result="response", username="api", password="MAILGUN API KEY") {
    cfhttpparam(name="from", type="formfield", value="#email_from#");
    cfhttpparam(name="h:Reply-To", type="formfield", value="#reply_to#");
    cfhttpparam(name="to", type="formfield", value="#email_to#");
    cfhttpparam(name="subject", type="formfield", value="#email_subject#");
    // loop over tag list, I could not get it to work correctly as a list
    for (t in tags) {
        cfhttpparam(name="o:tag", type="formfield", value="#t#");
    }
    cfhttpparam(name="template", type="formfield", value="#template#");
    // custom paramamter for template
    cfhttpparam(name="t:variables", type="formfield", value="#t_variables#");
}
</cfscript>